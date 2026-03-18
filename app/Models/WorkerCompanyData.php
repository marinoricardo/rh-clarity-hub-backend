<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class WorkerCompanyData extends Model
{
    use HasFactory;

    protected $fillable = [
        'worker_id',
        'hire_date',
        'end_date',
        'inss',
        'contract_type',
        'academic_level',
        'area',
        'region',
        'pelouro',
        'organizational_unit',
        'sector',
        'salary',
        'status',
    ];

    protected $casts = [
        'hire_date' => 'date',
        'end_date' => 'date',
        'salary' => 'decimal:2',
    ];

    public function worker()
    {
        return $this->belongsTo(Worker::class);
    }
}
