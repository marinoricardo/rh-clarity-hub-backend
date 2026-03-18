<?php

namespace App\Http\Controllers;

use App\Models\FundoAlocado;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;

class FundoAlocadoController extends Controller
{
    /**
     * Lista todos os fundos alocados
     */
    public function index()
    {
        $fundos = FundoAlocado::with('unidadeOrganica')
            ->orderBy('created_at', 'desc')
            ->get();

        return response()->json([
            'success' => true,
            'data' => $fundos
        ]);
    }

    /**
     * Cria um novo fundo alocado
     */
    public function store(Request $request)
    {
        $validatedData = $request->validate([
            'unidade_organica_id' => 'required|exists:unidade_organicas,id',
            'valor_alocado' => 'required|numeric|min:0',
        ]);

        DB::beginTransaction();

        try {
            $fundo = FundoAlocado::where('unidade_organica_id', $validatedData['unidade_organica_id'])
                ->lockForUpdate()
                ->first();

            if ($fundo) {
                // SOMA ao valor já existente
                $fundo->update([
                    'valor_alocado' => $fundo->valor_alocado + $validatedData['valor_alocado'],
                ]);

                $message = 'Fundo reforçado com sucesso';
            } else {
                // Cria novo fundo
                $fundo = FundoAlocado::create([
                    'unidade_organica_id' => $validatedData['unidade_organica_id'],
                    'valor_alocado' => $validatedData['valor_alocado'],
                    'total_salarios_pagos' => 0,
                ]);

                $message = 'Fundo alocado criado com sucesso';
            }

            DB::commit();

            return response()->json([
                'success' => true,
                'message' => $message,
                'data' => $fundo
            ], 200);
        } catch (\Exception $e) {
            DB::rollBack();

            return response()->json([
                'success' => false,
                'message' => 'Erro ao salvar fundo alocado',
                'error' => $e->getMessage()
            ], 500);
        }
    }



    /**
     * Mostra um fundo alocado específico
     */
    public function show($id)
    {
        $fundo = FundoAlocado::with('unidadeOrganica')->find($id);

        if (!$fundo) {
            return response()->json([
                'success' => false,
                'message' => 'Fundo alocado não encontrado'
            ], 404);
        }

        return response()->json([
            'success' => true,
            'data' => $fundo
        ]);
    }

    /**
     * Atualiza um fundo alocado
     */
    public function update(Request $request, $id)
    {
        $fundo = FundoAlocado::find($id);

        if (!$fundo) {
            return response()->json([
                'success' => false,
                'message' => 'Fundo alocado não encontrado'
            ], 404);
        }

        $validatedData = $request->validate([
            'unidade_organica_id' => 'nullable|exists:unidade_organicas,id',
            'valor_alocado' => 'nullable|numeric|min:0',
            'total_salarios_pagos' => 'nullable|numeric|min:0',
        ]);

        DB::beginTransaction();

        try {
            $fundo->update($validatedData);

            DB::commit();

            return response()->json([
                'success' => true,
                'message' => 'Fundo alocado atualizado com sucesso',
                'data' => $fundo
            ]);
        } catch (\Exception $e) {
            DB::rollBack();

            return response()->json([
                'success' => false,
                'message' => 'Erro ao atualizar fundo alocado',
                'error' => $e->getMessage()
            ], 500);
        }
    }

    /**
     * Remove um fundo alocado
     */
    public function destroy($id)
    {
        $fundo = FundoAlocado::find($id);

        if (!$fundo) {
            return response()->json([
                'success' => false,
                'message' => 'Fundo alocado não encontrado'
            ], 404);
        }

        $fundo->delete();

        return response()->json([
            'success' => true,
            'message' => 'Fundo alocado removido com sucesso'
        ]);
    }
}
