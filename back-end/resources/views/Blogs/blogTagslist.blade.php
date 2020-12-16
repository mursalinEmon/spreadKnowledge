@extends('layouts.theme')
@section('content')
<div class="container">
    @if (session('message'))
    <div class="alert alert-success alert-block d-flex justify-content-between">

        <strong>   {{ session('message') }}</strong>
        <button class="btn btn-danger right" type="button" class="close" data-dismiss="alert">X</button>
    </div>
    @endif
    @foreach ($tags as $tag)
    <div class="card">
        <div class="card-body shadow">
          <h4 class="card-title">{{ $tag->name }}</h4>
          <div class="d-flex">


                <a style="margin-right: 2rem!important;" href="{{ route('tag.edit',$tag->id) }}" class="btn btn-primary">Edit Tag</a>

            <form action="{{ route('tag.delete') }}" method="POST">
                @csrf
                <input value="{{ $tag->id }}" type="hidden" name="id">
                <button type="submit" value="submit" class="btn btn-danger">Delete Tag</button>
            </form>
          </div>


        </div>
      </div>
      <br>
    @endforeach
</div>
@endsection
