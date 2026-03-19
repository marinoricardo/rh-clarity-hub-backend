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
        Schema::create('documents', function (Blueprint $table) {
            $table->id();
            $table->unsignedBigInteger('worker_id');

            // Document URLs
            $table->string('nuit_document_url')->nullable();                 // NUIT
            $table->string('identity_document_url')->nullable();             // Documento de Identificação
            $table->string('education_certificate_url')->nullable();         // Certificado de Habilitações
            $table->string('cv_url')->nullable();                             // Curriculum
            $table->string('other_certifications_url')->nullable(); // Outras Certificações
            $table->string('declaracao_documento_url')->nullable(); 

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
        Schema::dropIfExists('documents');
    }
};
