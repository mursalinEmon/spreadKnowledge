@extends('layouts.theme')

@section('content')
<div class="container">
    @if(Session::has('message'))
    <div class="alert alert-success alert-dismissible fade show" role="alert">
        {{  Session::get('message')}}
        <button type="button" class="close" data-dismiss="alert" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
    @endif

  <div class="row">
    <div class="col-md-6 col-lg-6" style="padding-left: auto;margin-left:auto;">
        @foreach ($enrolled_courses as $item)
        <div class="card mb-4" style="width: 22rem;margin-left:auto;margin-right:auto;">
            <img class="card-img-top" src="{{ asset($item->image) }}" alt="Card image cap">
            <div class="card-body">
              <h5 class="card-title">{{ $item->course_title }}</h5>
              <p class="card-text"><span class="fas fa-user-edit text-black-50" style="padding:5px;" ></span><small> {{ $item->course_level }}</small>
                @if(auth()->user()->type == 'contributor')
                <span class="fas fa-book-reader text-black-50" style="padding:5px;" ></span><small>{{ $item->student_count }} {{ Str::plural('student', 1) }}</small>
                @endif

            </p>
                @if(auth()->user()->type == 'student')

                    @if( !in_array($item->id,auth()->user()->student_profile->enrolled_courses))
                    <div class="col-md-8 offset-3 d-flex justify-content-between">
                        <a href="{{ route('course.enroll',[$item->id]) }}" class="btn btn-primary">Enroll</a>
                        <a href="#" class="btn btn-secondary ml-4">Details</a>
                    </div>
                    @else
                    <div class="col-md-10  d-flex justify-content-between">
                        <a href="{{ route('course.lessons',$item->id) }}" class="btn btn-success">Browse The Course</a>

                    </div>
                    @endif

                @endif

            </div>
          </div>

        @endforeach
      </div>
        <div id="app1" class="col-md-6 col-lg-6">
            {{-- <create-post></create-post> --}}

            <course-carousel></course-carousel>
        </div>
  </div>
    {{-- {{ $courses->links() }} --}}

</div>

@endsection
