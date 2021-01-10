<?php

/** @var \Illuminate\Database\Eloquent\Factory $factory */

use App\User;
use App\StudentProfile;
use Illuminate\Support\Str;
use Faker\Generator as Faker;
use Illuminate\Support\Facades\Hash;

/*
|--------------------------------------------------------------------------
| Model Factories
|--------------------------------------------------------------------------
|
| This directory should contain each of the model factory definitions for
| your application. Factories provide a convenient way to generate new
| model instances for testing / seeding your application's database.
|
*/

$factory->define(User::class, function (Faker $faker) {
    // $num=rand(1,2);
    // $type=$num == 1? "student":"contributor";
    $type = "student";
    return [
        'name' => $faker->name,
        'email' => $faker->unique()->safeEmail,
        'email_verified_at' => now(),
        'password' => Hash::make("secret"), // password
        'type'=>$type,
        'remember_token' => Str::random(10),
    ];
});

$factory->afterCreating(App\User::class, function ($user, $faker) {
    $studentprofile=StudentProfile::create([
        'user_id'=>$user->id,
        'enrolled_courses'=>[],
    ]);
});
