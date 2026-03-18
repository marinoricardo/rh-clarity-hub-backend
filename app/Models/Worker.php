<?php

namespace App\Models;

use Carbon\Carbon;
use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\SoftDeletes;

class Worker extends Model
{
    use HasFactory, SoftDeletes;

    protected $fillable = [
        // Personal data
        'full_name',
        'date_of_birth',
        'tax_number',
        'gender',
        'marital_status',

        // Document
        'document_type',
        'document_number',

        // Address
        'province',
        'district',
        'address',
        'neighborhood',
        'postal_box',
        'city',

        // Contacts
        'work_email',
        'alternative_email',
        'work_contact',
        'alternative_contact',
        'phone',

        // Job
        'job_function',

        'bank',
        'nib_iban',

        // Control
        'active',
        'deleted',
        'user_id',
    ];

    protected $casts = [
        'date_of_birth' => 'date',
        'active' => 'boolean',
        'deleted' => 'boolean',
    ];


public function getDateOfBirthAttribute($value)
{
    return Carbon::parse($value)->format('Y-m-d');
}

    /*
    |--------------------------------------------------------------------------
    | Relationships
    |--------------------------------------------------------------------------
    */

    // Worker belongs to a User
    public function user()
    {
        return $this->belongsTo(User::class);
    }

    // Worker has one employment data record
    public function employmentData()
    {
        return $this->hasOne(WorkerCompanyData::class);
    }

    // Worker has one documents record
    public function documents()
    {
        return $this->hasOne(Document::class);
    }

    // Worker has one steps record
    public function steps()
    {
        return $this->hasOne(WorkerStep::class);
    }

    // Relacionamento com presenças
    public function attendances()
    {
        return $this->hasMany(Attendance::class);
    }
    // Relacionamento com contractos
    public function contracts()
    {
        return $this->hasMany(Contract::class);
    }

    public function performances()
    {
        return $this->hasMany(WorkerPerfomance::class);
    }
}
