<?php

namespace App;

use App\Course;
use Illuminate\Database\Eloquent\Model;

class CourseLesson extends Model
{
    protected $guarded=[];
    public function course(){
       return $this->belongsTo(Course::class);
    }
}
