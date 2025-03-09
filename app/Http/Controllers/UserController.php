<?php

namespace App\Http\Controllers;

use App\Models\Category;
use App\Models\Main;
use Illuminate\Http\Request;

class UserController extends Controller
{
    function index ($nickname) {
        // pegar os dados da pessoa que tem aquele nickname
        $db_main = Main::where('nickname', $nickname)->first();

        // foreach de todos os temas desse usuario!
        $themes_foreach = Category::where('user_nickname', $nickname)->get();

        return view('main', [
            'db_main' => $db_main,
            'nickname' => $nickname,
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
