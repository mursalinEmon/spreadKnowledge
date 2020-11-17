<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class BlogPost extends Model
{
    protected $fillable = [
        'title', 'content','user_id','tags'
    ];

    protected $casts = [
        'tags' => 'array',
    ];


    public function user()
    {
        return $this->belongsTo('App\User');
    }
    public function category()
    {
        return $this->belongsTo('App\Category');
    }
    public function tag()
    {
        return $this->hasMany('App\Tag');
    }
}
