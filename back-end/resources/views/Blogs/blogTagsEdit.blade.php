@extends('layouts.theme')
@section('content')

 <!-- Create Tag Component-->
 <div class="container">
    <div id="app1">
        <edit-tag :tag={{ $blogTag }}></edit-tag>

    </div>
</div>
@endsection
