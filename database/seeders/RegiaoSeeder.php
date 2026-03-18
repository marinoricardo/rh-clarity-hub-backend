<?php

namespace Database\Seeders;

use Illuminate\Database\Console\Seeds\WithoutModelEvents;
use Illuminate\Database\Seeder;
use Illuminate\Support\Facades\DB;

class RegiaoSeeder extends Seeder
{
    /**
     * Run the database seeds.
     */
    public function run(): void
    {
        DB::table('regiaos')->insert([
            [
                'name' => 'Sul',
                'created_at' => now(),
                'updated_at' => now(),
            ],
            [
                'name' => 'Centro e Norte',
                'created_at' => now(),
                'updated_at' => now(),
            ],
            [
                'name' => 'Centro',
                'created_at' => now(),
                'updated_at' => now(),
            ],
            [
                'name' => 'Norte',
                'created_at' => now(),
                'updated_at' => now(),
            ],
            [
                'name' => 'Direção Central',
                'created_at' => now(),
                'updated_at' => now(),
            ],
        ]);
    }
}
