<?php

use Illuminate\Http\Request;

header('Access-Control-Allow-Origin: *');
header('Access-Control-Allow-Methods: *');
header('Access-Control-Allow-Headers: *');

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

//Route::group(['prefix' => 'v1', 'middleware' => ['cors']], function(){
Route::group(['prefix' => 'v1'], function(){

    Route::get('info', function(){
        echo 'Welcome to Wordpay API';
    });
    
    Route::post('login', 'API\v1\UserController@login');
    Route::post('register', 'API\v1\UserController@register');

    Route::group(['middleware' => 'auth:api'], function(){
        Route::get('user', 'API\v1\UserController@details');
        Route::put('user', 'API\v1\UserController@updateUser');

        Route::resource('company', 'API\v1\CompanyController');
        Route::resource('card',    'API\v1\CardController');
        Route::resource('bank',    'API\v1\BankController');
    });
});

/*Route::middleware('auth:api')->get('/user', function (Request $request) {
    return $request->user();
});*/
