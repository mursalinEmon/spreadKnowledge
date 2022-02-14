@extends('layouts.front-end.theme')

@section('content')
<main id="main">

<!-- ======= Breadcrumbs ======= -->
<div class="breadcrumbs" data-aos="fade-in">
  <div class="container">
    <h2>Course Details</h2>
    <!-- <p>Est dolorum ut non facere possimus quibusdam eligendi voluptatem. Quia id aut similique quia voluptas sit quaerat debitis. Rerum omnis ipsam aperiam consequatur laboriosam nemo harum praesentium. </p> -->
  </div>
</div><!-- End Breadcrumbs -->

<!-- ======= Cource Details Section ======= -->
<section id="course-details" class="course-details">
  <div class="container" data-aos="fade-up">

    <div class="row">
      <div class="col-lg-8">
        <img src="{{ asset($course->image) }}" class="img-fluid" alt="">
        <h2>{{$course->course_title}}</h2>
        <hr>
        <h3>Lesson List</h3>
        @foreach($course->lessons as $lesson)

        <p>
          {{$lesson->lesson_title}}
        </p>
        @endforeach
      </div>
      <div class="col-lg-4">

        <div class="course-info d-flex justify-content-between align-items-center">
          <h5>Contributor</h5>
          <p><a href="#">{{$contributor[0]}}</a></p>
        </div>

        <div class="course-info d-flex justify-content-between align-items-center">
          <h5>Students</h5>
          <p>{{ $course->student_count }}</p>
        </div>

        <div class="course-info d-flex justify-content-between align-items-center">
          <h5>Lessons</h5>
          <p>{{ $course->lessons->count() }}</p>
        </div>

        <div class="course-info d-flex justify-content-between align-items-center">
          <h5></h5>
                      @if($course->type=='free')
                          <p><a href="{{ route('course.enroll',[$course->id]) }}" class="btn btn-primary" style="color:#ffffff;">Enroll</a></p>

                              @elseif($course->type=='paid')
                              <a href="{{route('cart.add',[$course->id])}}" class="btn btn-secondary ml-4">Enroll Course</a>

                                @else
                              @endif
        </div>

      </div>
    </div>

  </div>
</section><!-- End Cource Details Section -->

<!-- ======= Cource Details Tabs Section ======= -->
><!-- End Cource Details Tabs Section -->

</main>
@endsection