@extends('layouts.app')

@section('content')
        <survey-question :question="{{$question}}"></survey-question>
@endsection