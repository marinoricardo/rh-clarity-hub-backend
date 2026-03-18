<?php

namespace App\Http\Controllers;

use App\Models\RemovedWorker;
use App\Models\Worker;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Storage;

class RemovedWorkerController extends Controller
{
    /**
     * Lista todos os trabalhadores removidos
     */
    public function index()
    {
        $removedWorkers = RemovedWorker::with(['worker', 'user'])->orderBy('created_at', 'desc')->get();

        return response()->json([
            'success' => true,
            'removed_workers' => $removedWorkers
        ]);
    }

    /**
     * Cria um novo registro de trabalhador removido
     */
    public function store(Request $request)
    {
        $request->validate([
            'worker_id' => 'required|exists:workers,id',
            'reason' => 'required|string',
            'attachament' => 'nullable|file|max:10240', // 10MB
            'who' => 'nullable|string'
        ]);

        DB::beginTransaction();

        try {
            $worker = Worker::find($request->worker_id);

            // Marca o trabalhador como deletado
            $worker->deleted = true;
            $worker->save();

            $removedWorker = new RemovedWorker();
            $removedWorker->worker_id = $worker->id;
            $removedWorker->user_id = Auth::id();
            $removedWorker->reason = $request->reason;
            $removedWorker->who = $request->who ?? 'System';

            // Upload do arquivo, se existir
            if ($request->hasFile('attachament')) {
                $file = $request->file('attachament');
                $path = $file->store("removed_workers/{$worker->id}", 'public');
                $url = Storage::url($path);

                $removedWorker->attachament = env('APP_IMAGE_URL') . $url;
            }

            $removedWorker->save();

            DB::commit();

            return response()->json([
                'success' => true,
                'message' => 'Removed worker saved successfully',
                'removed_worker' => $removedWorker
            ], 201);
        } catch (\Exception $e) {
            DB::rollBack();

            return response()->json([
                'success' => false,
                'message' => 'Error saving removed worker',
                'error' => $e->getMessage()
            ], 500);
        }
    }


    /**
     * Mostra um registro específico de trabalhador removido
     */
    public function show($id)
    {
        $removedWorker = RemovedWorker::with(['worker', 'user'])->find($id);

        if (!$removedWorker) {
            return response()->json(['success' => false, 'message' => 'Removed worker not found'], 404);
        }

        return response()->json(['success' => true, 'removed_worker' => $removedWorker]);
    }

    /**
     * Atualiza um registro de trabalhador removido
     */
    public function update(Request $request, $id)
    {
        $removedWorker = RemovedWorker::find($id);

        if (!$removedWorker) {
            return response()->json(['success' => false, 'message' => 'Removed worker not found'], 404);
        }

        $validatedData = $request->validate([
            'reason' => 'nullable|string',
            'who' => 'nullable|string',
            'attachament' => 'nullable|file|max:10240', // 10MB
        ]);

        DB::beginTransaction();

        try {
            // Upload do novo anexo se houver
            if ($request->hasFile('attachament')) {
                // Remove anexo antigo
                if ($removedWorker->attachament && Storage::disk('public')->exists($removedWorker->attachament)) {
                    Storage::disk('public')->delete($removedWorker->attachament);
                }

                $file = $request->file('attachament');
                $path = $file->store("removed_workers/{$removedWorker->worker_id}", 'public');
                $validatedData['attachament'] = env('APP_IMAGE_URL') . Storage::url($path);
            }

            $removedWorker->update($validatedData);

            DB::commit();

            return response()->json([
                'success' => true,
                'message' => 'Removed worker updated successfully',
                'removed_worker' => $removedWorker
            ]);
        } catch (\Exception $e) {
            DB::rollBack();

            return response()->json([
                'success' => false,
                'message' => 'Failed to update removed worker',
                'error' => $e->getMessage()
            ], 500);
        }
    }

    /**
     * Remove um registro de trabalhador removido
     */
    public function destroy($id)
    {
        $removedWorker = RemovedWorker::find($id);

        if (!$removedWorker) {
            return response()->json(['success' => false, 'message' => 'Removed worker not found'], 404);
        }

        // Remove arquivo, se existir
        if ($removedWorker->attachament && Storage::disk('public')->exists($removedWorker->attachament)) {
            Storage::disk('public')->delete($removedWorker->attachament);
        }

        $removedWorker->delete();

        return response()->json(['success' => true, 'message' => 'Removed worker deleted successfully']);
    }
}
