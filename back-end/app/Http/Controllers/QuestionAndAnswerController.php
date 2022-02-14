<?php

namespace App\Http\Controllers;

use App\QuestionAndAnswer;
use Illuminate\Http\Request;

class QuestionAndAnswerController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        return view('QnA.qnaportal');
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
     * @param  \App\QuestionAndAnswer  $questionAndAnswer
     * @return \Illuminate\Http\Response
     */
    public function show(QuestionAndAnswer $questionAndAnswer)
    {
        //
    }

    /**
     * Show the form for editing the specified resource.
     *
     * @param  \App\QuestionAndAnswer  $questionAndAnswer
     * @return \Illuminate\Http\Response
     */
    public function edit(QuestionAndAnswer $questionAndAnswer)
    {
        //
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  \App\QuestionAndAnswer  $questionAndAnswer
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request, QuestionAndAnswer $questionAndAnswer)
    {
        //
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  \App\QuestionAndAnswer  $questionAndAnswer
     * @return \Illuminate\Http\Response
     */
    public function destroy(QuestionAndAnswer $questionAndAnswer)
    {
        //
    }
}
