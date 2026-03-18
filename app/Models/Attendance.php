<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Attendance extends Model
{
    use HasFactory;

    protected $fillable = [
        'worker_id',
        'start_date',
        'end_date',
        'status',
        'reason',
        'attachment',
    ];

    public function worker()
    {
        return $this->belongsTo(Worker::class);
    }
}
