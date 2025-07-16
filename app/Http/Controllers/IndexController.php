<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Models\Category;
use App\Models\Firsttime;
use App\Models\Item;
use App\Models\Follower;
use App\Models\Main;
use App\Models\User;
use Illuminate\Support\Facades\Auth;

class IndexController extends Controller
{
    public function index()
    {

        // tutorial do spray
        if (Auth::check()) {

            $first_time = Firsttime::where('user_id', Auth::id())->first();

            if ($first_time) {

                if ($first_time->index === 1) {

                    $first_time->index = 0;

                    $first_time->save();

                    return view('first_time', [
                        'validate' => 'index'
                    ]);
                }
            }
        }


        // foreach de todos os temas!

        $themes_foreach = Category::orderBy('created_at', 'desc')->limit(5)->get();

        $users_foreach = Main::orderBy('created_at', 'desc')->limit(10)->get();



        // sistema de feed

        // incializando a variavel following
        $following = 0;
        // variavel de sugestão de conteúdos
        $suggestion = [];
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
                // vou pegar as palavras dos títulos dos itens e das categorias.
                // em seguida, salvarei as palavras em um array para consultá-las em seguida.
                // jogarei cada palavra numa query, para buscar resultados semelhantes.

                // forma mais simples que achei de personalização com base no que o usuário
                // já gosta


                // aqui, estaremos pegando as palavras dos titulos dos themas
                $explode_cat = [];
                foreach ($themes as $key => $value) {
                    $explode = explode(' ', $value->name);
                    foreach ($explode as $key => $value) {
                        $explode_cat[] = $value;
                    }
                }

                $items = [];
                // pegando todos os items
                foreach ($themes as $key => $value) {
                    $item = Item::where('category_id', $value->id)->get();
                    foreach ($item as $key => $value) {
                        $items[] = $value;
                    }
                }

                // aqui, estaremos pegando as palavras dos titulos dos itens dos themas
                $explode_item = [];
                foreach ($items as $key => $value) {
                    $explode = explode(' ', $value->name);
                    foreach ($explode as $key => $value) {
                        $explode_item[] = $value;
                    }
                }

                // pesquisa por tema
                $query = Category::query();
                foreach ($explode_cat as $key => $value) {
                    $query->orWhere('name', 'LIKE', '%' . $value . '%');
                }

                $prepare = $query->get();
                $id_themes = [];
                foreach ($themes as $key => $value) {
                    $id_themes[] = $value->user_id;
                }

                // não quero os temas de quem o usuário já segue
                foreach ($id_themes as $key => $value) {
                    foreach ($prepare as $key2 => $value2) {
                        if ($value === $value2->user_id) {
                            unset($prepare[$key2]);
                        }
                    }
                }

                // não quero os temas do próprio usuário
                foreach ($prepare as $key2 => $value2) {
                    if (Auth::id() === $value2->user_id) {
                        unset($prepare[$key2]);
                    }
                }

                //aqui estão os temas personalizados de acordo com quem o usuário segue
                $suggestion = $prepare;
            } else {
                $is_following = 'no_following';
                $suggestion = Category::orderBy('created_at', 'desc')->where('user_id', '!=', Auth::id())->limit(10)->get();
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
