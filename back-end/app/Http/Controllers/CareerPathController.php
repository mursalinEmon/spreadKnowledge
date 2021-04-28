<?php

namespace App\Http\Controllers;

use App\CareerPath;
use Countable;
use Illuminate\Http\Request;

class CareerPathController extends Controller
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
    public function create()
    {
        return view('career_path.create');
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
            $imageName=time().'.'.$request->file->getClientOriginalExtension();
            $image->move(public_path('image/'.auth()->user()->name.'/'.'career-path/'),$imageName);

        }
        $careerPath=CareerPath::create([
            'title'=>$request->title,
            'creator_id'=>auth()->user()->id,
            'banner'=>'image/'.auth()->user()->name.'/'.'career-path/'.$imageName,
            'description'=>$request->description
        ]);

            return response(['message'=>'added','careetpath'=>$careerPath->id]);
    }

    /**
     * Display the specified resource.
     *
     * @param  \App\CareerPath  $careerPath
     * @return \Illuminate\Http\Response
     */
    public function show(CareerPath $careerPath)
    {
        //
    }

    /**
     * Show the form for editing the specified resource.
     *
     * @param  \App\CareerPath  $careerPath
     * @return \Illuminate\Http\Response
     */
    public function edit(CareerPath $careerPath)
    {
        //
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  \App\CareerPath  $careerPath
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request, $id)
    {
        // dd($request,$id);
        $path=CareerPath::findOrFail((int)$id);
        $path->update([
            'course_list'=>$request->course_id_list,
        ]);
        return response(['message'=>'success']);
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  \App\CareerPath  $careerPath
     * @return \Illuminate\Http\Response
     */
    public function destroy(CareerPath $careerPath)
    {
        //
    }
}
