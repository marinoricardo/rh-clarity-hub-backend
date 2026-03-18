<?php

namespace Database\Seeders;

use Illuminate\Database\Console\Seeds\WithoutModelEvents;
use Illuminate\Database\Seeder;
use Illuminate\Support\Facades\DB;

class PelouroSeeder extends Seeder
{
    /**
     * Run the database seeds.
     */
    public function run(): void
    {
        $pelouros = [
            'Pelouro do PCA',
            'Produção e Transporte',
            'Distribuição Comercial e Informatica',
            'Finanças',
            'Recursos Humanos',
            'Desenvolvimento de Negócios',
            'Eletrificação',
        ];

        foreach ($pelouros as $nome) {
            DB::table('pelouros')->updateOrInsert(
                ['name' => $nome],
                [
                    'created_at' => now(),
                    'updated_at' => now(),
                ]
            );
        }
    }
}
