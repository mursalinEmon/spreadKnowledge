@extends('layouts.theme')

@section('content')

    <create-lesson-exam :course="{{ $course }}":courseLesson="{{ $courseLesson }}"></create-lesson-exam>



@endsection
