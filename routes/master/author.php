<?php
Route::group(['prefix' => 'author', 'middleware' => 'auth:api'], function () { 
    Route::get('list', 'API\AuthorController@index');  
    Route::post('add', 'API\AuthorController@store')->middleware(['scope:super-admin,admin']);           
    Route::post('update', 'API\AuthorController@update')->middleware(['scope:super-admin,admin']); 
    Route::post('delete', 'API\AuthorController@destroy')->middleware(['scope:super-admin,admin']);                            
});