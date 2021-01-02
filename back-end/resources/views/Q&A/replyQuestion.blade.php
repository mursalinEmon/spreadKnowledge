@extends('layouts.app')
@section( 'content')

<div class="container">
    <reply-question :question="{{ $question }}"></reply-question>
</div>
@endsection
