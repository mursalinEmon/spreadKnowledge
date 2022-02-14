<?php

namespace App\Http\Controllers;

use App\Course;
use App\CourseLesson;
use App\ExamQuestion;
use Illuminate\Http\Request;
use App\CourseProgressReport;
use SebastianBergmann\Environment\Console;

class CourseLessonController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
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
     * @param  \App\CourseLesson  $courseLesson
     * @return \Illuminate\Http\Response
     */
    public function show(CourseLesson $courseLesson)
    {
    }

    /**
     * Show the form for editing the specified resource.
     *
     * @param  \App\CourseLesson  $courseLesson
     * @return \Illuminate\Http\Response
     */
    public function edit(CourseLesson $courseLesson)
    {
        //
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  \App\CourseLesson  $courseLesson
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request, CourseLesson $courseLesson)
    {
        //
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  \App\CourseLesson  $courseLesson
     * @return \Illuminate\Http\Response
     */
    public function destroy(CourseLesson $courseLesson)
    {
        $courseLesson->delete();
        return back()->with(['message' => 'lesson deleted successfully']);
    }

    public function find_lessons()
    {
        $data = CourseLesson::all();

        return response($data);
    }

    public function selected_lessons($id)
    {
        $data = CourseLesson::where('course_id', $id)->get();

        return response($data);
    }
    public function delete_lesson($id)
    {

        $lesson = CourseLesson::findOrFail($id);
        $lesson->delete();
        return response(['message' => 'Lesson Deleted Successfully..!!']);
    }
    public function edit_lesson($id)
    {
        $lesson = CourseLesson::findOrFail($id);
        return view('course.editCourseLesson', compact('lesson'));
    }
    public function update_lesson(Request $request)
    {
        $lesson = CourseLesson::findOrFail($request->id);
        $lesson->update([
            'lesson_body' => $request->lesson_body,
            'lesson_title' => $request->lesson_title,
            'link' => $request->link,
        ]);
        return response(['message' => 'Lesson Upadted Successfully...!! ']);
    }
    public function view_lessons($id)
    {
        $id = $id;
        $lessons = CourseLesson::where('course_id', $id)->paginate(5);
        // dd($lessons);
        return view('course.lessonList', compact('lessons', 'id'));
    }
    public function fetch_body($id)
    {
        //to fetch lesson body
        // dd($id);
        $lesson = CourseLesson::findOrFail($id);
        $lesson_body = $lesson->lesson_body;
        $link = $lesson->link;
        return response(['lesson_body' => $lesson_body,'link'=>$link]);
    }

    public function create_course_lesson($id)
    {
        $course = Course::findOrFail($id);
        return view('course.createCourseLesson', compact('course'));
    }
    public function check_eligible($cid, $lid)
    {
        $lessons_questions = ExamQuestion::all()->where('course_id', $cid)->where('lession_id', $lid);
        $p_status = CourseProgressReport::where('course_id', $cid)->where('lession_id', $lid)->get();

        if ($p_status->isEmpty()) {
            return response(['message' => 'Take The Exam For Next Lesson', 'questions' => $lessons_questions]);
        } else {
            if ($p_status[0]->status == 0) {
                return response(['message' => 'Take The Exam Again For Next Lesson', 'questions' => $lessons_questions]);
            }
        }
        return response(['message' => 'You are elegible for next lesson', 'questions' => []]);
    }
}
