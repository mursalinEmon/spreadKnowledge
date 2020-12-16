@extends('layouts.theme')

@section('content')
    <!-- Edit Course Lesson-->
    <div class="container">
        <div id="app1">
            <edit-lesson :lesson="{{ $lesson }}"></edit-lesson>

        </div>
    </div>
@endsection
