<?php

namespace App\Http\Controllers;

use App\Models\Content;
use App\Models\Item;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Redirect;

class ContentController extends Controller
{
    function create ($nickname, $category_name_slug, $item_name_slug) {
        // id da category
        $item = Item::where('name_slug', $item_name_slug)->first();
        if (!$item) {
            # code...
            return Redirect::to(route('category_index', ['nickname' => $nickname, 'category_name_slug' => $category_name_slug]))
            ->with('msg-warning', "Item não encontrado!");
        }
        $id = $item->category_id;

        // id do item que vai ser adicionado um bloco
        $item_name_slug = $item->name_slug;
        return view('modulos.block.create', [
            'id' => $id,
            'item_name_slug' => $item_name_slug,
            'nickname' => $nickname,
            'category_name_slug' => $category_name_slug
        ]);
    }

    function store (Request $request, $nickname, $category_name_slug) {
        
        // protected $fillable = ['name', 'description', 'image', 'item_id'];

        $request->validate([
            'name' => 'required|string|max:50',
            'description' => 'required',
            'image' => 'nullable|image|mimes:png,jpg,jpeg,svg,gif'
        ]);
       
        $content = new Content();
        $content->name = $request->name;
        $content->description = $request->description;


        $item = Item::where('name_slug', $request->item_name_slug)->first();

        // validação de imagem

        if ($request->hasFile('image') && $request->file('image')->isValid()) {
            $image = $request->file('image');
            $extension = $image->getClientOriginalExtension();
            $data = strtotime('now');
            $path_image = md5($image->getClientOriginalName()) . '_' . $data . '.' . $extension;
        
            $image->move(public_path('images/' . $nickname . '/categories/' . $request->id . '/item/' . $item->id), $path_image);
        
            $content->image = $path_image;
        }
        

       
        $content->item_id = $item->id;
        $content->save();

        return Redirect::to(route('item_index', ['nickname' => $nickname, 'category_name_slug' => $category_name_slug, 'item_name_slug' =>  $request->item_name_slug]))
            ->with('msg-success', "Conteúdo criado com sucesso!");
    }

    function edit (Request $request, $nickname, $category_name_slug) {

        $content = Content::find($request->idblock);
        if (!$content) {
            # code...
            return Redirect::to(route('item_index', ['nickname' => $nickname, 'category_name_slug' => $category_name_slug, 'item_name_slug' => $request->item_name_slug]))
            ->with('msg-warning', "Conteúdo não encontrado!");
        }

        $item = Item::where('name_slug', $request->item_name_slug)->first();
        if (!$item) {
            # code...
            return Redirect::to(route('item_index', ['nickname' => $nickname, 'category_name_slug' => $category_name_slug, 'item_name_slug' => $request->item_name_slug]))
            ->with('msg-warning', "Item não encontrado!");
        }

        // id da category
        $id = $item->category_id;

        // dados do bloco (content) que irá ser modificado
        $db = $content;
        
        return view('modulos.block.edit', [
            'id' => $id,
            'item_name_slug' => $request->item_name_slug,
            'db' => $db,
            'nickname' => $nickname,
            'category_name_slug' => $category_name_slug
        ]);
    }

    function update (Request $request, $nickname, $category_name_slug) {
        // protected $fillable = ['name', 'description', 'image', 'item_id'];
        
        $request->validate([
            'name' => 'required|string|max:50',
            'description' => 'required',
            'image' => 'nullable|image|mimes:png,jpg,jpeg,svg,gif'
        ]);
       
        $content = Content::find($request->idblock);
        $content->name = $request->name ?? $content->name;
        $content->description = $request->description ?? $content->description;


        $item = Item::where('name_slug', $request->item_name_slug)->first();

        // validação de imagem

        if($request->remove_image){
            $content->image = null;
        }elseif ($request->hasFile('image') && $request->file('image')->isValid()) {
            $image = $request->file('image');
            $extension = $image->getClientOriginalExtension();
            $data = strtotime('now');
            $path_image = md5($image->getClientOriginalName()) . '_' . $data . '.' . $extension;
        
            $image->move(public_path('images/' . $nickname . '/categories/' . $request->id . '/item/' . $item->id), $path_image);
        
            $content->image = $path_image ?? $content->image;
        }


        $content->save();

        return Redirect::to(route('item_index', ['nickname' => $nickname, 'category_name_slug' => $category_name_slug, 'item_name_slug' => $request->item_name_slug]))
            ->with('msg-success', "Conteúdo editado com sucesso!");
    }
    function destroy (Request $request, $nickname, $category_name_slug) {

        $content = Content::find($request->idblock);
        $content->delete();

        return Redirect::to(route('item_editor', ['nickname' => $nickname, 'category_name_slug' => $category_name_slug, 'item_name_slug' => $request->item_name_slug]))
            ->with('msg-success', "Conteúdo excluído com sucesso!");
    }
}
