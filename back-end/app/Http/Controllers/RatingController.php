<?php

namespace App\Http\Controllers;

use App\User;
use App\Course;
use App\Rating;
// require_once("../../../app/recomendation/recommend.php");
use App\Recommend;
use App\StudentProfile;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;

class RatingController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        //
    }

    /**
     * Show the form for creating a new resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function create()
    {

    }

    /**
     * Store a newly created resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function store(Course $course,Request $request)
    {
        $rating=Rating::create([
            'course_id' => $course->id,
            'student_id' => auth()->user()->student_profile->id,
            'rating' => $request->rating
        ]);

        return response(['message'=>'success']);
    }

    /**
     * Display the specified resource.
     *
     * @param  \App\Rating  $rating
     * @return \Illuminate\Http\Response
     */
    public function show(Rating $rating)
    {
        //
    }

    /**
     * Show the form for editing the specified resource.
     *
     * @param  \App\Rating  $rating
     * @return \Illuminate\Http\Response
     */
    public function edit(Rating $rating)
    {
        //
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  \App\Rating  $rating
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request, Rating $rating)
    {
        //
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  \App\Rating  $rating
     * @return \Illuminate\Http\Response
     */
    public function destroy(Rating $rating)
    {
        //
    }
    public function check_rating($id){
        $is_rated=false;
        $check = Rating::where('course_id',$id)->where('student_id',auth()->user()->student_profile->id)->get();
        $is_rated=$check->isEmpty() ?false:true ;
        return response(['is_rated'=>$is_rated]);
    }
    public function rec(){


        $book_and_ratings=[];
        $student_name_and_ratings=[];
        $enrolled_courses=[];
       if(auth()->user()->type ===  "student"){
            $en_courses=StudentProfile::where('user_id',auth()->user()->id)->first()->enrolled_courses;
            foreach($en_courses as $course){
                $course_name=Course::findOrfail($course)->course_title;
                array_push( $enrolled_courses, $course_name);
            }



        //logic for rating recomendation
            $students=StudentProfile::all();
            foreach($students as $student){
                // $student = StudentProfile::where('user_id',$student->user_id)->get();
                $ratings=Rating::all()->where('student_id',$student->id);
                $s_name=User::where('id',$student->user_id)->first()->name;
                // $s_name=$s_name[0]->name;
                foreach($ratings as $rating){
                    $course = Course::findOrFail($rating->course_id);
                    $c_name=$course->course_title;
                    $c_rating = $rating->rating;
                    $book_and_ratings[$c_name]=  $c_rating ;
                }
                $student_name_and_ratings[$s_name]=$book_and_ratings;
            }

            $re = new Recommend();
            $rec=$re->getRecommendations($student_name_and_ratings, auth()->user()->name);
            foreach( $enrolled_courses as $key=>$val){
                // dd(array_search( $val, $rec ));
                if (array_search( $val, $rec ) == false) {
                    // dd($rec[$key]);
                    unset($rec[$val]);
                }
            }
            // dd($rec);
            foreach($rec as $key=>$val){
                    if($val<4){
                        // dd($rec[$key]);
                        unset($rec[$key]);
                    }
                    // dd($val);
            }
            $crs=new Course();
            $final_rec=[];
            foreach($rec as $key=>$val){
                $temp=$crs->where('course_title',$key)->first();
                array_push($final_rec,$temp);

            }
            // dd($final_rec);
            return response(['rating_based_courses'=>$final_rec]);
       }else{
           return response[null];
       }



    }
}
