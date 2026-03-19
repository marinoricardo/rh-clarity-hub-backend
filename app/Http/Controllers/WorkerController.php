<?php

namespace App\Http\Controllers;

use App\Models\Contract;
use App\Models\Document;
use App\Models\FundoAlocado;
use App\Models\UnidadeOrganica;
use App\Models\Worker;
use App\Models\WorkerCompanyData;
use App\Models\WorkerStep;
use Carbon\Carbon;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Log;
use Illuminate\Support\Facades\Storage;
use Illuminate\Validation\ValidationException;

class WorkerController extends Controller
{
    /**
     * List all workers with steps and relations
     */
    public function index()
    {
        try {
            $user = Auth::user();

            $workers = Worker::with([
                'steps',
                'employmentData',
                'documents',
                'attendances',
                'contracts' => function ($query) {
                    $query->orderBy('created_at', 'desc');
                },
                'performances'
            ])
                ->where('deleted', false)
                ->where('active', request()->boolean('active', true))

                ->when($user->role === 'normal', function ($query) use ($user) {
                    $query->whereHas('employmentData', function ($q) use ($user) {
                        $q->where('organizational_unit', $user->unit_organic);
                    });
                })

                ->whereHas('steps', function ($query) {
                    $query->where([
                        ['step_personal', true],
                        ['step_company', true],
                        ['step_documents', true],
                        ['completed', true],
                    ]);
                })

                ->orderBy('created_at', 'desc')
                ->get();

            return response()->json([
                'success' => true,
                'data' => $workers,
            ]);
        } catch (\Throwable $e) {
            Log::error('Failed to list workers', [
                'error' => $e->getMessage(),
                'trace' => $e->getTraceAsString(),
            ]);

            return response()->json([
                'success' => false,
                'message' => 'Failed to fetch workers',
            ], 500);
        }
    }





    public function pendingWorkers()
    {
        // Busca apenas workers que têm steps incompletos
        $workers = Worker::with('steps')
            ->whereHas('steps', function ($query) {
                $query->where('completed', false);
            })
            ->get();

        $result = $workers->map(function ($worker) {
            $step = $worker->steps;

            $totalSteps = 3;
            $completedSteps = 0;

            if ($step->step_personal) $completedSteps++;
            if ($step->step_company) $completedSteps++;
            if ($step->step_documents) $completedSteps++;

            // Determina a etapa atual (primeira incompleta)
            if (!$step->step_personal) {
                $currentStep = 'Personal Data';
            } elseif (!$step->step_company) {
                $currentStep = 'Company Data';
            } elseif (!$step->step_documents) {
                $currentStep = 'Documents';
            } else {
                $currentStep = 'Completed';
            }

            $percentage = round(($completedSteps / $totalSteps) * 100);

            return [
                'worker_id' => $worker->id,
                'full_name' => $worker->full_name,
                'current_step' => $currentStep,
                'progress_percentage' => $percentage,
                'last_update' => $step->updated_at->toDateTimeString(), // pega o updated_at do step
            ];
        })
            // Ordena pela última atualização do step
            ->sortByDesc('last_update')
            ->values(); // reseta os índices para array sequencial

        return response()->json([
            'success' => true,
            'pending_workers' => $result
        ]);
    }



    /**
     * Store a newly created worker
     */
    public function store(Request $request)
    {
        DB::beginTransaction();

        try {
            $validated = $request->validate([
                'full_name' => 'required|string|max:255',
                'date_of_birth' => 'required|date',
                'tax_number' => 'required|string|max:255',
                'gender' => 'required|string',
                'marital_status' => 'required|string',

                'document_type' => 'required|string',
                'document_number' => 'required|string',

                'province' => 'required|string',
                'district' => 'required|string',
                'address' => 'required|string',
                'neighborhood' => 'nullable|string',
                'postal_box' => 'nullable|string',
                'city' => 'required|string',

                'work_email' => 'required|email',
                'alternative_email' => 'nullable|email',
                'work_contact' => 'nullable|string',
                'alternative_contact' => 'nullable|string',
                'phone' => 'required|string',

                'job_function' => 'required|string',

                'nib_iban' => 'required|string',
                'bank' => 'required|string',
            ]);
            $validated['user_id'] = Auth::id();

            if (Auth::user()->role == "normal")
                $validated['active'] = false;

            $worker = Worker::create($validated);

            // Create worker steps (initial state)
            $worker->steps()->create([
                'step_personal' => true,
                'step_company' => false,
                'step_documents' => false,
                'completed' => false,
            ]);

            DB::commit();

            return response()->json([
                'success' => true,
                'message' => 'Worker created successfully',
                'data' => [
                    'worker' => $worker->load('steps'),
                ],
            ], 201);
        } catch (ValidationException $e) {
            DB::rollBack();

            return response()->json([
                'success' => false,
                'message' => $e->getMessage(),
                'errors' => $e->errors(),
            ], 422);
        } catch (\Exception $e) {
            DB::rollBack();

            Log::error('Worker creation failed', [
                'error' => $e->getMessage(),
                'trace' => $e->getTraceAsString(),
            ]);

            return response()->json([
                'success' => false,
                'message' => 'Internal server error ' . $e->getMessage(),
                'error' => 'Failed to create worker',
            ], 500);
        }
    }

    public function storeCompanyData(Request $request, $workerId)
    {
        DB::beginTransaction();

        try {
            // Validação dos dados empresariais
            $validated = $request->validate([
                'hire_date' => 'required|date',
                'end_date' => 'nullable|date|after_or_equal:admission_date',
                'inss_number' => 'nullable|string|max:255',
                'contract_type' => 'required|string',
                'academic_level' => 'required|string',
                'area' => 'nullable|string|max:255',
                'region' => 'nullable|string|max:255',
                'department' => 'nullable|string|max:255',
                'organic_unit' => 'required|string|max:255',
                'sector' => 'nullable|string|max:255',
                'salary' => 'required|numeric|min:0',
                'status' => 'required|string',
            ]);

            $validated['organizational_unit'] = $request->organic_unit;

            // Pegar worker garantindo que pertence ao usuário autenticado
            $worker = Worker::where('id', $workerId)
                //->where('user_id', Auth::id())
                ->firstOrFail();

            // Cria ou atualiza WorkerCompanyData
            $companyData = WorkerCompanyData::updateOrCreate(
                ['worker_id' => $worker->id],
                $validated
            );

            $un_organica = UnidadeOrganica::where('name', trim($request->organic_unit))->first();
            $fundos_alocados = FundoAlocado::where('unidade_organica_id', $un_organica->id)->first();

            if (!$fundos_alocados) {
                return response()->json([
                    'success' => false,
                    'message' => 'Não há fundos alocados nessa unidade orgânica',
                    'errors' => null,
                ], 400);
            }

            $saldoDisponivel = $fundos_alocados->valor_alocado - $fundos_alocados->total_salarios_pagos;
            //dd($saldoDisponivel);
            if ($request->salary > $saldoDisponivel) {
        return response()->json([
            'success' => false,
            'message' => 'O salário excede o valor disponível do fundo',
            'errors' => [
                'saldo_disponivel' => $saldoDisponivel,
                'salario_informado' => $request->salary 
            ],
        ], 400);
            }


            $fundos_alocados->total_salarios_pagos += $request->salary;
            $fundos_alocados->valor_alocado -= $request->salary;
            $fundos_alocados->save();



            // Atualiza os steps
            $workerStep = WorkerStep::firstOrCreate(['worker_id' => $worker->id]);
            $workerStep->update([
                'step_company' => true,
                'completed' => $workerStep->step_personal && $workerStep->step_documents && true
            ]);


            // Determinar o status do contrato
            $status = 'ativo';
            if (!empty($validated['end_date'])) {
                $endDate = Carbon::parse($validated['end_date']);
                if ($endDate->isPast()) {
                    $status = 'expirado';
                }
            }

            $contract = Contract::create([
                'worker_id' => $worker->id,
                'contract_type' => $validated['contract_type'],
                'start_date' => $validated['hire_date'],
                'end_date' => $validated['end_date'] ?? null,
                'status' => $status,
            ]);


            DB::commit();

            return response()->json([
                'success' => true,
                'message' => 'Company data saved successfully',
                'data' => [
                    'worker' => $worker->load('employmentData', 'steps')
                ]
            ], 200);
        } catch (\Illuminate\Validation\ValidationException $e) {
            DB::rollBack();
            return response()->json([
                'success' => false,
                'message' => $e->getMessage(),
                'errors' => $e->errors(),
            ], 422);
        } catch (\Throwable $e) {
            DB::rollBack();
            Log::error('Failed to save company data', [
                'error' => $e->getMessage(),
                'trace' => $e->getTraceAsString()
            ]);

            return response()->json([
                'success' => false,
                'message' => 'Ocorreu um erro interno ' . $e->getMessage(),
                'error' => 'Failed to save company data',
            ], 500);
        }
    }

    /**
     * Upload worker documents
     */
    public function uploadWorkerDocuments(Request $request, $workerId)
    {
        DB::beginTransaction();

        try {
            // Pegar worker do usuário autenticado
            $worker = Worker::where('id', $workerId)
                //->where('user_id', Auth::id())
                ->firstOrFail();

            // Validação dos arquivos
            $validated = $request->validate([
                'nuit_document' => 'nullable|file|max:10240',
                'identity_document' => 'nullable|file|max:10240',
                'education_certificate' => 'nullable|file|max:10240',
                'cv' => 'nullable|file|max:10240',
                'other_certifications' => 'nullable|file|max:10240',
                'declaracao_documento_url' => 'nullable|file|max:10240',
            ]);

            // Pega ou cria o registro de documentos
            $document = Document::firstOrCreate(['worker_id' => $worker->id]);

            // Mapeamento arquivos → campos no DB
            $fileMap = [
                'nuit_document' => 'nuit_document_url',
                'identity_document' => 'identity_document_url',
                'education_certificate' => 'education_certificate_url',
                'cv' => 'cv_url',
                'other_certifications' => 'other_certifications_url',
                'declaracao_documento_url' => 'other_certifications_url',
            ];

            $uploaded = [];

            foreach ($fileMap as $inputName => $dbField) {
                if ($request->hasFile($inputName)) {
                    $file = $request->file($inputName);
                    $path = $file->store("worker_documents/{$worker->id}", 'public');
                    $url = Storage::url($path);

                    $document->$dbField = env('APP_IMAGE_URL') . $url;
                    $uploaded[$inputName] = $url;
                }
            }

            $document->save();

            // Atualiza worker steps
            $workerStep = WorkerStep::firstOrCreate(['worker_id' => $worker->id]);
            $workerStep->update([
                'step_documents' => true,
                'completed' => $workerStep->step_personal && $workerStep->step_company && true
            ]);

            DB::commit();

            return response()->json([
                'success' => true,
                'message' => 'Documents uploaded successfully',
                'data' => [
                    'worker' => $worker->load('documents', 'steps'),
                    'uploaded' => $uploaded
                ]
            ], 200);
        } catch (\Illuminate\Validation\ValidationException $e) {
            DB::rollBack();
            return response()->json([
                'success' => false,
                'message' => 'Validation failed ' . $e->getMessage(),
                'errors' => $e->errors()
            ], 422);
        } catch (\Throwable $e) {
            DB::rollBack();
            Log::error('Failed to upload worker documents', [
                'error' => $e->getMessage(),
                'trace' => $e->getTraceAsString()
            ]);

            return response()->json([
                'success' => false,
                'message' => 'Internal server error ' . $e->getMessage(),
                'error' => 'Failed to upload worker documents'
            ], 500);
        }
    }

    /**
     * Update worker personal data
     */
    public function update(Request $request, $workerId)
    {
        DB::beginTransaction();

        try {
            $worker = Worker::where('id', $workerId)
                //->where('user_id', Auth::id())
                ->firstOrFail();


            $validated = $request->validate([
                'full_name' => 'required|string|max:255',
                'date_of_birth' => 'required|date',
                'tax_number' => 'required|string|max:255',
                'gender' => 'required|string',
                'marital_status' => 'required|string',

                'document_type' => 'required|string',
                'document_number' => 'required|string',

                'province' => 'required|string',
                'district' => 'required|string',
                'address' => 'required|string',
                'neighborhood' => 'nullable|string',
                'postal_box' => 'nullable|string',
                'city' => 'required|string',

                'work_email' => 'nullable',
                'alternative_email' => 'nullable',
                'work_contact' => 'nullable|string',
                'alternative_contact' => 'nullable|string',
                'phone' => 'required|string',

                'job_function' => 'required|string',
            ]);

            $worker->update($validated);

            // Garantir step pessoal
            $workerStep = WorkerStep::firstOrCreate(['worker_id' => $worker->id]);
            $workerStep->update([
                'step_personal' => true,
                'completed' => $workerStep->step_company && $workerStep->step_documents
            ]);

            DB::commit();

            return response()->json([
                'success' => true,
                'message' => 'Worker updated successfully',
                'data' => [
                    'worker' => $worker->load('steps')
                ]
            ], 200);
        } catch (\Illuminate\Validation\ValidationException $e) {
            DB::rollBack();
            return response()->json([
                'success' => false,
                'errors' => $e->errors()
            ], 422);
        } catch (\Throwable $e) {
            DB::rollBack();
            Log::error('Worker update failed', ['error' => $e->getMessage()]);

            return response()->json([
                'success' => false,
                'message' => 'Internal server error ' .  $e,
            ], 500);
        }
    }

    /**
     * Update worker company data
     */
    public function updateCompanyData(Request $request, $workerId)
    {
        DB::beginTransaction();

        try {
            $validated = $request->validate([
                'hire_date' => 'required|date',
                'end_date' => 'nullable|date|after_or_equal:hire_date',
                'inss_number' => 'nullable|string|max:255',
                'contract_type' => 'required|string',
                'academic_level' => 'required|string',
                'area' => 'nullable|string|max:255',
                'region' => 'nullable|string|max:255',
                'department' => 'nullable|string|max:255',
                'organic_unit' => 'required|string|max:255',
                'sector' => 'required|string|max:255',
                'salary' => 'required|numeric|min:0',
                'status' => 'required|string',
            ]);

            $worker = Worker::where('id', $workerId)
                ->where('user_id', Auth::id())
                ->firstOrFail();

            WorkerCompanyData::updateOrCreate(
                ['worker_id' => $worker->id],
                array_merge($validated, [
                    'organizational_unit' => $validated['organic_unit']
                ])
            );

            // Atualizar step
            $workerStep = WorkerStep::firstOrCreate(['worker_id' => $worker->id]);
            $workerStep->update([
                'step_company' => true,
                'completed' => $workerStep->step_personal && $workerStep->step_documents
            ]);

            // Atualizar contrato
            $status = 'ativo';
            if (!empty($validated['end_date']) && Carbon::parse($validated['end_date'])->isPast()) {
                $status = 'expirado';
            }

            Contract::updateOrCreate(
                ['worker_id' => $worker->id],
                [
                    'contract_type' => $validated['contract_type'],
                    'start_date' => $validated['hire_date'],
                    'end_date' => $validated['end_date'],
                    'status' => $status,
                ]
            );

            DB::commit();

            return response()->json([
                'success' => true,
                'message' => 'Company data updated successfully',
                'data' => [
                    'worker' => $worker->load('employmentData', 'steps')
                ]
            ], 200);
        } catch (\Throwable $e) {
            DB::rollBack();
            Log::error('Company data update failed', ['error' => $e->getMessage()]);

            return response()->json([
                'success' => false,
                'message' => 'Internal server error'
            ], 500);
        }
    }

    /**
     * Update worker documents
     */
    public function updateWorkerDocuments(Request $request, $workerId)
    {
        DB::beginTransaction();

        try {
            $worker = Worker::where('id', $workerId)
                ->where('user_id', Auth::id())
                ->firstOrFail();

            $validated = $request->validate([
                'nuit_document' => 'nullable|file|max:10240',
                'identity_document' => 'nullable|file|max:10240',
                'education_certificate' => 'nullable|file|max:10240',
                'cv' => 'nullable|file|max:10240',
                'other_certifications' => 'nullable|file|max:10240',
            ]);

            $document = Document::firstOrCreate(['worker_id' => $worker->id]);

            $fileMap = [
                'nuit_document' => 'nuit_document_url',
                'identity_document' => 'identity_document_url',
                'education_certificate' => 'education_certificate_url',
                'cv' => 'cv_url',
                'other_certifications' => 'other_certifications_url',
            ];

            $uploaded = [];

            foreach ($fileMap as $input => $dbField) {
                if ($request->hasFile($input)) {
                    $file = $request->file($input);
                    $path = $file->store("worker_documents/{$worker->id}", 'public');
                    $document->$dbField = env('APP_IMAGE_URL') . Storage::url($path);
                    $uploaded[] = $input;
                }
            }

            $document->save();

            $workerStep = WorkerStep::firstOrCreate(['worker_id' => $worker->id]);
            $workerStep->update([
                'step_documents' => true,
                'completed' => $workerStep->step_personal && $workerStep->step_company
            ]);

            DB::commit();

            return response()->json([
                'success' => true,
                'message' => 'Documents updated successfully',
                'data' => [
                    'worker' => $worker->load('documents', 'steps'),
                    'updated_files' => $uploaded
                ]
            ], 200);
        } catch (\Throwable $e) {
            DB::rollBack();
            Log::error('Document update failed', ['error' => $e->getMessage()]);

            return response()->json([
                'success' => false,
                'message' => 'Internal server error'
            ], 500);
        }
    }

    /**
     * Show worker with relations
     */
    public function show($id)
    {
        try {
            $worker = Worker::with([
                'steps',
                'employmentData',
                'documents',
                'attendances',
                'contracts' => function ($query) {
                    $query->orderBy('created_at', 'desc');
                },
                'performances'
            ])->findOrFail($id);

            return response()->json([
                'success' => true,
                'data' => $worker,
            ]);
        } catch (\Throwable $e) {
            return response()->json([
                'success' => false,
                'message' => 'Worker not found',
            ], 404);
        }
    }

    /**
     * Approve worker (set status = true)
     */
    public function approve($id)
    {
        try {
            $user = auth()->user();

            // Bloquear utilizador normal
            if ($user->role === 'normal') {
                return response()->json([
                    'success' => false,
                    'message' => 'Não tem permissões para executar esta ação.',
                ], 403);
            }

            $worker = Worker::findOrFail($id);

            $worker->active = true;
            $worker->save();

            return response()->json([
                'success' => true,
                'message' => 'Worker approved successfully',
                'data' => $worker
            ]);
        } catch (\Illuminate\Database\Eloquent\ModelNotFoundException $e) {
            return response()->json([
                'success' => false,
                'message' => 'Worker not found',
            ], 404);
        }
    }


    /**
     * Update worker steps (wizard control)
     */
    public function updateSteps(Request $request, $workerId)
    {
        DB::beginTransaction();

        try {
            $validated = $request->validate([
                'step_personal' => 'boolean',
                'step_company' => 'boolean',
                'step_documents' => 'boolean',
            ]);

            $worker = Worker::with('steps')->findOrFail($workerId);

            $worker->steps->update($validated);

            // Auto-complete
            if (
                $worker->steps->step_personal &&
                $worker->steps->step_company &&
                $worker->steps->step_documents
            ) {
                $worker->steps->update(['completed' => true]);
            }

            DB::commit();

            return response()->json([
                'success' => true,
                'message' => 'Worker steps updated',
                'data' => $worker->steps,
            ]);
        } catch (ValidationException $e) {
            DB::rollBack();

            return response()->json([
                'success' => false,
                'message' => 'Validation error',
                'errors' => $e->errors(),
            ], 422);
        } catch (\Throwable $e) {
            DB::rollBack();

            Log::error('Worker step update failed', [
                'worker_id' => $workerId,
                'error' => $e->getMessage(),
            ]);

            return response()->json([
                'success' => false,
                'message' => 'Failed to update worker steps',
            ], 500);
        }
    }
}
