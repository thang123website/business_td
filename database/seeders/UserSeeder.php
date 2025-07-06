<?php

namespace Database\Seeders;

use Illuminate\Database\Seeder;
use Illuminate\Support\Facades\Hash;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Str;

class UserSeeder extends Seeder
{
    /**
     * Run the database seeds.
     */
    public function run(): void
    {
        DB::table('users')->insert([
            'first_name' => 'Ismaila',
            'last_name' => 'Hamadou',
            'username' => 'ismaila.h',
            'email' => 'ismailahamadou5@gmail.com',
            'email_verified_at' => now(),
            'password' => Hash::make('12345678'),
            'remember_token' => Str::random(10),
            'super_user' => 1,
            'manage_supers' => 1,
            'permissions' => NULL,
            'created_at' => now(),
            'updated_at' => now(),
        ]);
    }
}
