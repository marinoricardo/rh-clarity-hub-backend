<?php

namespace App\Http\Controllers;

use App\Models\WorkerPerfomance;
use App\Models\WorkerPerformance;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Log;
use Illuminate\Support\Facades\Storage;

class WorkerPerformanceController extends Controller
{
    /**
     * List all performances
     */
    public function index()
    {
        try {
            $performances = WorkerPerfomance::with('worker')->get();

            return response()->json([
                'success' => true,
                'data' => $performances,
            ]);
        } catch (\Throwable $e) {
            Log::error('Failed to fetch performances', [
                'error' => $e->getMessage(),
                'trace' => $e->getTraceAsString(),
            ]);

            return response()->json([
                'success' => false,
                'message' => 'Failed to fetch performances',
            ], 500);
        }
    }

    /**
     * Store a new performance
     */
    public function store(Request $request)
    {
        // Validação dos dados recebidos
        $request->validate([
            'worker_id' => 'required|exists:workers,id',
            'attachment' => 'nullable|file', // até 10MB
            'status' => 'required|string',
        ]);

        DB::beginTransaction();
        try {
            $performance = new WorkerPerfomance();
            $performance->worker_id = $request->worker_id;
            $performance->status = $request->status;
            $performance->perfomance_date = now();

            // Upload do arquivo, se existir
            if ($request->hasFile('attachment')) {
                $file = $request->file('attachment');
                $path = $file->store("worker_performances/{$request->worker_id}", 'public');
                $url = Storage::url($path);

                // Salva a URL completa no banco
                $performance->attachament = env('APP_IMAGE_URL') . $url;
            }

            $performance->save();

            DB::commit();

            return response()->json([
                'success' => true,
                'message' => 'Performance created successfully',
                'data' => $performance,
            ], 201);
        } catch (\Throwable $e) {
            DB::rollBack();
            Log::error('Failed to create performance', [
                'error' => $e->getMessage(),
                'trace' => $e->getTraceAsString(),
            ]);

            return response()->json([
                'success' => false,
                'message' => 'Failed to create performance ' . $e->getMessage(),
            ], 500);
        }
    }

    /**
     * Show a single performance
     */
    public function show($id)
    {
        try {
            $performance = WorkerPerfomance::with('worker')->findOrFail($id);

            return response()->json([
                'success' => true,
                'data' => $performance,
            ]);
        } catch (\Throwable $e) {
            return response()->json([
                'success' => false,
                'message' => 'Performance not found',
            ], 404);
        }
    }

    /**
     * Update a performance
     */
    public function update(Request $request, $id)
    {
        $request->validate([
            'attachament' => 'sometimes|required|string',
            'status' => 'sometimes|required|string',
        ]);

        DB::beginTransaction();
        try {
            $performance = WorkerPerfomance::findOrFail($id);

            $performance->update($request->only(['attachament', 'status']));

            DB::commit();

            return response()->json([
                'success' => true,
                'message' => 'Performance updated successfully',
                'data' => $performance,
            ]);
        } catch (\Throwable $e) {
            DB::rollBack();
            Log::error('Failed to update performance', [
                'error' => $e->getMessage(),
                'trace' => $e->getTraceAsString(),
            ]);

            return response()->json([
                'success' => false,
                'message' => 'Failed to update performance',
            ], 500);
        }
    }

    /**
     * Delete a performance
     */
    public function destroy($id)
    {
        try {
            $performance = WorkerPerfomance::findOrFail($id);
            $performance->delete();

            return response()->json([
                'success' => true,
                'message' => 'Performance deleted successfully',
            ]);
        } catch (\Throwable $e) {
            return response()->json([
                'success' => false,
                'message' => 'Failed to delete performance',
            ], 500);
        }
    }
}
