<?php
Route::group(['prefix' => 'book', 'middleware' => 'auth:api'], function () { 
    Route::get('list', 'API\BookController@index');          
    Route::get('detail/{id}', 'API\BookController@show');    
    Route::post('searchByauthor', 'API\BookController@searchByAuthor');    
    Route::post('getbytitlebook', 'API\BookController@getByTitleBook');    
    Route::post('getbyauthorbook', 'API\BookController@getbyauthorbook');    
    Route::post('getbycategoryname', 'API\BookController@getbycategoryname');    
    
    Route::post('add', 'API\BookController@store')->middleware(['scope:super-admin,admin']);           
    Route::post('update', 'API\BookController@update')->middleware(['scope:super-admin,admin']);           
    Route::post('delete', 'API\BookController@destroy')->middleware(['scope:super-admin,admin']);           
});