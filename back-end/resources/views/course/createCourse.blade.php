@extends('layouts.theme')

@section('content')
    <!-- Create Post Component-->
    <div class="container">
        <div id="app1">
            <create-course  :categories="{{ $categories }}"></create-course>
        </div>
    </div>
@endsection
