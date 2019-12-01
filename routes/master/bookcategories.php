<?php
Route::group(['prefix' => 'book-category', 'middleware' => 'auth:api'], function () { 
    Route::get('list', 'API\BookCategoryController@index');          
    Route::post('add', 'API\BookCategoryController@store')->middleware(['scope:super-admin,admin']);               
    Route::post('update', 'API\BookCategoryController@update')->middleware(['scope:super-admin,admin']);           
    Route::post('delete', 'API\BookCategoryController@destroy')->middleware(['scope:super-admin,admin']);           
    // Route::post('detail', 'API\BookController@show');         
});