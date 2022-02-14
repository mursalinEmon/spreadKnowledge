<?php

namespace App;
use App/User;

use Illuminate\Database\Eloquent\Model;

class InterestSurvey extends Model
{
    protected $fillable = [
        'categories', 'sub_categories','student_id'
    ];

    protected $casts = [
        'categories' => 'array',
        'sub_categories' => 'array'
    ];
}
