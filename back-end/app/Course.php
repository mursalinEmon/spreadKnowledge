<?php

namespace App;

use App\User;
use App\CourseLesson;
use Illuminate\Database\Eloquent\Model;

class Course extends Model
{
    protected $guarded=[];
    public function user(){
       return $this->belongsTo(User::class,'contributor_id','id');
    }
    public function lessons(){
        return $this->hasMany(CourseLesson::class,'course_id');
        // $this->hasMany('App\CourseLesson');
    }
}
