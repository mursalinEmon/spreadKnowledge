<?php

namespace App\Http\Controllers;

use App\BlogPost;
use App\BlogTag;
use Auth;
use Illuminate\Http\Request;

class BlogPostController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        $tags=BlogTag::all();

        return response(["tags"=>$tags]);
    }

    /**
     * Show the form for creating a new resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function create()
    {
        return view('Blogs.createPost');
    }

    /**
     * Store a newly created resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function store(Request $request)
    {
        $post = new BlogPost();
        $post->title = $request->title;
        $post->tags = $request->tags;
        $post->content = $request->content;
        $post->user_id = auth()->user()->id;
        $post->save();

        // Post::create([
        //     'title' => $request->title,
        //     'content' => $request->content,
        //     'contributor_id'=> Auth::user()->id

        // ]);

        return response(['message' => 'Post created Successfully']);
    }

    /**
     * Display the specified resource.
     *
     * @param  \App\BlogPost  $blogPost
     * @return \Illuminate\Http\Response
     */
    public function show(BlogPost $blogPost)
    {
        //
    }

    /**
     * Show the form for editing the specified resource.
     *
     * @param  \App\BlogPost  $blogPost
     * @return \Illuminate\Http\Response
     */
    public function edit(BlogPost $blogPost)
    {
        //
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  \App\BlogPost  $blogPost
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request, BlogPost $blogPost)
    {
        //
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  \App\BlogPost  $blogPost
     * @return \Illuminate\Http\Response
     */
    public function destroy(BlogPost $blogPost)
    {
        //
    }

    public function post_list(){
        $posts=auth()->user()->post;

        return view('Blogs.postList',compact('posts'));
    }

    public function delete_post(Request $request){
        $post=BlogPost::findOrFail($request->id);
        $post->delete();

        return redirect()->back()->with('message', 'Post deleted Successfully');
    }
    public function edit_post(Request $request){
        $post=BlogPost::findOrFail($request->id);

        return view('Blogs\editPost',compact('post'));
    }
    public function update_post(Request $request){
        $post=BlogPost::findOrFail($request->id);
        $post->update(['title'=>$request->title,'content'=>$request->content,'tags'=>$request->tags]);

        return response(['message' => 'Post updated Successfully']);
    }
    public function show_blogs(){
        $blogs = BlogPost::all();
        // dd($blogs);
        return view('Blogs.showBlogs', compact('blogs'));

    }
    public function show_blog($id){

        $blog = BlogPost::findOrFail($id);
        // dd($blog);
        return view('Blogs.showBlog', compact('blog'));
        


    }
}
