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
        Schema::create('worker_company_data', function (Blueprint $table) {
            $table->id();

            // Relation
            $table->unsignedBigInteger('worker_id');

            // Employment dates
            $table->date('hire_date');                    // Data de Admissão
            $table->date('end_date')->nullable();         // Data de Fim

            // Legal / Contract
            $table->string('inss')->nullable();            // INSS
            $table->string('contract_type');               // Tipo de Contrato
            $table->string('academic_level');              // Nível Acadêmico

            // Organizational info
            $table->string('area')->nullable();                        // Área
            $table->string('region')->nullable();                      // Região
            $table->string('pelouro')->nullable();         // Pelouro
            $table->string('organizational_unit')->nullable();         // Unidade Orgânica
            $table->string('sector')->nullable();                      // Setor

            // Financial
            $table->decimal('salary', 10, 2);              // Salário

            // Status
            $table->string('status');                      // Ativo / Inativo

            // Foreign key
            $table->foreign('worker_id')
                ->references('id')
                ->on('workers')
                ->onDelete('cascade');

            $table->timestamps();
            $table->softDeletes();
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::dropIfExists('worker_company_data');
    }
};
