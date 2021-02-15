@extends('layouts.theme')

@section('content')
    <!-- Create Course Topic-->
    <div class="container">
        <div id="app1">
            <create-course-lesson :course="{{ $course}}"></create-course-lesson>

        </div>
    </div>
@endsection
