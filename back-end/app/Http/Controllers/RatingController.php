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
use Phpml\Association\Apriori;


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
    public function hybrid_rec(){
        $status=[];
        $association_count=0;
        $colaborative_count=0;
        $course_count=0;

        $random_students=StudentProfile::orderBy('id', 'ASC')->take(50)->get();

        foreach($random_students as $student){
            $single_stat=[];
            $association_rule=$this->apriori($student->user_id);
            $colaborative_filtering=$this->rec_stat($student->user_id);
            // dd( count($association_rule), count($colaborative_filtering));
            $association_rule=$association_rule["recomended_courses"]!=[]?count($association_rule["recomended_courses"]):0;

            $colaborative_filtering=$colaborative_filtering["rating_based_courses"]!=[]?count($colaborative_filtering["rating_based_courses"]):0;

            //  dd($association_rule,$colaborative_filtering);
            //  $single_stat["user_id"]=$student->user_id;
            //  $single_stat["association_count"]=$association_rule;
            //  $single_stat["collaborative_count"]=$colaborative_filtering;
            //  $single_stat["total"]=$association_rule+$colaborative_filtering;
            $course_count += count($student->enrolled_courses);
            $association_count+=$association_rule;
            $colaborative_count+=$colaborative_filtering;

        }
        $status["student_count"]=50;
        $status["enrolled_courses"]=$course_count;
        $status["associative_rule_minig"]=$association_count;
        $status["colaborative_filtering"]=$colaborative_count;


        dd($status);
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
           return response(['rating_based_courses'=>'null']);
       }



    }
    public function apriori($user_id){
        $course_list=array();
        $courses=Course::get(['id','course_title']);
        foreach($courses as $course){
            // array_push($course_list,[$course->id => $course->course_title]);
            $course_list[$course->id]=$course->course_title;
        }
        $enrolled=StudentProfile::get('enrolled_courses');
        $enrolled_courses=array();
        foreach( $enrolled as $courses ){
            $temp=$courses->enrolled_courses;
            // dd($temp[0]);
            $temp_arr=array();
            foreach($temp as $t){

                foreach($course_list as $key=>$value){
                    // dd($key,$temp);
                    if ($t == $key){
                        $t=$value;
                        array_push($temp_arr,$t);
                    }
                }
            }
            array_push($enrolled_courses,$temp_arr);
            $temp_arr=[];
        }
        $associator = new Apriori($support = 0.2, $confidence = 0.2);
        $samples = $enrolled_courses;

        $labels  = [];
        $associator->train($samples, $labels);
        $frequent=$associator->apriori();
        $recomendation=[];
        for($i=2; $i<=count($frequent);$i++){
           $temp= $frequent[$i];
           foreach($temp as $item){
                array_push($recomendation,$item);
           }
        }
        // dd($recomendation);
        $taken_courses_names=[];
        $recomendation_for_you=[];
        $final_rec=[];
        $final_recomendation_list=[];
        $taken_courses=StudentProfile::where('user_id',$user_id)->get();
        // dd($user_id);
        $taken_courses= $taken_courses[0]->enrolled_courses;
        foreach(  $taken_courses as $course){
            $course_name=Course::findOrfail($course);
            array_push( $taken_courses_names,$course_name->course_title );
        }
        // dd($taken_courses_names);
        foreach($taken_courses_names as $course){
            foreach($recomendation as $rec){
                // dd($rec);
                if(in_array($course, $rec)){
                    array_push($recomendation_for_you,$rec);
                    // $recomendation_for_you=array_unique( $recomendation_for_you);
                }
            }
        }
        foreach($recomendation_for_you as $rec){
            $final_rec = array_merge(  $final_rec,$rec);
        }
        $final_rec =array_unique( $final_rec );
        // dd($recomendation_for_you,$taken_courses_names);
        foreach( $taken_courses_names as $val){
            if (($key = array_search( $val, $final_rec )) !== false) {
                unset($final_rec[$key]);
            }
        }
        foreach(  $final_rec as $rec){
            $course = Course::where('course_title',$rec)->get();
            array_push( $final_recomendation_list , $course);
        }
        // dd( $final_rec ,$taken_courses_names);
        // dd($final_recomendation_list );
        return (['recomended_courses'=>$final_recomendation_list]);


    }
    public function rec_stat($user_id){


        $book_and_ratings=[];
        $student_name_and_ratings=[];
        $enrolled_courses=[];

            $en_courses=StudentProfile::where('user_id',$user_id)->first()->enrolled_courses;
            // dd($en_courses);

            foreach($en_courses as $course){
                $course_name=Course::findOrfail($course)->course_title;
                array_push( $enrolled_courses, $course_name);




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
            $user_name=User::findOrFail($user_id);
            $rec=$re->getRecommendations($student_name_and_ratings, $user_name->name);
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
                $temp=$temp==null?[]:$temp;
                array_push($final_rec,$temp);

            }
            // dd($final_rec);
            return (['rating_based_courses'=>$final_rec]);
       }


    }
}
