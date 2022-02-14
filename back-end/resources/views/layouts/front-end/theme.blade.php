<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="utf-8">
    <meta content="width=device-width, initial-scale=1.0" name="viewport">

    <title>Mentor</title>
    <meta content="" name="description">
    <meta content="" name="keywords">
    <script src="{{ asset('js/app.js') }}" defer></script>
    <!-- Favicons -->
    <link href={{asset("assets/img/favicon.png")}} rel="icon">
    <link href={{asset("assets/img/apple-touch-icon.png")}} rel="apple-touch-icon">

    <!-- Google Fonts -->
    <link href="https://fonts.googleapis.com/css?family=Open+Sans:300,300i,400,400i,600,600i,700,700i|Raleway:300,300i,400,400i,500,500i,600,600i,700,700i|Poppins:300,300i,400,400i,500,500i,600,600i,700,700i" rel="stylesheet">

    <!-- Vendor CSS Files -->
    <link href={{asset("assets/vendor/bootstrap/css/bootstrap.min.css")}} rel="stylesheet">
    <link href={{asset("assets/vendor/icofont/icofont.min.css")}} rel="stylesheet">
    <link href={{asset("assets/vendor/boxicons/css/boxicons.min.css")}} rel="stylesheet">
    <link href={{asset("assets/vendor/remixicon/remixicon.css")}} rel="stylesheet">
    <link href={{asset("assets/vendor/owl.carousel/assets/owl.carousel.min.css")}} rel="stylesheet">
    <link href={{asset("assets/vendor/animate.css/animate.min.css")}} rel="stylesheet">
    <link href={{asset("assets/vendor/aos/aos.css")}} rel="stylesheet">

    <!-- Template Main CSS File -->
    <link href={{asset("assets/css/style.css")}} rel="stylesheet">

    <!-- =======================================================
    * Template Name: Mentor - v2.2.0
    * Template URL: https://bootstrapmade.com/mentor-free-education-bootstrap-theme/
    * Author: BootstrapMade.com
    * License: https://bootstrapmade.com/license/
    ======================================================== -->
</head>

<body>

<!-- ======= Header ======= -->
<header id="header" class="fixed-top">
    <div class="container d-flex align-items-center">

        <h1 class="logo mr-auto"><a href="{{url('/')}}">Mentor</a></h1>
        <!-- Uncomment below if you prefer to use an image logo -->
        <!-- <a href="index.html" class="logo mr-auto"><img src="assets/img/logo.png" alt="" class="img-fluid"></a>-->

        <nav class="nav-menu d-none d-lg-block">
            <ul>
                <!-- <li class="active"><a href="index.html">Home</a></li> -->
                <li><a href="{{ url('/') }}">Home</a></li>
                <li><a href="{{ route('courses') }}">Courses</a></li>
                <!-- <li><a href="trainers.html">Trainers</a></li> -->
                <li><a href="{{route ('question.list')}}">QnA</a></li>
                <li><a href="{{ route('show.blogs') }}">Blogs</a></li>
                <!-- <li class="drop-down"><a href="">Drop Down</a>
                    <ul>
                        <li><a href="#">Drop Down 1</a></li>
                        <li class="drop-down"><a href="#">Deep Drop Down</a>
                            <ul>
                                <li><a href="#">Deep Drop Down 1</a></li>
                                <li><a href="#">Deep Drop Down 2</a></li>
                                <li><a href="#">Deep Drop Down 3</a></li>
                                <li><a href="#">Deep Drop Down 4</a></li>
                                <li><a href="#">Deep Drop Down 5</a></li>
                            </ul>
                        </li>
                        <li><a href="#">Drop Down 2</a></li>
                        <li><a href="#">Drop Down 3</a></li>
                        <li><a href="#">Drop Down 4</a></li>
                    </ul>
                </li> -->

                @if(Auth::check())
                    @if(auth()->user()->type == 'student')
                    
                    <li><a href="{{ route('student.dashboard') }}">Dashboard</a></li>
                    @elseif(auth()->user()->type == 'contributor')
                    <li><a href="{{ route('contributor_dashboard') }}">Dashboard</a></li>
                    @endif
                @else
                <li><a href="{{ url('/login') }}">Login</a></li>
                @endif
                
                <li class="d-flex justify-content-between"><a href="{{ route('cart.index') }}"><i class='bx bx-cart' style="font-size:24px;"></i></i></a><span class="cart-amt d-flex justify-content-center align-item-center text-white" style="height:1rem;width:1rem;border-radius:50%;background-color:green;font-size:10px;margin-top:-.5rem;margin-left:-.3rem;">{{ count(Cart::content()) }}</span></li>

            </ul>
        </nav><!-- .nav-menu -->

        <a href="{{ route('courses') }}" class="get-started-btn">Get Started</a>

    </div>
</header><!-- End Header -->

<div id="app1">
    @yield('content')
</div>





<!-- ======= Footer ======= -->
<footer id="footer">

    <div class="footer-top">
        <div class="container">
            <div class="row">

                <div class="col-lg-3 col-md-6 footer-contact">
                    <h3>Mentor</h3>
                    <p>
                        Mirpur-1, Dhaka <br>
                        Bangladesh <br><br>
                        <strong>Phone:</strong> +880133333333<br>
                        <strong>Email:</strong> example@gmail.com<br>
                    </p>
                </div>

                <div class="col-lg-2 col-md-6 footer-links">
                    <h4>Useful Links</h4>
                    <ul>
                        <li><i class="bx bx-chevron-right"></i> <a href="#">Home</a></li>
                        <li><i class="bx bx-chevron-right"></i> <a href="#">About us</a></li>
                        <li><i class="bx bx-chevron-right"></i> <a href="#">Services</a></li>
                        <li><i class="bx bx-chevron-right"></i> <a href="#">Terms of service</a></li>
                        <li><i class="bx bx-chevron-right"></i> <a href="#">Privacy policy</a></li>
                    </ul>
                </div>

                <div class="col-lg-3 col-md-6 footer-links">
                    <h4>Our Services</h4>
                    <ul>
                        <li><i class="bx bx-chevron-right"></i> <a href="#">Web Design</a></li>
                        <li><i class="bx bx-chevron-right"></i> <a href="#">Web Development</a></li>
                        <li><i class="bx bx-chevron-right"></i> <a href="#">Product Management</a></li>
                        <li><i class="bx bx-chevron-right"></i> <a href="#">Marketing</a></li>
                        <li><i class="bx bx-chevron-right"></i> <a href="#">Graphic Design</a></li>
                    </ul>
                </div>

                <div class="col-lg-4 col-md-6 footer-newsletter">
                    <h4>Join Our Newsletter</h4>
                    <!-- <p>Tamen quem nulla quae legam multos aute sint culpa legam noster magna</p> -->
                    <form action="" method="post">
                        <input type="email" name="email"><input type="submit" value="Subscribe">
                    </form>
                </div>

            </div>
        </div>
    </div>

    <div class="container d-md-flex py-4">

        <div class="mr-md-auto text-center text-md-left">
            <div class="copyright">
                &copy; Copyright <strong><span>Mentor</span></strong>. All Rights Reserved
            </div>
            <div class="credits">
                <!-- All the links in the footer should remain intact. -->
                <!-- You can delete the links only if you purchased the pro version. -->
                <!-- Licensing information: https://bootstrapmade.com/license/ -->
                <!-- Purchase the pro version with working PHP/AJAX contact form: https://bootstrapmade.com/mentor-free-education-bootstrap-theme/ -->
               
            </div>
        </div>
        <div class="social-links text-center text-md-right pt-3 pt-md-0">
            <a href="#" class="twitter"><i class="bx bxl-twitter"></i></a>
            <a href="#" class="facebook"><i class="bx bxl-facebook"></i></a>
            <a href="#" class="instagram"><i class="bx bxl-instagram"></i></a>
            <a href="#" class="google-plus"><i class="bx bxl-skype"></i></a>
            <a href="#" class="linkedin"><i class="bx bxl-linkedin"></i></a>
        </div>
    </div>
</footer><!-- End Footer -->

<a href="#" class="back-to-top"><i class="bx bx-up-arrow-alt"></i></a>
<div id="preloader"></div>

<!-- Vendor JS Files -->
<script src="{{asset('assets/vendor/jquery/jquery.min.js')}}"></script>
<script src="{{asset('assets/vendor/bootstrap/js/bootstrap.bundle.min.js')}}"></script>
<script src="{{asset('assets/vendor/jquery.easing/jquery.easing.min.js')}}"></script>
<script src="{{asset('assets/vendor/php-email-form/validate.js')}}"></script>
<script src="{{asset('assets/vendor/waypoints/jquery.waypoints.min.js')}}"></script>
<script src="{{asset('assets/vendor/counterup/counterup.min.js')}}"></script>
<script src="{{asset('assets/vendor/owl.carousel/owl.carousel.min.js')}}"></script>
<script src="{{asset('assets/vendor/aos/aos.js')}}"></script>
<script>
    $(document).ready(function() {
        setTimeout(function(){ 
            $('#exampleModal').modal('show');
        }, 3000);
    })
  
</script>
<!-- Template Main JS File -->
<script src="{{asset('assets/js/main.js')}}"></script>

</body>

</html>
