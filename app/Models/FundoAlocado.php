<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class FundoAlocado extends Model
{
    use HasFactory;

    protected $fillable = [
        'unidade_organica_id',
        'valor_alocado',
        'total_salarios_pagos',
    ];

    /**
     * Relacionamento com Unidade Orgânica
     */
    public function unidadeOrganica()
    {
        return $this->belongsTo(UnidadeOrganica::class);
    }
}
