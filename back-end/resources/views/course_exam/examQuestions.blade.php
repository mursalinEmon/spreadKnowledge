@extends('layouts.app')

@section('content')
<div class="container" id="app1">
    <course-exam-question :questions="{{ $questions }}"></course-exam-question>

</div>
@endsection
