<?php

namespace App\Http\Controllers;

use App\Models\Area;
use App\Models\Departamento;
use App\Models\Pelouro;
use App\Models\Regiao;
use App\Models\UnidadeOrganica;
use Illuminate\Http\Request;

class CommonController extends Controller
{
    public function index()
    {
        $data = [
            'areas' => Area::all(),
            'regiaos' => Regiao::all(),
            'pelouros' => Pelouro::all(),
            'unidade_organicas' => UnidadeOrganica::all(),
            'departamentos' => Departamento::all(),
        ];
        return response()->json($data);
    }
}
