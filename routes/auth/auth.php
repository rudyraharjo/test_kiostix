<?php
Route::group(['prefix' => 'auth'], function () {
    Route::post('signin', 'API\AuthController@signin');
    Route::post('refreshtoken', 'API\AuthController@token_refresh');
    Route::group(['middleware' => 'auth:api'], function() {
        Route::get('user', 'API\AuthController@Me')->middleware(['scope:super-admin,admin,cashier,waiter,chef']);          
        Route::post('logout', 'API\AuthController@logout');
    });
});