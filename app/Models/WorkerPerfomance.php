<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class WorkerPerfomance extends Model
{
    use HasFactory;

    use HasFactory;

    protected $fillable = [
        'worker_id',
        'attachament',
        'status',
        // 'perfomance_date' não entra no fillable
    ];

    protected $dates = [
        'perfomance_date',
        'created_at',
        'updated_at',
    ];

    public function worker()
    {
        return $this->belongsTo(Worker::class);
    }
}
