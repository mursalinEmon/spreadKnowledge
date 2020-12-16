<?php

namespace App\Http\Controllers;

use App\BlogTag;
use Illuminate\Http\Request;

class BlogTagController extends Controller
{
    public function all_tags(){
        $tags=BlogTag::all();
        return view('Blogs.blogTagslist',compact('tags'));
    }
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        $tags=BlogTag::all();
        $name=[];
        foreach($tags as $tag){
            array_push($name,$tag->name);
        }
        return response(['tags'=>$name]);
    }

    /**
     * Show the form for creating a new resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function create()
    {
       return view('Blogs.createTags');
    }

    /**
     * Store a newly created resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function store(Request $request)
    {
        $tag=BlogTag::create([
            'name'=>$request->title,
            'description'=>$request->description,
        ]);
        return response(['message'=>"Tag Created Successfully"]);
    }

    /**
     * Display the specified resource.
     *
     * @param  \App\BlogTag  $blogTag
     * @return \Illuminate\Http\Response
     */
    public function show(BlogTag $blogTag)
    {
        //
    }

    /**
     * Show the form for editing the specified resource.
     *
     * @param  \App\BlogTag  $blogTag
     * @return \Illuminate\Http\Response
     */
    public function edit(BlogTag $blogTag)
    {
        return view('Blogs.blogTagsEdit',compact('blogTag'));
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  \App\BlogTag  $blogTag
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request)
    {

        $blogTag=BlogTag::findOrFail($request->id);
        $blogTag->update([
            'name'=>$request->title,
            'description'=>$request->description,
        ]);
        return response(['message'=>"Tag updated Successfully..!"]);
    }
    public function delete_tag(Request $request){
        $tag=BlogTag::findOrFail($request->id);
        $tag->delete();
        return redirect()->back();
    }
    /**
     * Remove the specified resource from storage.
     *
     * @param  \App\BlogTag  $blogTag
     * @return \Illuminate\Http\Response
     */
    public function destroy(BlogTag $blogTag)
    {
        //
    }
}
