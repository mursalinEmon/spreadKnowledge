<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class StudentProfile extends Model
{
    protected $guarded=[];

    protected $casts = [
        'enrolled_courses' => 'array',
    ];

}
