<?php
use Illuminate\Http\Request;

// MASTER ROUTES
include __DIR__.'/auth/auth.php';
include __DIR__.'/master/book.php';
include __DIR__.'/master/author.php';
include __DIR__.'/master/bookcategories.php';
// END MASTER ROUTES


// TEST SCOPE
Route::get('/super-admin', function (Request $request) {
    return response()->json(["data"=>"only admin"]);
})->middleware(['auth:api', 'scope:super-admin']);

Route::get('/waiter', function (Request $request) {
    return response()->json(["data"=>"waiter"]);
})->middleware(['auth:api', 'scope:super-admin,waiter']);

// END TEST SCOPE