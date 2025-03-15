<?php

namespace App\Http\Controllers;

use App\Models\Category;
use Illuminate\Support\Facades\Auth;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Redirect;

class ThemeController extends Controller
{
    function index ($nickname, $category_name_slug) {
        // filtra pra encontrar uma category em especifico
        $db_theme = Category::where('name_slug', $category_name_slug)->where('user_nickname', $nickname)->first();
        // condicional caso o tanto de temas deletados seja igual o tanto de temas totais
        
        
        // pegando os dados dos itens do tema escolhido
        $db_url = $db_theme->items()->get();

        return view('generic', [
            'db_theme' => $db_theme,
            'db_url' => $db_url,
            'nickname' => $nickname,
            'category_name_slug' => $category_name_slug
        ]);
    }

    function create ($nickname) {
        return view('modulos.generic.create', [
            'nickname' => $nickname
        ]);
    }

    function store (Request $request, $nickname) {

        // name, description, image

        $request->validate([
            'name' => 'required|string|max:20',
            'description' => 'required|string|max:255',
            'image' => 'nullable|image|mimes:jpeg,png,jpg,gif,svg'
        ]);


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


    function edit ($nickname, $category_name_slug) {
        // dados da categoria (theme)
        $db = Category::where('name_slug', $category_name_slug)->first();
        return view('modulos.generic.edit', [
            'db' => $db,
            'nickname' => $nickname,
            'category_name_slug' => $category_name_slug,
            'id' => $db->id
        ]);
    }

    function update (Request $request, $nickname) {

        // name, description, image

        $request
        ->validate([
            'name' => 'required|string|max:20',
            'description' => 'required|string|max:255',
            'image' => 'nullable|image|mimes:jpeg,png,jpg,gif,svg'
        ]);

        $cat = Category::find($request->id);

        $cat->name = $request->name ?? $cat->name;
        // criando o slug
        $cat->name_slug = str($request->name)->slug() ?? $cat->name_slug;
        $cat->description = $request->description ?? $cat->description;


        if($request->remove_image){
            $cat->image = null;
        }elseif ($request->hasFile('image') && $request->file('image')->isValid()) {
            $image = $request->file('image');
            $extension = $image->getClientOriginalExtension();
            $data = strtotime('now');
            $path_image = md5($image->getClientOriginalName()) . '_' . $data . '.' . $extension;
            $image->move(public_path('images/' . $nickname . '/categories/banners'), $path_image);
            $cat->image = $path_image ?? $cat->image;
        }

        $cat->save();


        return Redirect::to(route('index'))
        ->with('msg-success', 'Categoria Atualizada com Sucesso!');
    }
    function destroy (Request $request, $nickname) {

        $cat = Category::find($request->id);

        $cat->delete();

        return Redirect::to(route('user_editor', ['nickname' => $nickname]))
        ->with('msg-success', "Categoria excluída com sucesso!");
    }
}
