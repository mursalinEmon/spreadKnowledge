@extends('layouts.theme')

@section('content')

<div class="container">
    <edit-course :course="{{ $course }}"></edit-course>
</div>

@endsection
