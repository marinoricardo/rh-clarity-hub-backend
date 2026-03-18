<?php

namespace Database\Seeders;

use Illuminate\Database\Console\Seeds\WithoutModelEvents;
use Illuminate\Database\Seeder;
use Illuminate\Support\Facades\DB;

class UnidadeOrganicaSeeder extends Seeder
{
    /**
     * Run the database seeds.
     */
    public function run(): void
    {
        $unidades = [
            'GCA-Gab. do Conselho de Administração',
            'GCRI-Gab. Comunicao Relações Institucion',
            'DIT-Direcção de Transporte',
            'DRCM-Direcção Regional Cidade de Maputo',
            'GEDE-Gab. Estrategia Desemp. Empresarial',
            'DSG-Direcção de Serviços Gerais',
            'DACA-Academia da EDM',
            'DHSS-Higiene, Segurança e Saúde no Trab.',
            'DDN-Direcção de Desenvolvimento Negocios',
            'GEPC-Gab. Etica e Provedoria do Cliente',
            'DPSE-Planeamento Sistemas e Engenharia',
            'DID-Direcção de Distribuição',
            'DFC-Direcção de Finanças Corporativas',
            'GAJ-Gabinete Juridico',
            'DRS-Direcção Regional Sul',
            'DRN-Direcção Regional Norte',
            'DRC-Direcção Regional Centro',
            'DEP-Direcção Electrificação e Projectos',
            'DOS-Direcção de Operação de Sistemas',
            'DIP-Direcção de Produção',
            'GAR-Gab. Auditoria e Risco',
            'DRPM-Direcção Regional Província Maputo',
            'DGRH-Direcção Gestão de Recursos Humanos',
            'DER-Direcção de Energias Renováveies',
            'Pelouro de Recursos Humanos',
            'DOM-Direcção de Operação de Mercado',
            'DPRCP-Protecção Receitas Controle Perdas',
            'DTI-Direcção Tecnologias de Informação',
            'GIA-Gab. Inspenção Actividades',
            'DIC-Direcção Comercial',
            'DIA-Direcção de Aquisições',
            'Presidente do Conselho de Administração',
            'Pelouro de Distr. Comercial e Informatica',
        ];

        foreach ($unidades as $nome) {
            DB::table('unidade_organicas')->updateOrInsert(
                ['name' => $nome],
                [
                    'created_at' => now(),
                    'updated_at' => now(),
                ]
            );
        }
    }
}
