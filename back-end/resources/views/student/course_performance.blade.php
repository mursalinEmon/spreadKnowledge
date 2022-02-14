@extends('layouts.theme')

@section('content')
    <div class="container">
        <table class="table">
            <thead>
            <tr>
                <th scope="col">Image</th>
                <th scope="col">Course</th>
                <th scope="col">Status</th>
                <th scope="col">Completed</th>
            </tr>
            </thead>
            <tbody>

                @forelse($courses_models as $course)
                    <tr>
                    <td><img src="{{asset($course->image)}}" style="height: 80px;width:80px;" alt=""></td>
                    <td>{{$course->course_title}}</td>
                @if($progress_report[$course->id]==100.00)
                    <td>Completed</td>
                    @else
                        <td>In-Complete</td>
                    @endif

                    <td>{{$progress_report[$course->id]}}%</td>
                    </tr>
                @empty
                    <h1 class="text text-danger">No Data To Show..!!</h1>
                @endforelse



            </tbody>
        </table>
    </div>
@endsection
