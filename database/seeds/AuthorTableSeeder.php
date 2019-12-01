<?php

use Illuminate\Database\Seeder;

class AuthorTableSeeder extends Seeder
{
    /**
     * Run the database seeds.
     *
     * @return void
     */
    public function run()
    {
        \App\Author::create([
            'name' => 'Bambang Opsar',
            'Bio' => 'Bio'
        ]);

        \App\Author::create([
            'name' => 'Didit Darmadi',
            'Bio' => 'Bio'
        ]);
    }
}
