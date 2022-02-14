<?php

namespace App\Http\Controllers;

use App\InterestSurvey;
use App\Category;
use App\SubCategory;
use Illuminate\Http\Request;

class InterestSurveyController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        $categories = Category::all();
        $sub_categories = SubCategory::all();
        // dd($sub_categories);

        return view('survey.interestSurvey', compact('categories','sub_categories'));

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
     * @param  \App\InterestSurvey  $interestSurvey
     * @return \Illuminate\Http\Response
     */
    public function show(InterestSurvey $interestSurvey)
    {
        //
    }

    /**
     * Show the form for editing the specified resource.
     *
     * @param  \App\InterestSurvey  $interestSurvey
     * @return \Illuminate\Http\Response
     */
    public function edit(InterestSurvey $interestSurvey)
    {
        //
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  \App\InterestSurvey  $interestSurvey
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request, InterestSurvey $interestSurvey)
    {
        //
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  \App\InterestSurvey  $interestSurvey
     * @return \Illuminate\Http\Response
     */
    public function destroy(InterestSurvey $interestSurvey)
    {
        //
    }

    public function find_sub($id){
        dd($id);
        $data=SubCategory::where('category_id',$id)->get();
        return response($data);
        
    }
    public function fetched_sub_category(){
        $subCategories=SubCategory::all();
        dd($subCategories);
     return response($subCategories);
        
    }
    public function create_question(){
        $type = 'category';
        return view('survey.createSurveyQuestion');
    }

    
}
