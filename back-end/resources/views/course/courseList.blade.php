@extends('layouts.theme')

@section('content')
<div class="container">
    @forelse ($courses as $item)
    <div class="card" style="width: 18rem;">
        <img class="card-img-top" src="{{ asset($item->image) }}" alt="Card image cap">
        <div class="card-body">
          <h5 class="card-title">{{ $item->course_title }}</h5>
          <p class="card-text"><span class="fas fa-user-edit text-black-50" style="padding:5px;" ></span><small> {{ $item->course_level }}</small></p>

          <a href="{{ route('lesson.list',['id'=> $item->id]) }}" class="btn btn-primary">Browse The Course</a>
        </div>
      </div>
    @empty
        <h1>No data</h1>
    @endforelse

</div>

@endsection
