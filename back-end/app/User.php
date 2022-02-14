<?php

namespace App;
use App\StudentProfile;

use Illuminate\Contracts\Auth\MustVerifyEmail;
use Illuminate\Foundation\Auth\User as Authenticatable;
use Illuminate\Notifications\Notifiable;

class User extends Authenticatable implements MustVerifyEmail
{
    use Notifiable;

    /**
     * The attributes that are mass assignable.
     *
     * @var array
     */
    protected $fillable = [
        'name', 'email', 'password','type','survey_taken','survey_result'
    ];

    /**
     * The attributes that should be hidden for arrays.
     *
     * @var array
     */
    protected $hidden = [
        'password', 'remember_token',
    ];

    /**
     * The attributes that should be cast to native types.
     *
     * @var array
     */
    protected $casts = [
        'email_verified_at' => 'datetime',
        'survey_result' => 'array',

    ];


    public function student_profile()
    {
        return $this->hasOne(StudentProfile::class,'user_id','id');
    }
    public function contributor_profile()
    {
        return $this->hasOne('App\ContributorProfile');
    }
    public function admin_profile()
    {
        return $this->hasOne('App\AdminProfile');
    }
    public function post()
    {
        return $this->hasMany('App\BlogPost');
    }
    public function comment()
    {
        return $this->hasMany('App\BlogComment');
    }
    public function course(){
        return $this->hasMany('App\Course');
    }
    public function questions(){
        return $this->hasMany('App\Question');
    }
    public function answers(){
        return $this->hasMany('App\Answer');
    }
}
