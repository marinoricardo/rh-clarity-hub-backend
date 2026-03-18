<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

return new class extends Migration
{
    /**
     * Run the migrations.
     */
    public function up(): void
    {
        Schema::create('fundo_alocados', function (Blueprint $table) {
            $table->id();
            $table->unsignedBigInteger('unidade_organica_id');
            $table->foreign('unidade_organica_id')->references('id')->on('unidade_organicas')->onDelete('cascade');
            $table->decimal('valor_alocado', 15, 2);
            $table->decimal('total_salarios_pagos', 15, 2);
            $table->timestamps();
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::dropIfExists('fundo_alocados');
    }
};
