@extends('layouts.theme')

@section('content')
    <!--  Post List Component-->
    <div class="container">
        @if (session('message'))
        <div class="alert alert-success alert-block d-flex justify-content-between">

            <strong>   {{ session('message') }}</strong>
            <button class="btn btn-danger right" type="button" class="close" data-dismiss="alert">X</button>
        </div>
        @endif
        @foreach ($posts as $post)
        <div class="card">
            <div class="card-body shadow">
              <h4 class="card-title">{{ $post->title }}</h4>
              <div class="d-flex">
                <form action="{{ route('blogpost.edit') }}" method="POST">
                    @csrf
                    <input value="{{ $post->id }}" type="hidden" name="id">
                    <button style="margin-right: 2rem!important;" type="submit" value="submit" class="btn btn-primary">Edit Post</button>
                </form>
                <form action="{{ route('blogpost.delete') }}" method="POST">
                    @csrf
                    <input value="{{ $post->id }}" type="hidden" name="id">
                    <button type="submit" value="submit" class="btn btn-danger">Delete Post</button>
                </form>
              </div>


            </div>
          </div>
          <br>
        @endforeach
    </div>
@endsection
