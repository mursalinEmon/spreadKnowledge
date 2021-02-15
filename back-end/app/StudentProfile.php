<?php

namespace App;
use App\User;

use Illuminate\Database\Eloquent\Model;

class StudentProfile extends Model
{
    protected $guarded=[];

    protected $casts = [
        'enrolled_courses' => 'array',
    ];
    public function ratings(){
        return $this->hasMany(Rating::class);
    }
    public function user(){
        return $this->belongsTo(User::class);
    }

}
