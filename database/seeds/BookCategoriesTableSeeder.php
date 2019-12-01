<?php

use Illuminate\Database\Seeder;

class BookCategoriesTableSeeder extends Seeder
{
    /**
     * Run the database seeds.
     *
     * @return void
     */
    public function run()
    {
        \App\BookCategory::create([
            'name' => 'Sejarah',
        ]);

        \App\BookCategory::create([
            'name' => 'Politik',
        ]);
    }
}
