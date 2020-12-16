<?php

namespace App\Http\Controllers;

use App\Course;
use App\Category;
use App\CourseLesson;
use Illuminate\Http\Request;

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
        //
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  \App\Course  $course
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request, Course $course)
    {
        //
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

}
