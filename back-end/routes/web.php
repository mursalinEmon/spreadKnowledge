<?php

use App\weerPath;
use Illuminate\Support\Facades\Route;
use Illuminate\Support\Facades\Auth;

/*
|--------------------------------------------------------------------------
| Web Routes
|--------------------------------------------------------------------------
|
| Here is where you can register web routes for your application. These
| routes are loaded by the RouteServiceProvider within a group which
| contains the "web" middleware group. Now create something great!
|
*/

//Route::get('/', function () {
//    return view('welcome');
//});
Route::get('/', 'HomeController@landing')->name('landing');
Route::get('/all-courses', 'CourseController@all_courses')->name('courses');

Route::get('/question-list', 'QuestionController@index')->name('question.list');


Auth::routes(['verify' => true]);
Route::get('/logout', function () {
    //logout user
    Auth::logout();
    // redirect to homepage
    return redirect('/');
});

Route::get('/home', 'HomeController@index')->name('home');

// Blog Portal
Route::get('/show-blogs', 'BlogPostController@show_blogs')->name('show.blogs');

Route::middleware(['verified'])->group(function () {
    Route::get('/create-post', 'BlogPostController@create')->name('blogpost.create');
    Route::post('/create-post', 'BlogPostController@store')->name('store-post');
    Route::get('/post-list', 'BlogPostController@post_list')->name('blogpost.list');
    Route::post('/delete-post', 'BlogPostController@delete_post')->name('blogpost.delete');
    Route::post('/edit-post', 'BlogPostController@edit_post')->name('blogpost.edit');
    Route::post('/update-post', 'BlogPostController@update_post')->name('blogpost.update');
    Route::get('/fetch-tags', 'BlogPostController@index')->name('tags.fetch');
    Route::get('/show-blogs/{id}', 'BlogPostController@show_blog')->name('show.blog');

});

// Blog Tags
Route::middleware(['verified'])->group(function () {
    Route::get('/tags-create', 'BlogTagController@create')->name('tag.create');
    Route::post('/tags-create', 'BlogTagController@store')->name('tag.post');
    Route::get('/tags-list', 'BlogTagController@all_tags')->name('tag.list');
    Route::get('/blogTags/{blogTag}', 'BlogTagController@edit')->name('tag.edit');
    Route::post('/blogTags-update', 'BlogTagController@update')->name('tag.update');
    Route::post('/blogTags-delete', 'BlogTagController@delete_tag')->name('tag.delete');
});

//Courses
Route::middleware(['verified'])->group(function () {
    //course crud
    Route::get('/course-create', 'CourseController@create')->name('course.create');
    Route::post('/course-create', 'CourseController@store');
    Route::get('/courses/{course}/edit', 'CourseController@edit')->name('course.edit');
    Route::post('/courses/{course}/Update', 'CourseController@update')->name('course.update');
    Route::delete('/courses/{course}', 'CourseController@destroy')->name('course.delete');

    Route::get('/category/{id}', 'CategoryController@show')->name('category.list');
    Route::get('/categories', 'CategoryController@index');

    Route::get('/get-sub-category', 'SubCategoryController@index')->name('fetch_sub_category');
    Route::get('/get-selected-sub-categories/{id}', 'SubCategoryController@find_sub')->name('find.fetch_sub_category');
    Route::post('/create-course-lesson', 'CourseController@create_lesson')->name('create.lesson');
    Route::get('/course-lesson/{id}', 'CourseLessonController@create_course_lesson')->name('course.lesson');
    Route::get('/get-course-lessons', 'CourseLessonController@find_lessons')->name('get-course-lessons');
    Route::get('/get-selected-course-lessons/{id}', 'CourseLessonController@selected_lessons')->name('get-selected-course-lessons');
    Route::get('/course-list/{id}', 'CourseController@course_list')->name('course.list');
    Route::get('/course-details/{id}', 'CourseController@course_details')->name('course.details');
    //lessons route
    Route::get('/course_lessons/{id}', 'CourseLessonController@view_lessons')->name('lesson.list');
    Route::delete('/courseLessons/{courseLesson}', 'CourseLessonController@destroy')->name('lesson.delete');
    Route::get('/edit_lesson/{id}', 'CourseLessonController@edit_lesson')->name('lesson.edit');
    Route::post('/update-lesson', 'CourseLessonController@update_lesson')->name('lesson.update');
    Route::get('/student/{id}/enrolled-courses', 'StudentProfileController@enrolled_Courses')->name('enrolled-courses.view');
    Route::get('/top-course', 'CourseController@top_courses')->name('top.courses');
    Route::get('/course/{id}/lessons', 'CourseController@selected_course_lessons')->name('course.lessons');
    Route::get('/lesson/{id}/body', 'CourseLessonController@fetch_body')->name('lesson.body');
    Route::get('/course/{cid}/lesson/{lid}/check_status', 'CourseLessonController@check_eligible')->name('lesson.check.eligible');

    Route::get('/course/{id}/getLessons', 'CourseController@fawMethod');
    Route::get('/filtered-course/{id}', 'CourseController@filtered_courses');
    Route::get('/course-performance', 'CourseController@course_performance')->name('course.performance');
    Route::post('/suggestion-feedback', 'FeedbackController@feedback')->name('course.feedback');




    //lesson quiz

    Route::get('/courses/{course}/courseLessons/{courseLesson}/quiz/create', 'ExamQuestionController@create')->name('lesson.quiz.create');

    Route::post('/courses/{course}/courseLessons/{courseLesson}/quiz/create', 'ExamQuestionController@store')->name('lesson.quiz.store');
    Route::get('/course-lesson-exam/{cid}/{lid}', 'ExamQuestionController@quwstions_list');
    Route::post('/course-lesson-exam/{cid}/{lid}/evaluate', 'ExamQuestionController@evaluate_quiz');
});
// Q&A portal
Route::middleware(['verified'])->group(function () {
    Route::get('/question-create', 'QuestionController@create')->name('question.create');
    Route::post('/question-create', 'QuestionController@store');
    Route::get('/questions/{question}', 'QuestionController@show')->name('question.show');
    Route::get('/answer-to-question/{id}', 'AnswerController@create')->name('answer.create');
    Route::post('/answer-to-question/{id}', 'AnswerController@store');
});

// Rating
Route::middleware(['verified'])->group(function () {
    Route::post('/courses/{course}/ratings', 'RatingController@store')->name('courses.ratings.store');
    Route::get('/check/rating/{id}', 'RatingController@check_rating')->name('rating.check');
});





// CareerPath

Route::middleware(['verified'])->group(function () {
    Route::get('/careet-path-create', 'CareerPathController@create')->name('careetpath.create');
    Route::post('/careet-path-create', 'CareerPathController@store')->name('careetpath.store');
    Route::post('/careet-path-update/{id}', 'CareerPathController@update')->name('careetpath.upate');
});


// precedures
Route::middleware(['verified'])->group(function () {

    Route::get('/admin-dashboard', 'AdminProfileController@index')->name('admin.dashboard');
    Route::get('/admin-procedure', 'AdminProfileController@suggestionprocedure')->name('admin.procedure');
    Route::get('/course-enroll/{course_id}', 'StudentProfileController@enroll_course')->name('course.enroll');

});


Route::get('/rating-rec', 'RatingController@rec')->name('courses.ratings.rec');


//paper statics function of hybrid recomendation
Route::get('/hybrid-rec', 'RatingController@hybrid_rec');


Route::get('/recomended-courses', 'CourseController@apriori');
Route::get('/top-courses-this-month', 'CourseController@top_course_month');
Route::get('/contributor_dashboard', 'HomeController@contributor_dashboard')->name('contributor_dashboard');
Route::get('/student-dashboard', 'StudentProfileController@index')->name('student.dashboard');
Route::get('/courses', 'CourseController@index')->name('courses.view');

//Student Interest Survey 
Route::get('/create-survey-question', 'InterestSurveyController@create_question')->name('create.surveyquestion');
Route::post('/store-survey-question', 'SurveyQuestionController@store')->name('store.surveyquestion');
Route::get('/interest-survey', 'SurveyQuestionController@index')->name("survey");
Route::post('/survey-question-options', 'SurveyQuestionController@get_options');
Route::post('/survey-question-reply', 'SurveyQuestionController@save_result');




// Route::get('/get-selected-sub-categories/{id}', 'InterestSurveyController@find_sub')->name('find.fetch_sub_category');
Route::get('/get-sub-category', 'InterestSurveyController@fetched_sub_category')->name('fetched_sub_category');

//Cart
Route::middleware(['verified'])->group(function () {

    Route::get('/cart','CartController@index')->name('cart.index');
    Route::get('/cart/courses/{course}/add','CartController@add_to_cart')->name('cart.add');

    Route::get('/cart/remove/course/{id}','CartController@remove_item')->name('cart.remove');
    Route::get('/cart-restore','CartController@restore');
    Route::get('/cart-checkout/','CartController@checkout')->name('cart.checkout');
    Route::get('/cart/{item}/update/{qty}','CartController@update_cart');

    Route::get('/send-mail/{store_id}/{product_id}', 'MailController@send_contact_request')->name('contact.mail');
    Route::post('/checkout','SslCommerzPaymentController@index')->name('ssl.pay');
    Route::post('/checkout/pay_later','SslCommerzPaymentController@paylater')->name('ssl.pay_later');
});

// SSLCOMMERZ Start
Route::get('/example1','SslCommerzPaymentController@exampleEasyCheckout');
Route::get('/example2','SslCommerzPaymentController@exampleHostedCheckout');

Route::post('/pay','SslCommerzPaymentController@index');
Route::post('/pay-via-ajax','SslCommerzPaymentController@payViaAjax');

Route::post('/success','SslCommerzPaymentController@success');
Route::post('/fail','SslCommerzPaymentController@fail');
Route::post('/cancel','SslCommerzPaymentController@cancel');

Route::post('/ipn','SslCommerzPaymentController@ipn');
//SSLCOMMERZ END

