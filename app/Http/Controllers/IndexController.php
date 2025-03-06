<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;

class IndexController extends Controller
{
    public function index() {
        $db_main = (object) [
            "id"=> 1,
            "title"=> "Ola mundo",
            "subtitle"=> "seja bem vindo a minha pagina",
            "description"=> "aqui vou postar algumas coisas que acho interessante"
          ]; // ainda sem contato com o banco de dados!

        // variavel caso o tanto de temas deletados seja igual o tanto de temas totais
        $final_verification = true; 

        // foreach de todos os temas!
        $themes_foreach = [
            (object)[
                'id' => 1,
                'name' => 'teste',
                'description' => 'teste1',
                'image' => null
            ],
            (object)[
                'id' => 2,
                'name' => 'teste',
                'description' => 'teste2',
                'image' => null
            ]
        ];

        return view('index', [
            'final_verification' => $final_verification,
            'themes_foreach' => $themes_foreach
        ]);
    }
}
