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
        Schema::create('worker_steps', function (Blueprint $table) {
            $table->id();
            $table->unsignedBigInteger('worker_id');

            $table->boolean('step_personal')->default(false);
            $table->boolean('step_company')->default(false);
            $table->boolean('step_documents')->default(false);
            $table->boolean('completed')->default(false);

            $table->foreign('worker_id')
                ->references('id')
                ->on('workers')
                ->onDelete('cascade');
            $table->timestamps();
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::dropIfExists('worker_steps');
    }
};
