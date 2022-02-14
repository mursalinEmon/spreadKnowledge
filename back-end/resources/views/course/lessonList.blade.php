@extends('layouts.theme')

@section('content')
<div class="container">
    @if(Session::has('message'))
    <div class="alert alert-success alert-dismissible fade show" role="alert">
        {{  Session::get('message')}}
        <button type="button" class="close" data-dismiss="alert" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
    @endif

        @forelse ($lessons as $item)
            <div class="card">

                        <div class="card-header"> {{ $item->lesson_title }}</div>
                    <div class="card-body">
                        <div class="d-flex">
                            <form action="{{ route('lesson.delete',$item->id) }}" method="post">
                                @csrf
                                @method('delete')
                                <button type="submit" class="btn btn-danger mr-2">Delete</button>
                            </form>
                        <a href="{{ route('lesson.edit',$item->id)}}" class="btn btn-warning">Edit</a>
                        <a href="{{ route('lesson.quiz.create',['course'=>$item->course->id,'courseLesson'=>$item->id]) }}" class="btn btn-primary ml-2">Add Quiz</a>
                        </div>
                    </div>


            </div>
        @empty
            <p>No Lessons</p>
        @endforelse
    {{ $lessons->links() }}

</div>
<br>
<br>
<a href="{{ route('course.lesson',$item->course_id ?? $id) }}" style="float: right; margin-right:5vw;" class="btn btn-primary">Add more lessons</a>
@endsection
