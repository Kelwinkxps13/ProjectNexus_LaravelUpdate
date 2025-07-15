<?php

namespace App\Http\Controllers;

use App\Models\Category;
use App\Models\Item;
use Illuminate\Support\Facades\Auth;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Redirect;
use Illuminate\Support\Facades\Session;
use Illuminate\Support\Facades\Crypt;
use Illuminate\Support\Facades\Hash;

class ThemeController extends Controller
{
    function index(Request $request, $nickname, $category_name_slug)
    {
        // filtra pra encontrar uma category em especifico
        $db_theme = Category::where('name_slug', $category_name_slug)->where('user_nickname', $nickname)->first();
        // condicional caso o tanto de temas deletados seja igual o tanto de temas totais

        if (!$db_theme) {
            abort(404);
        }

        // pegando os dados dos itens do tema escolhido
        $db_url = $db_theme->items()->get();

        if ($db_url->isEmpty() && !$this->isValidCsrfToken($request->_token)) {
            abort(404);
        }

        // devemos criar a variavel is_liked pra saber se o elemento curtiu ou não aquele item
        // porem isso deve ser feito com cada item...

        if (Auth::check()) {
            foreach ($db_url as $key => $value) {
                // passo inicial: definir como 0 o like_type
                $db_url[$key]->like_type = 0;

                // se a pessoa já curtiu esse item
                $verify_like = in_array(Auth::id(), $db_url[$key]->likes);

                //caso tenha curtido, o sistema adicionará uma variável no item dizendo que a pessoa já curtiu
                if ($verify_like) {
                    $db_url[$key]->like_type = 1;
                }

                // se a pessoa já discurtiu esse item
                $verify_dislike = in_array(Auth::id(), $db_url[$key]->dislikes);

                //caso tenha curtido, o sistema adicionará uma variável no item dizendo que a pessoa já curtiu
                if ($verify_dislike) {
                    $db_url[$key]->like_type = 2;
                }

                // dd($verify);

            }
        }


        return view('generic', [
            'db_theme' => $db_theme,
            'db_url' => $db_url,
            'nickname' => $nickname,
            'category_name_slug' => $category_name_slug
        ]);
    }

    private function isValidCsrfToken($token)
    {
        return is_string($token) && hash_equals(csrf_token(), $token);
    }

    function create($nickname)
    {
        return view('modulos.generic.create', [
            'nickname' => $nickname
        ]);
    }

    function store(Request $request, $nickname)
    {

        // name, description, image

        $request->validate([
            'name' => 'required|string|max:20',
            'description' => 'required|string|max:255',
            'image' => 'nullable|image|mimes:jpeg,png,jpg,gif,svg|max:2048'
        ], [
            'name.max' => 'Tamanho máximo de 20 caracteres excedido',
            'name.string' => 'O conteúdo deve ser um texto',
            'description.max' => 'Tamanho máximo de 255 caracteres excedido',
            'description.string' => 'O conteúdo deve ser um texto',
            'image.required' => 'Você precisa enviar uma imagem',
            'image.image' => 'O conteúdo deve ser uma imagem',
            'image.mimes' => 'São aceitos somente os formatos jpeg, jpg, png, gif e svg',
            'image.max' => 'O tamanho máximo permitido é 2MB',
        ]);

        // verificando se já existe uma category com esse slug
        $verify = Category::where('name_slug', str($request->name)->slug())->where('user_nickname', $nickname)->first();;
        if ($verify) {
            return Redirect::to(route('category_create', ['nickname' => $nickname]))
                ->with('msg-warning', 'Já existe uma categoria com esse nome!');
        }

        // cadastrando a categoy
        $cat = new Category();

        $cat->name = $request->name;
        // criando o slug
        $cat->name_slug = str($request->name)->slug();

        $cat->description = $request->description;

        // validando a imagem
        if ($request->hasFile('image') && $request->file('image')->isValid()) {
            $image = $request->file('image');
            $extension = $image->getClientOriginalExtension();
            $data = strtotime('now');
            $path_image = md5($image->getClientOriginalName()) . '_' . $data . '.' . $extension;
            $image->move(public_path('images/' . $nickname . '/categories/banners'), $path_image);
            $cat->image = $path_image;
        }


        $cat->user_id = Auth::id();
        $cat->user_nickname = Auth::user()->nickname;
        $cat->save();

        return Redirect::to(route('user_index', ['nickname' => $nickname]))
            ->with('msg-success', "Categoria criada com sucesso!");
    }


    function edit($nickname, $category_name_slug)
    {
        // dados da categoria (theme)
        $db = Category::where('name_slug', $category_name_slug)->where('user_nickname', $nickname)->first();
        return view('modulos.generic.edit', [
            'db' => $db,
            'nickname' => $nickname,
            'category_name_slug' => $category_name_slug,
            'id' => $db->id
        ]);
    }

    function update(Request $request, $nickname)
    {

        // name, description, image

        $request->validate([
            'name' => 'required|string|max:20',
            'description' => 'required|string|max:255',
            'image' => 'nullable|image|mimes:jpeg,png,jpg,gif,svg|max:2048'
        ], [
            'name.max' => 'Tamanho máximo de 20 caracteres excedido',
            'name.string' => 'O conteúdo deve ser um texto',
            'description.max' => 'Tamanho máximo de 255 caracteres excedido',
            'description.string' => 'O conteúdo deve ser um texto',
            'image.required' => 'Você precisa enviar uma imagem',
            'image.image' => 'O conteúdo deve ser uma imagem',
            'image.mimes' => 'São aceitos somente os formatos jpeg, jpg, png, gif e svg',
            'image.max' => 'O tamanho máximo permitido é 2MB',
        ]);


        // buscar os dados do item no banco de dados

        $cat = Category::find($request->id);

        if ($cat->name != $request->name) {
            // verificando se já existe uma category com esse slug
            $verify = Category::where('name_slug', str($request->name)->slug())->where('user_nickname', $nickname)->first();
            if ($verify) {
                return Redirect::to(route('user_editor', ['nickname' => $nickname]))
                    ->with('msg-warning', 'Já existe uma categoria com esse nome!');
            }
        }


        $cat->name = $request->name ?? $cat->name;
        // criando o slug
        $cat->name_slug = str($request->name)->slug() ?? $cat->name_slug;
        $cat->description = $request->description ?? $cat->description;


        if ($request->remove_image) {
            $cat->image = null;
        } elseif ($request->hasFile('image') && $request->file('image')->isValid()) {
            $image = $request->file('image');
            $extension = $image->getClientOriginalExtension();
            $data = strtotime('now');
            $path_image = md5($image->getClientOriginalName()) . '_' . $data . '.' . $extension;
            $image->move(public_path('images/' . $nickname . '/categories/banners'), $path_image);
            $cat->image = $path_image ?? $cat->image;
        }

        $cat->save();


        return Redirect::to(route('user_editor', ['nickname' => $nickname]))
            ->with('msg-success', 'Categoria Atualizada com Sucesso!');
    }
    function destroy(Request $request, $nickname)
    {

        $cat = Category::find($request->id);

        $cat->delete();

        return Redirect::to(route('user_editor', ['nickname' => $nickname]))
            ->with('msg-success', "Categoria excluída com sucesso!");
    }
}
