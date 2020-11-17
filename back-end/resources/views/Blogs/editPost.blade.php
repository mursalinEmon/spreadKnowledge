@extends('layouts.theme')

@section('content')
    <!-- Edit Post Component-->
    <div class="container">
        <div id="app1">
            <update-post :post="{{ $post }}"></update-post>

        </div>
    </div>
@endsection
