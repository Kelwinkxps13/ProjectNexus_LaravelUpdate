<?php

namespace App\Http\Controllers;

use App\Models\Content;
use App\Models\Item;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Redirect;

class ContentController extends Controller
{
    function create ($nickname, $category, $id_item) {
        // id da category
        $item = Item::find($id_item);
        if (!$item) {
            # code...
            return Redirect::to(route('category_index', ['nickname' => $nickname, 'category' => $category]))
            ->with('msg-warning', "Item não encontrado!");
        }
        $id = $item->category_id;

        // id do item que vai ser adicionado um bloco
        $id_item = $item->id;
        return view('modulos.block.create', [
            'id' => $id,
            'id_item' => $id_item,
            'nickname' => $nickname,
            'category' => $category
        ]);
    }

    function store (Request $request, $nickname, $category) {
        
        // protected $fillable = ['name', 'description', 'image', 'item_id'];

        $request->validate([
            'name' => 'required|string|max:50',
            'description' => 'required',
            'image' => 'nullable|image|mimes:png,jpg,jpeg,svg,gif'
        ]);
       
        $content = new Content();
        $content->name = $request->name;
        $content->description = $request->description;

        // validação de imagem

        if ($request->hasFile('image') && $request->file('image')->isValid()) {
            $image = $request->file('image');
            $extension = $image->getClientOriginalExtension();
            $data = strtotime('now');
            $path_image = md5($image->getClientOriginalName()) . '_' . $data . '.' . $extension;
        
            $image->move(public_path('images/' . $nickname . '/categories/' . $request->id . '/item/' . $request->id_item), $path_image);
        
            $content->image = $path_image;
        }
        

        $content->item_id = $request->id_item;
        $content->save();

        return Redirect::to(route('item_index', ['nickname' => $nickname, 'category' => $category, 'id_item' =>  $request->id_item]))
            ->with('msg-success', "Conteúdo criado com sucesso!");
    }

    function edit (Request $request, $nickname, $category) {

        $content = Content::find($request->idblock);
        if (!$content) {
            # code...
            return Redirect::to(route('item_index', ['nickname' => $nickname, 'category' => $category, 'id_item' => $request->id_item]))
            ->with('msg-warning', "Conteúdo não encontrado!");
        }

        $item = Item::find($request->id_item);
        if (!$item) {
            # code...
            return Redirect::to(route('item_index', ['nickname' => $nickname, 'category' => $category, 'id_item' => $request->id_item]))
            ->with('msg-warning', "Item não encontrado!");
        }

        // id da category
        $id = $item->category_id;
        // id do item que vai ser adicionado um bloco
        $id_item = $content->item_id;
        // dados do bloco (content) que irá ser modificado
        $db = $content;
        return view('modulos.block.edit', [
            'id' => $id,
            'id_item' => $id_item,
            'db' => $db,
            'nickname' => $nickname,
            'category' => $category
        ]);
    }

    function update (Request $request, $nickname, $category) {
        // protected $fillable = ['name', 'description', 'image', 'item_id'];

        $request->validate([
            'name' => 'required|string|max:50',
            'description' => 'required',
            'image' => 'nullable|image|mimes:png,jpg,jpeg,svg,gif'
        ]);
       
        $content = Content::find($request->idblock);
        $content->name = $request->name ?? $content->name;
        $content->description = $request->description ?? $content->description;

        // validação de imagem

        if($request->remove_image){
            $content->image = null;
        }elseif ($request->hasFile('image') && $request->file('image')->isValid()) {
            $image = $request->file('image');
            $extension = $image->getClientOriginalExtension();
            $data = strtotime('now');
            $path_image = md5($image->getClientOriginalName()) . '_' . $data . '.' . $extension;
        
            $image->move(public_path('images/' . $nickname . '/categories/' . $request->id . '/item/' . $request->id_item), $path_image);
        
            $content->image = $path_image ?? $content->image;
        }


        $content->save();
        

        return Redirect::to(route('item_index', ['nickname' => $nickname, 'category' => $category, 'id_item' => $request->id_item]))
            ->with('msg-success', "Conteúdo editado com sucesso!");
    }
    function destroy (Request $request, $nickname, $category) {

        $content = Content::find($request->idblock);
        $content->delete();

        return Redirect::to(route('item_editor', ['nickname' => $nickname, 'category' => $category, 'id_item' => $request->id_item]))
            ->with('msg-success', "Conteúdo excluído com sucesso!");
    }
}
