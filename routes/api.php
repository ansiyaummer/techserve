<?php

use Illuminate\Http\Request;

/*
|--------------------------------------------------------------------------
| API Routes
|--------------------------------------------------------------------------
|
| Here is where you can register API routes for your application. These
| routes are loaded by the RouteServiceProvider within a group which
| is assigned the "api" middleware group. Enjoy building your API!
|
*/

Route::middleware('auth:api')->get('/user', function (Request $request) {
    return $request->user();
});

// user API
Route::get('/getusers', 'Api\UserController@index')->name('home.getusers');
Route::get('user/{id}', 'Api\UserController@show');
Route::post('user', 'UserController@store');
Route::put('user/{id}', 'UserController@update');
Route::delete('user/{id}', 'UserController@destroy');

Route::delete('/deleteskill/{id}', 'SkillController@deleteuser')->name('home.deleteuser');

Route::get('skill/search','SkillController@search');


Route::get('student', 'StudentController@index');


// vendor
Route::apiResource('/vendor', 'VendorController');


//Expense
Route::apiResource('/expense', 'ExpenseController');


//Leave
Route::apiResource('/leave', 'LeaveController');

//Attendence
Route::apiResource('/attendance', 'AttendanceController');


Route::post('checkin', 'AttendanceController@checkin');

Route::post('checkout/', 'AttendanceController@checkout');
