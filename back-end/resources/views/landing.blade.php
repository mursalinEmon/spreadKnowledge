@extends('layouts.front-end.theme')

@section('content')
    <!-- {{$top_courses}} -->
<main id="main">
    
    <!-- ======= Hero Section ======= -->
    <section id="hero" class="d-flex justify-content-center align-items-center">
        <div class="container position-relative" data-aos="zoom-in" data-aos-delay="100">
            <h1>Learning Today,<br>Leading Tomorrow</h1>
            <!-- <h2>We are team of talanted designers making websites with Bootstrap</h2>
            <a href="courses.html" class="btn-get-started">Get Started</a> -->
        </div>
    </section><!-- End Hero -->

    <!-- ======= About Section ======= -->
    <section id="about" class="about">
        <div class="container" data-aos="fade-up">

            <div class="section-title">
                <h2>About</h2>
                <p>About System</p>
            </div>

            <div class="row">
                <div class="col-lg-6 order-1 order-lg-2" data-aos="fade-left" data-aos-delay="100">
                    <img src="assets/img/about.jpg" class="img-fluid" alt="">
                </div>
                <div class="col-lg-6 pt-4 pt-lg-0 order-2 order-lg-1 content">
                    <h3>A Web Based Interactive Educational System for Learning Web Development .</h3>
                    <p class="font-italic">
                    Online Education has played an important role in the field of education. It is a great blessing of modern
technology. In present world, online education has become the most popular choice of the students in higher
education degree program. Many of the universities in the world have offered their higher studies program
through the online education system where any student from any place of the world can achieve their higher
studies via the internet.
                    </p>
                    <ul>
                        <li><i class="icofont-check-circled"></i> To create an open source educational community for university Students.</li>
                        <li><i class="icofont-check-circled"></i> To make an independent and self-directed learning.</li>
                        <li><i class="icofont-check-circled"></i> To make education much easier and closer to everybody.</li>
                        <li><i class="icofont-check-circled"></i> To promote self-learning.</li>
                    </ul>
                    <p>The main purpose of this project is to develop an online education system for undergraduate university students where a learner can get self-directed and independent learning.</p>
                    <!-- <a href="about.html" class="learn-more-btn">Learn More</a> -->
                </div>
            </div>

        </div>
    </section><!-- End About Section -->

    <!-- ======= Counts Section ======= -->
    <section id="counts" class="counts section-bg">
        <div class="container">

            <div class="row counters">

                <div class="col-lg-3 col-6 text-center">
                    @php
                        $s_count = App\StudentProfile::count();
                        $c_count = App\Course::count();
                    @endphp
                    <span data-toggle="counter-up">{{$s_count}}</span>
                    <p>Students</p>
                </div>

                <div class="col-lg-3 col-6 text-center">
                    <span data-toggle="counter-up">{{$c_count}}</span>
                    <p>Courses</p>
                </div>

                <div class="col-lg-3 col-6 text-center">
                    <span data-toggle="counter-up">42</span>
                    <p>Events</p>
                </div>

                <div class="col-lg-3 col-6 text-center">
                    <span data-toggle="counter-up">15</span>
                    <p>Contributors</p>
                </div>

            </div>

        </div>
    </section><!-- End Counts Section -->

    <!-- ======= Why Us Section ======= -->
    <section id="why-us" class="why-us">
        <div class="container" data-aos="fade-up">

            <div class="row">
                <div class="col-lg-4 d-flex align-items-stretch">
                    <div class="content">
                        <h3>Why Choose Mentor?</h3>
                        <p>The scope of this work is mainly designed for Computer Science Engineering’s or IT students where they can get educational supports. We have an intelligence support system to support our learners to select their courses as per their educational qualifications. 
                        </p>
                        <!-- <div class="text-center">
                            <a href="about.html" class="more-btn">Learn More <i class="bx bx-chevron-right"></i></a>
                        </div> -->
                    </div>
                </div>
                <div class="col-lg-8 d-flex align-items-stretch" data-aos="zoom-in" data-aos-delay="100">
                    <div class="icon-boxes d-flex flex-column justify-content-center">
                        <div class="row">
                            <div class="col-xl-4 d-flex align-items-stretch">
                                <div class="icon-box mt-4 mt-xl-0">
                                    <i class="bx bx-receipt"></i>
                                    <h4>Open Source</h4>
                                    <p>The term open source refers to something people can modify and share because its design is publicly accessible</p>
                                </div>
                            </div>
                            <div class="col-xl-4 d-flex align-items-stretch">
                                <div class="icon-box mt-4 mt-xl-0">
                                    <i class="bx bx-cube-alt"></i>
                                    <h4>Courses</h4>
                                    <p>A course management system (CMS) is a collection of software tools providing an online environment for course interactions. </p>
                                </div>
                            </div>
                            <div class="col-xl-4 d-flex align-items-stretch">
                                <div class="icon-box mt-4 mt-xl-0">
                                    <i class="bx bx-images"></i>
                                    <h4>Q&A Portal</h4>
                                    <p>Q&A software is online software that attempts to answer questions asked by users (Q&A stands for "question and answer")</p>
                                </div>
                            </div>
                        </div>
                    </div><!-- End .content-->
                </div>
            </div>

        </div>
    </section><!-- End Why Us Section -->

    <!-- ======= Features Section ======= -->
    <!-- <section id="features" class="features">
        <div class="container" data-aos="fade-up">

            <div class="row" data-aos="zoom-in" data-aos-delay="100">
                <div class="col-lg-3 col-md-4">
                    <div class="icon-box">
                        <i class="ri-store-line" style="color: #ffbb2c;"></i>
                        <h3><a href="">Lorem Ipsum</a></h3>
                    </div>
                </div>
                <div class="col-lg-3 col-md-4 mt-4 mt-md-0">
                    <div class="icon-box">
                        <i class="ri-bar-chart-box-line" style="color: #5578ff;"></i>
                        <h3><a href="">Dolor Sitema</a></h3>
                    </div>
                </div>
                <div class="col-lg-3 col-md-4 mt-4 mt-md-0">
                    <div class="icon-box">
                        <i class="ri-calendar-todo-line" style="color: #e80368;"></i>
                        <h3><a href="">Sed perspiciatis</a></h3>
                    </div>
                </div>
                <div class="col-lg-3 col-md-4 mt-4 mt-lg-0">
                    <div class="icon-box">
                        <i class="ri-paint-brush-line" style="color: #e361ff;"></i>
                        <h3><a href="">Magni Dolores</a></h3>
                    </div>
                </div>
                <div class="col-lg-3 col-md-4 mt-4">
                    <div class="icon-box">
                        <i class="ri-database-2-line" style="color: #47aeff;"></i>
                        <h3><a href="">Nemo Enim</a></h3>
                    </div>
                </div>
                <div class="col-lg-3 col-md-4 mt-4">
                    <div class="icon-box">
                        <i class="ri-gradienter-line" style="color: #ffa76e;"></i>
                        <h3><a href="">Eiusmod Tempor</a></h3>
                    </div>
                </div>
                <div class="col-lg-3 col-md-4 mt-4">
                    <div class="icon-box">
                        <i class="ri-file-list-3-line" style="color: #11dbcf;"></i>
                        <h3><a href="">Midela Teren</a></h3>
                    </div>
                </div>
                <div class="col-lg-3 col-md-4 mt-4">
                    <div class="icon-box">
                        <i class="ri-price-tag-2-line" style="color: #4233ff;"></i>
                        <h3><a href="">Pira Neve</a></h3>
                    </div>
                </div>
                <div class="col-lg-3 col-md-4 mt-4">
                    <div class="icon-box">
                        <i class="ri-anchor-line" style="color: #b2904f;"></i>
                        <h3><a href="">Dirada Pack</a></h3>
                    </div>
                </div>
                <div class="col-lg-3 col-md-4 mt-4">
                    <div class="icon-box">
                        <i class="ri-disc-line" style="color: #b20969;"></i>
                        <h3><a href="">Moton Ideal</a></h3>
                    </div>
                </div>
                <div class="col-lg-3 col-md-4 mt-4">
                    <div class="icon-box">
                        <i class="ri-base-station-line" style="color: #ff5828;"></i>
                        <h3><a href="">Verdo Park</a></h3>
                    </div>
                </div>
                <div class="col-lg-3 col-md-4 mt-4">
                    <div class="icon-box">
                        <i class="ri-fingerprint-line" style="color: #29cc61;"></i>
                        <h3><a href="">Flavor Nivelanda</a></h3>
                    </div>
                </div>
            </div>

        </div>
    </section> -->
    <!-- End Features Section -->

    <!-- ======= Popular Courses Section ======= -->
    <section id="popular-courses" class="courses">
        <div class="container" data-aos="fade-up">

            <div class="section-title">
                <h2>Courses</h2>
                <p>Popular Courses</p>
            </div>

            <div class="row" data-aos="zoom-in" data-aos-delay="100">
                @foreach($top_courses as $item)
                <div class="col-lg-4 col-md-6 d-flex align-items-stretch">
                    <div class="course-item">
                        <img src="{{ asset($item->image) }}" class="img-fluid" alt="..." style="height: 15rem!important;width:100%;">
                        <div class="course-content">
                            <div class="d-flex justify-content-between align-items-center mb-3">
                                <h4><a href="{{route('course.details',[$item->id])}}">{{ $item->course_title }}</a></h4>
                                <p class="price">{{ $item->course_level }}</p>
                            </div>

                            <h3><a href="{{route('course.details',[$item->id])}}">{{ $item->course_title }}</a></h3>
                            <p>Et architecto provident deleniti facere repellat nobis iste. Id facere quia quae dolores dolorem tempore.</p>
                            <div class="trainer d-flex justify-content-between align-items-center">
                                <div class="trainer-profile d-flex align-items-center">
                                    <img src="assets/img/trainers/trainer.jpg" class="img-fluid" alt="">
                                    <span></span>
                                </div>
                                <div class="trainer-rank d-flex align-items-center">
                                    <i class="bx bx-user"></i>&nbsp;{{ $item->student_count }}
                                    &nbsp;&nbsp;
                                    <i class="bx bx-grid"></i>&nbsp;{{ $item->lessons->count() }}
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                @endforeach<!-- End Course Item-->

            </div>

        </div>
    </section><!-- End Popular Courses Section -->

    @if(count($survery_courses)>0)
    <section id="popular-courses" class="courses">
        <div class="container" data-aos="fade-up">

            <div class="section-title">
                <h2>Recommendation</h2>
                <p>Recommended Courses Based on Your Survey</p>
            </div>

            <div class="row" data-aos="zoom-in" data-aos-delay="100">
                @foreach($survery_courses as $item)
                <div class="col-lg-4 col-md-6 d-flex align-items-stretch">
                    <div class="course-item">
                        <img src="{{ asset($item->image) }}" class="img-fluid" alt="..." style="height: 15rem!important;width:100%;">
                        <div class="course-content">
                            <div class="d-flex justify-content-between align-items-center mb-3">
                                <h4>{{ $item->course_title }}</h4>
                                <p class="price">{{ $item->course_level }}</p>
                            </div>

                            <h3><a href="{{route('course.details',[$item->id])}}">{{ $item->course_title }}</a></h3>
                            <p>Et architecto provident deleniti facere repellat nobis iste. Id facere quia quae dolores dolorem tempore.</p>
                            <div class="trainer d-flex justify-content-between align-items-center">
                                <div class="trainer-profile d-flex align-items-center">
                                    <img src="assets/img/trainers/trainer.jpg" class="img-fluid" alt="">
                                    <span></span>
                                </div>
                                <div class="trainer-rank d-flex align-items-center">
                                    <i class="bx bx-user"></i>&nbsp;{{ $item->student_count }}
                                    &nbsp;&nbsp;
                                    <i class="bx bx-grid"></i>&nbsp;{{ $item->lessons->count() }}
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                @endforeach<!-- End Course Item-->

            </div>

        </div>
    </section>
    @endif

    <!-- ======= Trainers Section ======= -->
    <!-- <section id="trainers" class="trainers">
        <div class="container" data-aos="fade-up">

            <div class="section-title">
                <h2>Trainers</h2>
                <p>Our Professional Trainers</p>
            </div>

            <div class="row" data-aos="zoom-in" data-aos-delay="100">
                <div class="col-lg-4 col-md-6 d-flex align-items-stretch">
                    <div class="member">
                        <img src="assets/img/trainers/trainer-1.jpg" class="img-fluid" alt="">
                        <div class="member-content">
                            <h4>Walter White</h4>
                            <span>Web Development</span>
                            <p>
                                Magni qui quod omnis unde et eos fuga et exercitationem. Odio veritatis perspiciatis quaerat qui aut aut aut
                            </p>
                            <div class="social">
                                <a href=""><i class="icofont-twitter"></i></a>
                                <a href=""><i class="icofont-facebook"></i></a>
                                <a href=""><i class="icofont-instagram"></i></a>
                                <a href=""><i class="icofont-linkedin"></i></a>
                            </div>
                        </div>
                    </div>
                </div>

                <div class="col-lg-4 col-md-6 d-flex align-items-stretch">
                    <div class="member">
                        <img src="assets/img/trainers/trainer-2.jpg" class="img-fluid" alt="">
                        <div class="member-content">
                            <h4>Sarah Jhinson</h4>
                            <span>Marketing</span>
                            <p>
                                Repellat fugiat adipisci nemo illum nesciunt voluptas repellendus. In architecto rerum rerum temporibus
                            </p>
                            <div class="social">
                                <a href=""><i class="icofont-twitter"></i></a>
                                <a href=""><i class="icofont-facebook"></i></a>
                                <a href=""><i class="icofont-instagram"></i></a>
                                <a href=""><i class="icofont-linkedin"></i></a>
                            </div>
                        </div>
                    </div>
                </div>

                <div class="col-lg-4 col-md-6 d-flex align-items-stretch">
                    <div class="member">
                        <img src="assets/img/trainers/trainer-3.jpg" class="img-fluid" alt="">
                        <div class="member-content">
                            <h4>William Anderson</h4>
                            <span>Content</span>
                            <p>
                                Voluptas necessitatibus occaecati quia. Earum totam consequuntur qui porro et laborum toro des clara
                            </p>
                            <div class="social">
                                <a href=""><i class="icofont-twitter"></i></a>
                                <a href=""><i class="icofont-facebook"></i></a>
                                <a href=""><i class="icofont-instagram"></i></a>
                                <a href=""><i class="icofont-linkedin"></i></a>
                            </div>
                        </div>
                    </div>
                </div>

            </div>

        </div>
    </section> -->
    <!-- End Trainers Section -->

</main><!-- End #main -->
<!-- Button trigger modal -->

@if(Auth::check())
    @if(auth()->user()->survey_taken == 0)
    
    <!-- Modal -->
    <div class="modal fade" id="exampleModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
        <div class="modal-header">
            <h5 class="modal-title" id="exampleModalLabel">Survey For Recomendation</h5>
            <button type="button" class="close" data-dismiss="modal" aria-label="Close">
            <span aria-hidden="true">&times;</span>
            </button>
        </div>
        <div class="modal-body">
          <h4 class="text text-center ">  Do You Want To Take The Survey ?</h4>
        </div>
        <div class="modal-footer">
            <button type="button" class="btn btn-secondary" data-dismiss="modal">NO</button>
            <a href="{{route('survey')}}" class="btn btn-primary">Yes</a>
        </div>
        </div>
    </div>
    </div>
    @endif
@endif

@endsection
