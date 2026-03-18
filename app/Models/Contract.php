<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Contract extends Model
{
    use HasFactory;

    protected $fillable = [
        'worker_id',
        'contract_type',
        'start_date',
        'end_date',
        'status',
    ];

    /**
     * Relacionamento com Worker
     */
    public function worker()
    {
        return $this->belongsTo(Worker::class);
    }
}
