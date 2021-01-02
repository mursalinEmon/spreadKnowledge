<?php

namespace App;

use App\User;
use Illuminate\Database\Eloquent\Model;

class Answer extends Model
{
    protected $guarded=[];

    public function question(){
        return $this->belongsTo('App\Question');
    }
    public function user(){
        return $this->belongsTo(User::class,'replied_by','id');
    }
}
