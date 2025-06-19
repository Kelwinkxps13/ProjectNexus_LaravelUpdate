<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Models\Category;
use App\Models\Follower;
use App\Models\Main;
use App\Models\User;
use Illuminate\Support\Facades\Auth;

class IndexController extends Controller
{
    public function index()
    {

        // foreach de todos os temas!

        $themes_foreach = Category::orderBy('created_at', 'desc')->limit(5)->get();

        $users_foreach = Main::orderBy('created_at', 'desc')->limit(10)->get();



        // sistema de feed

        // incializando a variavel following
        $following = 0;
        // variavel de sugestão de conteúdos
        $suggestion = 0;
        // variável dos temas pra serem mostrados caso o usuario siga alguem
        $themes = [];

        $is_following = 0;

        if (Auth::check()) {
            // Variavel para caso o usuário siga pelo menos UM CRIADOR:
            $is_following = Follower::where('id_user', Auth::id())->first();

            if ($is_following) {
                $is_following = 'following';

                $following = Follower::where('id_user', Auth::id())->get();

                
                
                foreach ($following as $key => $value) {
                    $has_theme = Category::where('user_id', $value->id_creator)->get();

                    foreach ($has_theme as $key => $value) {
                        $themes[] = $value;
                    }
                }


                // aqui vai ficar a personalização de sugestão com base em key-words
                // <<aqui>>
            } else {
                $is_following = 'no_following';
                $suggestion = Category::orderBy('created_at', 'desc')->limit(10)->get();
            }
        } else {
            $following = 'no_following';
            $suggestion = Category::orderBy('created_at', 'desc')->limit(10)->get();
        }





        return view('index', [
            'themes_foreach' => $themes_foreach,
            'users_foreach' => $users_foreach,
            'is_following' => $is_following,
            'suggestion' => $suggestion,
            'themes' => $themes
        ]);
    }
}
