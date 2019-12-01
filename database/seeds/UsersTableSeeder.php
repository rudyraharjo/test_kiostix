<?php

use Illuminate\Database\Seeder;

class UsersTableSeeder extends Seeder
{
    /**
     * Run the database seeds.
     *
     * @return void
     */
    public function run()
    {
        \App\User::create([
            'name' => 'Rudy Raharjo',
            'email' => 'rraharjo.rudy@gmail.com',
            'password' => bcrypt('secret')
        ])->assignRole('super-admin');

        \App\User::create([
            'name' => 'Anisa Ismiati',
            'email' => 'anisismi@gmail.com',
            'password' => bcrypt('secret')
        ])->assignRole('admin');

    }
}
