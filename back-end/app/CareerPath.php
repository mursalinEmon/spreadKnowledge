<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class CareerPath extends Model
{
    protected $guarded =[];

    protected $casts = [
        'course_list' => 'array',
    ];

}
