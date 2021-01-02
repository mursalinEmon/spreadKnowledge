<?php

namespace App;
use App\User;

use Illuminate\Database\Eloquent\Model;

class Question extends Model
{
    protected $guarded=[];

    protected $casts = [
        'answered_by' => 'array',
    ];


    public function answers(){
        return $this->hasMany('App\Answer');
    }
    public function user(){
        return $this->belongsTo(User::class, 'asked_by','id');
    }
}
