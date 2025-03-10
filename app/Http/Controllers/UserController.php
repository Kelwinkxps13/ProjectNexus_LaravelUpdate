<?php

namespace App\Http\Controllers;

use App\Models\Category;
use App\Models\Main;
use App\Models\User;
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

    function update (Request $request, $nickname) {
        $main = Main::where('user_id', Auth::id())->first();

        // validação dos dados
        $request->validate([
            'name' => 'required|string|min:1|max:50',
            'subtitle' =>  'nullable|string|max:100',
            'description' => 'required|string|max:255'
        ]);

        $main->name = $request->name ?? $main->name;
        $main->subtitle = $request->subtitle ?? $main->subtitle;
        $main->description = $request->description ?? $main->description;
        $main->save();
        return redirect('/'.$nickname)
        ->with('msg-success', 'Página inicial atualizada com sucesso!');
    }

    function editor ($nickname) {
        // pega o usuario
        $user = User::find(Auth::id());
        // proximo passo, é pegar as categories em si daquele usuario
        $themes_foreach = $user->categorys();

        return view('editor', [
            'themes_foreach' => $themes_foreach,
            'nickname' => $nickname
        ]);
    }
}
