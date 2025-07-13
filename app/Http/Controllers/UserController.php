<?php

namespace App\Http\Controllers;

use App\Models\Category;
use App\Models\Main;
use App\Models\User;
use App\Models\Follower;
use Illuminate\Support\Facades\Auth;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Redirect;
use Psy\Output\Theme;

class UserController extends Controller
{
    function index($nickname)
    {
        // pegar os dados da pessoa que tem aquele nickname
        $db_main = Main::where('user_nickname', $nickname)->first();
        $user = null;
        $themes_foreach = null;
        if (!$db_main) {
            $db_main = null;
        } else {
            // foreach de todos os temas desse usuario!
            $user = User::where('nickname', $db_main->user_nickname)->first();
            $themes_foreach = $user->categories()->get();
        }

        $user_creator = User::where('nickname', $nickname)->first();

        // contando os temas
        $count_theme = Category::where('user_id', $user_creator->id)->get();
        if (!$count_theme) {
            $count_theme = 0;
        }

        // contando os seguidores
        $count_followers = Follower::where('id_creator', $user_creator->id)->get();
        if (!$count_followers) {
            $count_followers = 0;
        }

        // contando quem o usuario segue
        $count_following = Follower::where('id_user', $user_creator->id)->get();
        if (!$count_following) {
            $count_following = 0;
        }

        //verificando se o usuário autenticado já segue aquele criador
        $is_following = Follower::where('id_creator', $user_creator->id)->where('id_user', Auth::id())->first();


        return view('main', [
            'db_main' => $db_main,
            'nickname' => $nickname,
            'themes_foreach' => $themes_foreach,
            'count_theme' => $count_theme,
            'count_followers' => $count_followers,
            'count_following' => $count_following,
            'is_following' => $is_following
        ]);
    }

    function create($nickname)
    {

        
        return view('indexcreator', [
            'nickname' => $nickname
        ]);
    }

    function store(Request $request, $nickname)
    {
        $request->validate([
            'name' => 'required|string|min:1|max:50',
            'subtitle' =>  'nullable|string|max:100',
            'description' => 'required|string|max:255'
        ], [
            'name.min' => 'Tamanho minimo deve ser 1 caractere',
            'name.max' => 'Tamanho máximo de 50 caracteres excedido',
            'name.string' => 'O conteúdo deve ser um texto',
            'subtitle.max' => 'Tamanho máximo de 100 caracteres excedido',
            'subtitle.string' => 'O conteúdo deve ser um texto',
            'description.max' => 'Tamanho máximo de 255 caracteres excedido',
            'description.string' => 'O conteúdo deve ser um texto'
        ]);
        Main::create([
            'name' => $request->name,
            'subtitle' => $request->subtitle,
            'description' => $request->description,
            'user_id' => Auth::id(),
            'user_nickname' => Auth::user()->nickname
        ]);
        return Redirect::to(route('user_index', ['nickname' => $nickname]))
            ->with('msg-success', 'Pagina Inicial Criada com Sucesso!');
    }

    function edit($nickname)
    {
        // pega os dados da tela inicial
        $main = Main::where('user_id', Auth::id())->first();

        if (!$main) {
            # code...
            return Redirect::to(route('user_index', ['nickname' => $nickname]))
                ->with('msg-warning', "Página Inicial ainda nao criada!");
        }
        return view('indexeditor', [
            'main' => $main,
            'nickname' => $nickname
        ]);
    }

    function update(Request $request, $nickname)
    {
        $main = Main::where('user_id', Auth::id())->first();
        if (!$main) {
            # code...
            return Redirect::to(route('user_index', ['nickname' => $nickname]))
                ->with('msg-warning', "Página Inicial ainda nao criada!");
        }

        // validação dos dados
        $request->validate([
            'name' => 'required|string|min:1|max:50',
            'subtitle' =>  'nullable|string|max:100',
            'description' => 'required|string|max:255'
        ], [
            'name.min' => 'Tamanho minimo deve ser 1 caractere',
            'name.max' => 'Tamanho máximo de 50 caracteres excedido',
            'name.string' => 'O conteúdo deve ser um texto',
            'subtitle.max' => 'Tamanho máximo de 100 caracteres excedido',
            'subtitle.string' => 'O conteúdo deve ser um texto',
            'description.max' => 'Tamanho máximo de 255 caracteres excedido',
            'description.string' => 'O conteúdo deve ser um texto'
        ]);

        $main->name = $request->name ?? $main->name;
        $main->subtitle = $request->subtitle ?? $main->subtitle;
        $main->description = $request->description ?? $main->description;
        $main->save();
        return Redirect::to(route('user_index', ['nickname' => $nickname]))
            ->with('msg-success', 'Página inicial atualizada com sucesso!');
    }

    function editor($nickname)
    {
        // pega o usuario
        $user = User::find(Auth::id());
        // proximo passo, é pegar as categories em si daquele usuario
        $themes_foreach = $user->categories()->get();




        return view('editor', [
            'themes_foreach' => $themes_foreach,
            'nickname' => $nickname
        ]);
    }

    function follow($nickname){

        $user_creator = User::where('nickname', $nickname)->first();
        $id_creator = $user_creator->id;

        //fazendo o sistema de seguir
        $follower = new Follower();
        $follower->id_user = Auth::id();
        $follower->id_creator = $id_creator;
        $follower->save();

        return Redirect::to(route('user_index', ['nickname' => $nickname]))
        ->with('msg-success', 'agora você está seguindo '.$nickname.'!');

    }
    function unfollow($nickname){

        $user_creator = User::where('nickname', $nickname)->first();
        $id_creator = $user_creator->id;

        //fazendo o sistema de seguir
        $follower = Follower::where('id_user', Auth::id())->where('id_creator', $id_creator)->first();
        $follower->delete();

        return Redirect::to(route('user_index', ['nickname' => $nickname]))
        ->with('msg-success', 'você deixou de seguir '.$nickname.'!');
    }
}
