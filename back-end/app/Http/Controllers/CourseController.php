<?php

namespace App\Http\Controllers;

use App\Course;
use App\Category;
use App\SubCategory;
use App\CourseLesson;
use App\StudentProfile;
use Illuminate\Http\Request;
use Illuminate\Support\Carbon;

use Phpml\Association\Apriori;
use Illuminate\Support\Facades\File;


class CourseController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        $courses=Course::paginate(5);

        return view('course.allCoursesView',compact('courses'));
    }

    /**
     * Show the form for creating a new resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function create()
    {
        $categories=Category::all();
        return view('course.createCourse',compact('categories'));
    }

    /**
     * Store a newly created resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function store(Request $request)
    {


        if($request->file('file')){
            $image = $request->file;
            $imagePath = $request->file('file');
            $imageName=$imagePath->getClientOriginalName();
            $image->move(public_path('image/'.auth()->user()->name.'/'),$imageName);
            $course=Course::create([
                'contributor_id'=>auth()->user()->id,
                'course_title'=>$request->title,
                'image'=>'image/'.auth()->user()->name.'/'.$imageName,
                'course_level'=>$request->level,
                'rating'=>1.0,
                'student_count'=>0,
                'category_id'=>$request->category_id,
                'sub_category_id'=>$request->sub_category_id,
                'tags'=> $request->tags,
            ]);

            return response(['message' => 'Course created Successfully','course_id'=>$course->id]);
        }
    }
    public function create_lesson(Request $request){
        $course_lesson=CourseLesson::create([
            'course_id'=>$request->course_id,
            'lesson_title'=>$request->topic_title,
            'lesson_body'=>$request->topic_body,
        ]);
        return response(['message'=>"Course Topic Created Successfully.."]);
    }

    /**
     * Display the specified resource.
     *
     * @param  \App\Course  $course
     * @return \Illuminate\Http\Response
     */
    public function show(Course $course)
    {

    }

    /**
     * Show the form for editing the specified resource.
     *
     * @param  \App\Course  $course
     * @return \Illuminate\Http\Response
     */
    public function edit(Course $course)
    {

        return view('course.courseEdit',compact('course'));
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  \App\Course  $course
     * @return \Illuminate\Http\Response
     */

    // "title" => "num"
    // "tags" => "["ewrwer","test","assd"]"
    // "level" => "beginner"
    // "category_id" => "1"
    // "sub_category" => "php"
    public function update(Request $request, Course $course)
    {

        $sub_cat=null;
        $imageName=null;
        if($request->sub_category){
        $sub_cat=SubCategory::where('name',$request->sub_category)->pluck('id');


        }
        $sub_category_id = $sub_cat[0] ? $sub_cat[0]: $course->sub_category_id;


        if($request->file('file')){
            $image = $request->file;
            $imagePath = $request->file('file');
            $imageName=$imagePath->getClientOriginalName();
            $image->move(public_path('image/'.auth()->user()->name.'/'),$imageName);
            File::delete( public_path($course->image));

        }
        $db_image= $imageName ? 'image/'.auth()->user()->name.'/'.$imageName :  $course->image;

        $course->update([
            'course_title' => $request->title,
            'tags'=>$request->tags,
            'course_level'=>$request->level,
            'category_id' =>$request->category_id,
            'sub_category_id'=>$sub_category_id,
            'image' => $db_image,


        ]);

        return response(['message'=>'Post Updated SuccessFully']);

    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  \App\Course  $course
     * @return \Illuminate\Http\Response
     */
    public function destroy(Course $course)
    {
        $course->delete();
        return back()->with(['message'=>'course deleted successfully...!!']);

    }
    public function course_list($id){
        $courses=Course::where('contributor_id',$id)->paginate(5);

            return view('course.allCoursesView',compact('courses'));
    }
    public function top_courses(){
        $top_courses=Course::orderBy('student_count', 'DESC')->take(10)->get();
        return response(['top_courses'=>$top_courses]);
    }
    public function selected_course_lessons($id){
        $selected_course_lessons=CourseLesson::where('course_id',$id)->get();
        // dd($selected_course_lessons);
        return view('student.courseLessonsView',compact('selected_course_lessons'));

    }
    public function apriori(){
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
        $taken_courses=StudentProfile::where('user_id',auth()->user()->id)->get();
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
        return response(['recomended_courses'=>$final_recomendation_list]);


    }
    public function top_course_month(){
        $top_courses=Course::orderBy('student_count', 'DESC')->whereMonth('created_at', Carbon::now()->month)->get();
        return response(['top_courses_month'=>$top_courses]);
    }

    public function fawMethod($id){
        $selected_course_lessons = CourseLesson::all()->where('course_id',$id);
        return view('student.courseLessonsView', compact('selected_course_lessons'));
    }
}
