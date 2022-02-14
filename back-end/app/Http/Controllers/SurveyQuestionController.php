<?php

namespace App\Http\Controllers;

use App\SurveyQuestion;
use App\Category;
use App\SubCategory;
use Illuminate\Http\Request;
use Auth;

use function PHPSTORM_META\type;

class SurveyQuestionController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {   
        $question=SurveyQuestion::first();
        // dd($question);
        return view('survey.interestSurvey', compact('question'));
    }
    public function get_options(Request $request){
        
        if($request->picked && $request->picked!=""){
            $user=Auth::user();
            $picks=[];
            array_push($picks,$request->var.'-'.$request->picked);
            if($user->survey_result != null){
                $res=array_merge($user->survey_result,$picks);
                
                $user->update([
                    "survey_result"=>$res,
                    "survey_taken"=>1
                ]);
            }else{
                $user->update([
                    "survey_result"=>$picks,
                    "survey_taken"=>1
                ]);
            }
           
        }
       if($request->type !=="cat"){
            $question=SurveyQuestion::where('type',$request->type)->first();
       }
        if($request->type=="cat"){
            $cats=Category::all();
            return response(['cats' => $cats]);
            

        }elseif($request->type=="subcat" && $request->picked){
            $sub_cats=SubCategory::where("category_id",$request->picked)->get();
            if(!count($sub_cats)>0){ 
            return response(['message'=>"redirect"]);

            }else{
            return response(['message'=>"Your Feedback Stored Successfully..!!",'sub_cats' => $sub_cats,'question'=>$question]);
                
            }
        }else{
           
        }
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
        $question=SurveyQuestion::create([
            'question_body' => $request->question_body,
            'type' => $request->selectedType,
        ]);
        return response(['message'=>'success']);

    }

    /**
     * Display the specified resource.
     *
     * @param  \App\SurveyQuestion  $surveyQuestion
     * @return \Illuminate\Http\Response
     */
    public function show(SurveyQuestion $surveyQuestion)
    {
        //
    }

    /**
     * Show the form for editing the specified resource.
     *
     * @param  \App\SurveyQuestion  $surveyQuestion
     * @return \Illuminate\Http\Response
     */
    public function edit(SurveyQuestion $surveyQuestion)
    {
        //
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  \App\SurveyQuestion  $surveyQuestion
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request, SurveyQuestion $surveyQuestion)
    {
        //
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  \App\SurveyQuestion  $surveyQuestion
     * @return \Illuminate\Http\Response
     */
    public function destroy(SurveyQuestion $surveyQuestion)
    {
        //
    }
}
