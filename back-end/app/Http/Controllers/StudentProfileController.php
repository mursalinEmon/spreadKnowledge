<?php

namespace App\Http\Controllers;

use App\Course;
use App\StudentProfile;
use Illuminate\Http\Request;

class StudentProfileController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {

        $student = StudentProfile::where('user_id',auth()->user()->id)->first();

        // $student = StudentProfile::findOrFail(auth()->user()->id);

        $courses=$student->enrolled_courses;

        $enrolled_course_count=count($courses);

        return view('student.student_dashboard',compact('enrolled_course_count'));
    }

    /**
     * Show the form for creating a new resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function create()
    {
        //
    }

    /**
     * Store a newly created resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function store(Request $request)
    {
        //
    }

    /**
     * Display the specified resource.
     *
     * @param  \App\StudentProfile  $studentProfile
     * @return \Illuminate\Http\Response
     */
    public function show(StudentProfile $studentProfile)
    {
        //
    }

    /**
     * Show the form for editing the specified resource.
     *
     * @param  \App\StudentProfile  $studentProfile
     * @return \Illuminate\Http\Response
     */
    public function edit(StudentProfile $studentProfile)
    {
        //
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  \App\StudentProfile  $studentProfile
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request, StudentProfile $studentProfile)
    {
        //
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  \App\StudentProfile  $studentProfile
     * @return \Illuminate\Http\Response
     */
    public function destroy(StudentProfile $studentProfile)
    {
        //
    }
    public function enroll_course($course_id){
        $course=Course::findOrFail($course_id);
        $student=StudentProfile::where('user_id',auth()->user()->id)->get()->first();
        $enrolled_courses=$student->enrolled_courses;
        Array_push($enrolled_courses,$course->id);

        $student_count=$course->student_count;
        $student_count ++;
        $course->update([
            'student_count' => $student_count,
        ]);
        $student->update([
            'enrolled_courses'=>$enrolled_courses,
        ]);

        return back()->with(['message'=>'enrolled successfully']);
    }

    public function enrolled_Courses($id){
        $student = StudentProfile::where('user_id',auth()->user()->id)->get()->first();
        $courses = $student->enrolled_courses;
        $enrolled_courses=[];
        foreach($courses as $course_id ){
            $course = Course::findOrFail($course_id);
            array_push($enrolled_courses,$course);
        }

        // dd($enrolled_courses);
        return view('student.enrolledCoursesView',compact('enrolled_courses'));
    }
}
