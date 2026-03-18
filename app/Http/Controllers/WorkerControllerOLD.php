<?php

namespace App\Http\Controllers;

use App\Models\Worker;
use App\Models\WorkerStep;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Log;
use Illuminate\Validation\ValidationException;

class WorkerControllerOLD extends Controller
{
    /**
     * List all workers with steps and relations
     */
    public function index()
    {
        try {
            $workers = Worker::with([
                'steps',
                'employmentData',
                'documents'
            ])->get();

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

                'work_email' => 'required|email|unique:workers,work_email',
                'alternative_email' => 'nullable|email',
                'work_contact' => 'nullable|string',
                'alternative_contact' => 'nullable|string',
                'phone' => 'required|string',

                'job_function' => 'required|string',
            ]);
            $validated['user_id'] = Auth::id();
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
                'message' => 'Validation error',
                'errors' => $e->errors(),
            ], 422);
        } catch (\Throwable $e) {
            DB::rollBack();

            Log::error('Worker creation failed', [
                'error' => $e->getMessage(),
                'trace' => $e->getTraceAsString(),
            ]);

            return response()->json([
                'success' => false,
                'message' => 'Internal server error',
                'error' => 'Failed to create worker',
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
                'documents'
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
