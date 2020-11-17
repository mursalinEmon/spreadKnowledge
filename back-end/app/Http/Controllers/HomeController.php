<?php

namespace App\Http\Controllers;
use Auth;
use App\BlogPost;
use Illuminate\Http\Request;

class HomeController extends Controller
{
    /**
     * Create a new controller instance.
     *
     * @return void
     */
    public function __construct()
    {
        $this->middleware('auth');
    }

    /**
     * Show the application dashboard.
     *
     * @return \Illuminate\Contracts\Support\Renderable
     */
    public function index()
    {
        return view('home');
    }
    public function contributor_dashboard(){
        $id=Auth::user()->id;
        $posts_count=BlogPost::where("user_id",$id)->count();


        return view('contributor.contributor_dashboard',compact('posts_count'));
    }
}
