<?php

namespace Database\Seeders;

use Botble\Base\Supports\BaseSeeder;
use Database\Seeders\UserSeeder;
use Themes\Main\DatabaseSeeder as ThemeMainSeeder;

class DatabaseSeeder extends BaseSeeder
{
    public function run(): void
    {
        
        $this->call(ThemeMainSeeder::class);

        // Appel du seeder des utilisateurs
        $this->call([
            UserSeeder::class,
        ]);
    }
}
