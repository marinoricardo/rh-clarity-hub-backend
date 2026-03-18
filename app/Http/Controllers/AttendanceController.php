<?php

namespace App\Http\Controllers;

use App\Models\Attendance;
use App\Models\Worker;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Storage;

class AttendanceController extends Controller
{
    /**
     * Lista todas as presenças
     */
    public function index()
    {
        $attendances = Attendance::with('worker')->orderBy('created_at', 'desc')->get();

        return response()->json([
            'success' => true,
            'attendances' => $attendances
        ]);
    }

    /**
     * Cria uma nova presença
     */
    public function store(Request $request)
    {
        $request->validate([
            'worker_id' => 'required|exists:workers,id',
            'start_date' => 'required|date',
            'end_date' => 'nullable|date',  
            'status' => 'required',
            'reason' => 'nullable|string',
            'attachment' => 'nullable|file|max:10240', // 10MB
        ]);

        DB::beginTransaction();

        try {
            $worker = Worker::find($request->worker_id);

            $attendance = new Attendance();
            $attendance->worker_id = $worker->id;
            $attendance->start_date = $request->start_date;
            $attendance->end_date = $request->end_date;
            $attendance->status = $request->status;
            $attendance->reason = $request->reason;

            // Upload do arquivo, se existir
            if ($request->hasFile('attachment')) {
                $file = $request->file('attachment');
                $path = $file->store("attendance_files/{$worker->id}", 'public');
                $url = Storage::url($path);

                $attendance->attachment = env('APP_IMAGE_URL') . $url;
            }

            $attendance->save();

            DB::commit();

            return response()->json([
                'success' => true,
                'message' => 'Attendance saved successfully',
                'attendance' => $attendance
            ], 200);
        } catch (\Exception $e) {
            DB::rollBack();

            return response()->json([
                'success' => false,
                'message' => 'Error saving attendance',
                'error' => $e->getMessage()
            ], 500);
        }
    }

    /**
     * Mostra uma presença específica
     */
    public function show($id)
    {
        $attendance = Attendance::with('worker')->find($id);

        if (!$attendance) {
            return response()->json(['success' => false, 'message' => 'Attendance not found'], 404);
        }

        return response()->json(['success' => true, 'attendance' => $attendance]);
    }

    /**
     * Atualiza uma presença
     */
    public function update(Request $request, $id)
    {
        $attendance = Attendance::find($id);

        if (!$attendance) {
            return response()->json(['success' => false, 'message' => 'Attendance not found'], 404);
        }

        $validatedData = $request->validate([
            'status' => 'nullable',
            'reason' => 'nullable|string',
            'attachment' => 'nullable|file|mimes:pdf,jpg,jpeg,png|max:10240',
        ]);

        DB::beginTransaction();

        try {
            // Upload do novo anexo se houver
            if ($request->hasFile('attachment')) {
                // Remove anexo antigo
                if ($attendance->attachment && Storage::disk('public')->exists($attendance->attachment)) {
                    Storage::disk('public')->delete($attendance->attachment);
                }

                $file = $request->file('attachment');
                $path = $file->store('attendances', 'public');
                $validatedData['attachment'] = $path;
            }

            $attendance->update($validatedData);

            DB::commit();

            return response()->json([
                'success' => true,
                'message' => 'Attendance updated successfully',
                'attendance' => $attendance
            ]);
        } catch (\Exception $e) {
            DB::rollBack();

            return response()->json([
                'success' => false,
                'message' => 'Failed to update attendance',
                'error' => $e->getMessage()
            ], 500);
        }
    }

    /**
     * Remove uma presença
     */
    public function destroy($id)
    {
        $attendance = Attendance::find($id);

        if (!$attendance) {
            return response()->json(['success' => false, 'message' => 'Attendance not found'], 404);
        }

        if ($attendance->attachment && Storage::disk('public')->exists($attendance->attachment)) {
            Storage::disk('public')->delete($attendance->attachment);
        }

        $attendance->delete();

        return response()->json(['success' => true, 'message' => 'Attendance deleted successfully']);
    }
}
