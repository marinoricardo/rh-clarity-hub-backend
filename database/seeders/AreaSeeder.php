<?php

namespace Database\Seeders;

use Illuminate\Database\Console\Seeds\WithoutModelEvents;
use Illuminate\Database\Seeder;
use Illuminate\Support\Facades\DB;

class AreaSeeder extends Seeder
{
    /**
     * Run the database seeds.
     */
    public function run(): void
    {
        DB::table('areas')->insert([
            [
                'name' => 'CA',
                'created_at' => now(),
                'updated_at' => now(),
            ],
            [
                'name' => 'Área de Suporte',
                'created_at' => now(),
                'updated_at' => now(),
            ],
            [
                'name' => 'Área de Negócio',
                'created_at' => now(),
                'updated_at' => now(),
            ],
        ]);
    }
}
