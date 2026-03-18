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
        Schema::create('workers', function (Blueprint $table) {
            $table->id();
            // Personal data
            $table->string('full_name');                 // Nome Completo
            $table->date('date_of_birth');               // Data de Nascimento
            $table->string('tax_number');                // NUIT
            $table->string('gender');                    // Gênero
            $table->string('marital_status');            // Estado Civil

            // Document
            $table->string('document_type');             // Tipo de Documento
            $table->string('document_number');           // Número do Documento

            // Address
            $table->string('province');                  // Província
            $table->string('district');                  // Distrito
            $table->string('address');                   // Endereço
            $table->string('neighborhood')->nullable();  // Bairro
            $table->string('postal_box')->nullable();    // Caixa Postal
            $table->string('city');                      // Cidade / Localidade

            // Contacts
            $table->string('work_email');                // Email Profissional
            $table->string('alternative_email')->nullable(); // Email Alternativo
            $table->string('work_contact')->nullable();  // Contacto Profissional
            $table->string('alternative_contact')->nullable(); // Contacto Alternativo
            $table->string('phone');                     // Cel / Tel

            // Job
            $table->string('job_function');               // Função

            $table->string('nib_iban');
            $table->string('bank');

            // Control
            $table->boolean('active')->default(true);
            $table->boolean('deleted')->default(false);

            $table->unsignedBigInteger('user_id');
            $table->foreign('user_id')->references('id')->on('users');

            $table->timestamps();
            $table->softDeletes();
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::dropIfExists('workers');
    }
};
