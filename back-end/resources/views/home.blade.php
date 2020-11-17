@extends('layouts.app')

@section('content')
<div class="container">
    <div class="row justify-content-center">
        <div class="col-md-8">
            <div class="card">
                @auth
                @if(auth()->user()->type == 'contributor')
                <div class="card-header"><a class="btn btn-primary" rel="stylesheet" href="{{ route('contributor_dashboard') }}"> Dashboard</a></div>
                <div class="card-header"><a class="btn btn-primary" rel="stylesheet" href="{{ route('tags.fetch') }}"> Tags</a></div>
                @endif
                @endauth
                <div class="card-body">
                    @if (session('status'))
                        <div class="alert alert-success" role="alert">
                            {{ session('status') }}
                        </div>
                    @endif

                    {{ __('You are logged in!') }}
                </div>
            </div>
        </div>
    </div>
</div>
@endsection
