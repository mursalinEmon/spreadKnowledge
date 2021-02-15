<?php

namespace App;

use App\Course;
use App\StudentProfile;
use Illuminate\Database\Eloquent\Model;

class Rating extends Model
{
    protected $guarded=[];

    public function student(){
        return $this->belongsTo(StudentProfile::class,'student_id','id');
    }
    public function course(){
        return $this->belongsTo(Course::class,'course_id','id');
    }
}
