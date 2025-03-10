<?php

namespace App\Http\Controllers;

use App\Models\Category;
use App\Models\Item;
use Illuminate\Http\Request;

class ThemeController extends Controller
{
    function index ($nickname, $category) {
        // filtra pra encontrar uma category em especifico
        $db_theme = Category::where('id', $category)->where('user_nickname', $nickname)->first();
        // condicional caso o tanto de temas deletados seja igual o tanto de temas totais
        if (!$db_theme) {
            $final_verification = true;
        }
        
        // pegando os dados dos itens do tema escolhido
        $db_url = $db_theme->items();

        return view('generic', [
            'db_theme' => $db_theme,
            'final_verification' => $final_verification,
            'db_url' => $db_url,
            'nickname' => $nickname,
            'category' => $category
        ]);
    }

    function create ($nickname) {
        return view('modulos.generic.create', [
            'nickname' => $nickname
        ]);
    }

    function store () {
        return redirect('/');
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
