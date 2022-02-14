<?php

namespace App\Http\Controllers;

use App\Answer;
use App\Question;
use Illuminate\Http\Request;

class QuestionController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index(){
        $questions = Question::all();

        return view('Q&A.questionList' ,compact('questions'));

    }

    /**
     * Show the form for creating a new resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function create()
    {
        return view('Q&A.makeQuestion');
    }

    /**
     * Store a newly created resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
        // $table->foreignId('asked_by')->constrained('users');
        //     $table->json('answered_by')->nullable();
        //     $table->string('question');
        //     $table->text('body');
        //     $table->string('topic');
        //     $table->json('tags')->nullable();
    public function store(Request $request)
    {
        $question=Question::create([
            'asked_by' => auth()->user()->id,
            'question' => $request->question,
            'body' => $request->body,
            'topic' => $request->topic,
            'tags' => $request->tags,
        ]);

        return response(['message' => 'Discussoin Created Successfully..!!']);
    }

    /**
     * Display the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function show($id)
    {
        $question = Question::findOrFail($id);
        $answers=Answer::where('answer_for_question',$question->id)->latest()->get();
        $answers=$answers?$answers:[];
        // dd($answers);
        return view('Q&A.questionShow',compact('question','answers'));
    }

    /**
     * Show the form for editing the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function edit($id)
    {
        //
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request, $id)
    {
        //
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function destroy($id)
    {
        //
    }
}
