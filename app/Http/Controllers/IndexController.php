<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;

class IndexController extends Controller
{
    function index () {
        $db_main = (object) [
            "id"=> 1,
            "title"=> "Ola mundo",
            "subtitle"=> "seja bem vindo a minha pagina",
            "description"=> "aqui vou postar algumas coisas que acho interessante"
          ]; // ainda sem contato com o banco de dados!

        // variavel caso o tanto de temas deletados seja igual o tanto de temas totais
        $final_verification = true; 

        // foreach de todos os temas!
        $themes_foreach = false;


        return view('index', [
            'db_main' => $db_main,
            'final_verification' => $final_verification,
            'themes_foreach' => $themes_foreach
        ]);
    }

    function create () {
        return view('indexcreator', [

        ]);
    }

    function store () {
        return redirect('/');
    }

    function edit () {
        // pega os dados da tela inicial
        $main = false;
        return view('indexeditor', [
            'main' => $main
        ]);
    }

    function update () {
        return redirect('/');
    }

    function editor () {
        // pega todas as categorys registradas
        $themes_foreach = false;
        return view('editor', [
            'themes_foreach' => $themes_foreach
        ]);
    }
}
