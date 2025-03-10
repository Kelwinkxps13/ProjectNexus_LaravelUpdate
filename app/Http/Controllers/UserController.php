<?php

namespace App\Http\Controllers;

use App\Models\Category;
use App\Models\Main;
use Illuminate\Support\Facades\Auth;
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

    function create ($nickname) {
        return view('indexcreator', [
            'nickname' => $nickname
        ]);
    }

    function store (Request $request, $nickname) {
        $request->validate([
            'name' => 'required|string|min:1|max:50',
            'subtitle' =>  'nullable|string|max:100',
            'description' => 'required|string|max:255'
        ]);
        Main::create([
            'name' => $request->name,
            'subtitle' => $request->subtitle,
            'description' => $request->description,
            'user_id' => Auth::id()
        ]);
        return redirect('/'.$nickname)
        ->with('msg-success', 'Pagina Inicial Criada com Sucesso!');
    }

    function edit ($nickname) {
        // pega os dados da tela inicial
        $main = Main::where('user_id', Auth::id())->first();
        return view('indexeditor', [
            'main' => $main,
            'nickname' => $nickname
        ]);
    }

    function update ($nickname) {
        return redirect('/');
    }

    function editor ($nickname) {
        // pega todas as categorys registradas
        $themes_foreach = false;
        return view('editor', [
            'themes_foreach' => $themes_foreach
        ]);
    }
}
