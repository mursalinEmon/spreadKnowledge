<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class ExamQuestion extends Model
{
    protected $guarded=[];
    protected $casts = [
        'options' => 'array',
    ];
}
