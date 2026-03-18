<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class WorkerStep extends Model
{
    use HasFactory;

    protected $fillable = [
        'worker_id',
        'step_personal',
        'step_company',
        'step_documents',
        'completed',
    ];

    protected $casts = [
        'step_personal' => 'boolean',
        'step_company' => 'boolean',
        'step_documents' => 'boolean',
        'completed' => 'boolean',
    ];

    public function worker()
    {
        return $this->belongsTo(Worker::class);
    }
}
