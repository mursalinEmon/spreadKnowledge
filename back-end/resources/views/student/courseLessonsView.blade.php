@extends('layouts.app')
@section('content')
<div class="container">
    <div >
        <lesson-body :selected_course_lessons="{{ $selected_course_lessons }}" ></lesson-body>

    </div>
</div>


@endsection
