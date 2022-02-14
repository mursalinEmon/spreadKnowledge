<?php

namespace App\Http\Controllers;

use Auth;
use App\Course;
use App\BlogTag;
use App\BlogPost;
use DB;
use Illuminate\Http\Request;

class HomeController extends Controller
{
    /**
     * Create a new controller instance.
     *
     * @return void
     */
    //    public function __construct()
    //    {
    //        $this->middleware('auth');
    //    }

    /**
     * Show the application dashboard.
     *
     * @return \Illuminate\Contracts\Support\Renderable
     */
    public function index()
    {
        return view('home');
    }
    public function contributor_dashboard()
    {
        $id = Auth::user()->id;
        $posts_count = BlogPost::where("user_id", $id)->count();
        $tags_count = BlogTag::all()->count();
        $course_count = Course::where('contributor_id', $id)->count();


        return view('contributor.contributor_dashboard', compact('posts_count', 'tags_count', 'course_count'));
    }
    public function landing()
    {
        $survery_result=[];
        $survery_courses=[];
        $course_ids=[];
       if(auth()->user()){
        $survery_result=auth()->user()->survey_result;
        if($survery_result!==null){
            foreach($survery_result as $res){
                $temp1=explode("-",$res);
                $type=$temp1[0];
                $id=$temp1[1];
                $ids=[];
                if($type=="cat"){
                    $courses=Course::where("category_id",$id)->get("id");
                    foreach($courses as $c){
                        array_push($ids,$c->id);
                    }
                    $course_ids=array_merge($course_ids,$ids);
                    
                }elseif($type="subcat"){
                    $courses=Course::where("sub_category_id",$id)->get("id");
                    foreach($courses as $c){
                        array_push($ids,$c->id);
                    }
                    $course_ids=array_merge($course_ids,$ids);
                }else{

                }
            }
            $uniq_courses=array_unique($course_ids);
            foreach($uniq_courses as $crs){
                $res=Course::where("id",$crs)->first();
                array_push($survery_courses,$res);
            }
        }
       }
       
        $top_courses = Course::orderBy('student_count', 'DESC')->take(3)->get();
        return view('landing', compact('top_courses','survery_courses'));
    }
}
