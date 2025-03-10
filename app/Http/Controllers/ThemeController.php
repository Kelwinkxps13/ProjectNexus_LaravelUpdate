<?php

namespace App\Http\Controllers;

use App\Models\Category;
use App\Models\Item;
use App\Models\User;
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

    function store (Request $request, $nickname) {

        // name, description, image

        $request
        ->validate([
            'name' => 'required|string|max:20',
            'description' => 'required|string|max:255',
            'image' => 'required|image|mimes:jpeg,png,jpg,gif,svg'
        ]);


        // cadastrando a categoy
        $cat = new User();
        $cat->name = $request->name;
        $cat->description = $request->description;

        // validando a imagem
        if ($request->hasFile('image') && $request->file('image')->isValid()) {
            //vamos fazer a imagem ser unica

            // peguemos a extensao do arquivo
            $extension = $request->image;
            // peguemos a data atual
            $data = strtotime('now');
            $path_image = md5($request->image->getClienteOriginalName()).'_'.$data.'.'.$extension;

            $request->image->move(public_path('/images/'.$nickname.'categories/banners'), $path_image);

            $cat->image = $path_image;

        }

        $cat->save();

        return redirect('/'.$nickname)
        ->with('msg-success', "Categoria criada com sucesso!");
    }


    function edit ($nickname, $category) {
        // dados da categoria (theme)
        $db = Category::find($category)->first();
        return view('modulos.generic.edit', [
            'db' => $db,
            'nickname' => $nickname,
            'category' => $category
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
