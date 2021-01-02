<?php

namespace App\Http\Controllers;

use App\Answer;
use App\Question;
use Illuminate\Http\Request;

class AnswerController extends Controller
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
    public function create($id)
    {
        $question=Question::findOrFail($id);
        return view('Q&A.replyQuestion',compact('question'));

    }

    /**
     * Store a newly created resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */


    // $table->foreignId('replied_by')->constrained('users');
    // $table->foreignId('answer_for_question')->constrained('questions');
    // $table->text('answer_body');
    // $table->json('tags')->nullable();

    public function store(Request $request, $id)
    {

        $question=Question::findOrFail($id);
        $question->update([
            'answered_by'=>auth()->user()->id,
        ]);
        $answer=Answer::create([
            'replied_by'=>auth()->user()->id,
            'answer_for_question'=>$id,
            'answer_body'=>$request->body,

        ]);
        return response(['message'=>'Your Answer Is Posted Successfully..!!']);

    }

    /**
     * Display the specified resource.
     *
     * @param  \App\Answer  $answer
     * @return \Illuminate\Http\Response
     */
    public function show(Answer $answer)
    {
        //
    }

    /**
     * Show the form for editing the specified resource.
     *
     * @param  \App\Answer  $answer
     * @return \Illuminate\Http\Response
     */
    public function edit(Answer $answer)
    {
        //
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  \App\Answer  $answer
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request, Answer $answer)
    {
        //
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  \App\Answer  $answer
     * @return \Illuminate\Http\Response
     */
    public function destroy(Answer $answer)
    {
        //
    }
}
