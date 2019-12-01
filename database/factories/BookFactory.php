<?php

/** @var \Illuminate\Database\Eloquent\Factory $factory */

use App\Book;
use Faker\Generator as Faker;

$factory->define(Book::class, function (Faker $faker) {
    return [
        'name' => $faker->name,
        'pic' => 'http://lorempixel.com/640/480/',
        'description' => $faker->paragraph
    ];
});
