

@extends('layouts.app')
@section( 'content')

  <div style="max-height:90vh;">
  <div class="navbar navbar-expand-md navbar-dark bg-dark fixed-top">
      <a class="navbar-brand" href="{{url('/')}}">Mentor</a>
      <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarsExampleDefault" aria-controls="navbarsExampleDefault" aria-expanded="false" aria-label="Toggle navigation">
        <span class="navbar-toggler-icon"></span>
      </button>
  </div>

    <div role="div" class="container py-4 mt-4"  >
        <div class="row">
            <div class="col-sm-4 col-md-4" >
                <div class="shadow-sm"  style="min-height:90vh;" >
                    <div class="card-body">
                        <ul class="card-text">
                            <li><a style="margin-bottom:1.5rem;" href="{{ route('question.create') }}" class="btn btn-primary "> Add New Discussion</a></li>
                            <li><a style="margin-bottom:1.5rem;" href="#" class="btn btn-outline-info" > Pupular</a></li>
                            <li><a style="margin-bottom:1.5rem;" href="#" class="btn btn-outline-info"> Solved</a></li>
                            <li><a style="margin-bottom:1.5rem;" href="#" class="btn btn-outline-info"> Unsolved</a></li>
                            <li><a style="margin-bottom:1.5rem;" href="#" class="btn btn-outline-info"> No Reply Yet</a></li>
                        </ul>

                    </div>
                </div>
            </div>
            <div class="col-sm-8 col-md-8 mt-2" style="max-height:90vh;overflow-y:scroll; ">
                @forelse($questions as $question)
                    <div class="card shadow-sm m-2">
                        <div class="card-body">
                       <div class="d-flex justify-content-between">
                           <div class="d-flex">
                                <!-- <img src="{{ $question->user->image ? asset($question->user->image) : asset('image/'.'avatar.jpg') }}"> -->
                                <h6 class="text mt-4 ml-1">{{ $question->user->name }}</h6>
                            </div>
                             <a href="#" > <button class="btn btn-outline-info float-right" >{{ $question->topic }}</button> </a>

                       </div>
                       <a href="{{ route('question.show',$question->id) }}" class="mt-2"><h5 class="card-title" style="color:black;">{{ $question->question }}</h5></a>
                        {{-- <p class="card-text">{!! substr( $question->body,0,50) !!}</p> --}}
                        <p class="card-text">{!! substr($question->body,0,100) !!} Continue....</p>
                        </div>
                    </div>
                @empty

                @endforelse
              </div>
            </div>

        </div>

    </div>
  </div>
<style>
    ul li a{
      list-style:none;
    padding-top: .5rem;
    margin-bottom: 2rem;
    }
li{
    list-style:none;
    padding-top: .5rem;
    margin-bottom: 2rem;
}

    a{
        style:none;
        min-width:15vw;
    }
    img{
        height: 4rem;
        width:4rem;
    }

</style>
@endsection
