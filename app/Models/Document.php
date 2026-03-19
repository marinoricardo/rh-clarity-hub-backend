<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Document extends Model
{
    use HasFactory;

    protected $fillable = [
        'worker_id',
        'nuit_document_url',
        'identity_document_url',
        'education_certificate_url',
        'cv_url',
        'other_certifications_url',
        'declaracao_documento_url'
    ];

    public function worker()
    {
        return $this->belongsTo(Worker::class);
    }
}
