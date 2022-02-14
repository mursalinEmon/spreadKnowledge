<?php

namespace App\Http\Controllers;

use App\Course;
use App\CourseExam;
use App\CourseLesson;
use App\ExamQuestion;
use Illuminate\Http\Request;
use App\CourseProgressReport;

class ExamQuestionController extends Controller
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
    public function quwstions_list($cid, $lid)
    {
        // dd($questions);
        $questions = ExamQuestion::all()->where('course_id', $cid)->where('lession_id', $lid);

        return view('course_exam.examQuestions', compact('questions'));
    }

    /**
     * Show the form for creating a new resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function create(Course $course, CourseLesson $courseLesson)
    {

        return view('course.createCourseLessonExam', compact('course', 'courseLesson'));
    }


    /**
     * Store a newly created resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function store(Request $request)
    {
        $question = ExamQuestion::create([
            'course_id' => $request->course_id,
            'lession_id' => $request->lession_id,
            'question_body' => $request->question_body,
            'options' => $request->options,
            'answer' => $request->answer
        ]);

        return response(['message' => 'Question created successfully!', 'question' => $question]);
    }

    /**
     * Display the specified resource.
     *
     * @param  \App\ExamQuestion  $examQuestion
     * @return \Illuminate\Http\Response
     */
    public function show(ExamQuestion $examQuestion)
    {
        //
    }

    /**
     * Show the form for editing the specified resource.
     *
     * @param  \App\ExamQuestion  $examQuestion
     * @return \Illuminate\Http\Response
     */
    public function edit(ExamQuestion $examQuestion)
    {
        //
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  \App\ExamQuestion  $examQuestion
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request, ExamQuestion $examQuestion)
    {
        //
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  \App\ExamQuestion  $examQuestion
     * @return \Illuminate\Http\Response
     */
    public function destroy(ExamQuestion $examQuestion)
    {
        //
    }

    public function evaluate_quiz($cid, $lid, Request $request)
    {
        $questions = ExamQuestion::all()->where('course_id', $cid)->where('lession_id', $lid);

        $answers = explode(",", $request->answers);
        $nr = [];
        $answers = array_filter($answers, function ($value) {
            return !is_null($value) && $value !== '';
        });
        $answers = array_merge($nr, $answers);
        $ind = 0;
        foreach ($questions as $q) {
            $options = explode(",", $q->options);
            $ans = $options[$q->answer - 1];
            // dd($answers[$ind]== $ans);
            $fetchedQues = CourseExam::where('question_id', $q->id)->get();
            // dd($fetchedQues);
            if ($fetchedQues->isEmpty()) {
                if ($answers[$ind] == $ans) {
                    CourseExam::create([
                        'user_id' => auth()->user()->id,
                        'course_id' => $cid,
                        'lession_id' => $lid,
                        'question_id' => $q->id,
                        'marks' => 1
                    ]);
                } else {
                    CourseExam::create([
                        'user_id' => auth()->user()->id,
                        'course_id' => $cid,
                        'lession_id' => $lid,
                        'question_id' => $q->id,
                        'marks' => 0
                    ]);
                }
            } else {
                if ($answers[$ind] == $ans) {
                    //
                    $fetchedQues[0]->update([
                        'marks' => 1
                    ]);
                } else {
                    $fetchedQues[0]->update([
                        'marks' => 0
                    ]);
                }
            }

            $ind++;
        }
        //progress part
        $quiz_info = CourseExam::all()->where('user_id', auth()->user()->id)->where('course_id', $cid)->where('lession_id', $lid);
        $marks = 0;
        foreach ($quiz_info as $qz) {
            $marks += $qz->marks;
        }
        $marks_percent = $marks / $quiz_info->count() * 100;
        $prev = CourseProgressReport::all()->where('user_id', auth()->user()->id)->where('course_id', $cid)->where('lession_id', $lid);
        if ($prev->isEmpty()) {
            CourseProgressReport::create([
                'user_id' => auth()->user()->id,
                'course_id' => $cid,
                'lession_id' => $lid,
                'marks_percent' => $marks_percent,
                'status' => $marks_percent >= 100 ? 1 : 0,
            ]);
        } else {
            $trmp = CourseProgressReport::findOrFail($prev[0]->id);
            $trmp->update([
                'marks_percent' => $marks_percent,
                'status' => $marks_percent >= 100 ? 1 : 0,
            ]);
        }



        return response(['message' => 'Your response has been recorded.', 'course_id' => $cid]);
        // dd( $quiz_info);
    }
}
