<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;

class ThemeController extends Controller
{
    function create () {
        return view('modulos.generic.create', [

        ]);
    }

    function store () {
        return redirect('/');
    }

    function show () {
        // filtra pra encontrar uma category em especifico
        $db_theme = true;
        // condicional caso o tanto de temas deletados seja igual o tanto de temas totais
        $final_verification = true;
        // pegando os dados dos itens do tema escolhido
        $db_url = true;
        return view('generic', [
            'db_theme' => $db_theme,
            'final_verification' => $final_verification,
            'db_url' => $db_url
        ]);
    }

    function edit () {
        // dados da categoria (theme)
        $db = true;
        return view('modulos.generic.edit', [
            'db' => $db
        ]);
    }

    function update () {
        return redirect('/');
    }
    function destroy () {
        return redirect('/editor');
    }
    function editor () {
        return view('editor', [

        ]);
    }
}
