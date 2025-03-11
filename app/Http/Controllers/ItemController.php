<?php

namespace App\Http\Controllers;

use App\Models\Category;
use App\Models\Item;
use Illuminate\Http\Request;

class ItemController extends Controller
{

    function index($nickname, $category, $id_item)
    {
       
        // contents daquele item daquela category
        $item = Item::find($id_item)->first();

        if (!$item) {
            # code...
            return redirect('/'.$nickname.'/'.$category)
            ->with('msg-warning', "Item não encontrado!");
        }

        $db_url = $item->contents();

        //id da categoria
        $id = $item->category_id;

        // id do item
        $id_item = $id_item;

        return view('modulos.veja', [
            'db_url' => $db_url,
            'id' => $id,
            'id_item' => $id_item,
            'nickname' => $nickname,
            'category' => $category
        ]);
    }

    function create($nickname, $category)
    {
        // nome da categoria que vai ser adicionada um item
        $cat = Category::find($category)->first();

        if (!$cat) {
            # code...
            return redirect('/'.$nickname)
            ->with('msg-warning', "categoria não encontrada!");
        }
        $page = $cat->name;

        // id da categoria (theme)
        $id = $cat->id;

        return view('modulos.base.create', [
            'page' => $page,
            'id' => $id,
            'nickname' => $nickname,
            'category' => $category
        ]);
    }

    function store(Request $request, $nickname, $category)
    {

        //  protected $fillable = ['name', 'description', 'image', 'category_id'];]

        $request->validate([
            'name' => 'required|string|max:50',
            'description' => 'required|string|max:255',
            'image' => 'nullable|image|mimes:png,jpg,svg,jpeg,gif'
        ]);

        $item = new Item;
        $item->name = $request->name;
        $item->description = $request->description;


        // validando a imagem

        if ($request->hasFile('image') && $request->file('image')->isValid()) {
            # code...

            $extension = $request->image->extension;
            $data = strtotime('now');

            $path_image = md5($request->image->getClientOriginalName()).'_'.$data.'.'.$extension;

            $request->image->move(public_path('images/'.$nickname.'/categories/'.$request->id.'/items'));

            $item->image = $path_image;

        }

        $item->category_id = $request->id;


        return redirect('/'.$nickname.'/'.$category)
            ->with('msg-success', "Item criado com sucesso!");
    }


    function edit($nickname, $category, $id_item)
    {
        // nome da categoria que vai ser modificada um item
        $cat = Category::find($category)->first();
        if (!$cat) {
            # code...
            return redirect('/'.$nickname)
            ->with('msg-warning', "categoria não encontrada!");
        }
        $page = $cat->name;
        // id da categoria (theme)
        $id = $cat->id;

        // informações sobre aquele item
        $db = Item::find($id_item);

        return view('modulos.base.edit', [
            'page' => $page,
            'id' => $id,
            'db' => $db,
            'nickname' => $nickname,
            'category' => $category
        ]);
    }

    function update(Request $request, $nickname, $category)
    {
        //  protected $fillable = ['name', 'description', 'image', 'category_id'];]

        $request->validate([
            'name' => 'required|string|max:50',
            'description' => 'required|string|max:255',
            'image' => 'nullable|image|mimes:png,jpg,svg,jpeg,gif'
        ]);

        $item = Item::find($request->id_item);
        $item->name = $request->name ?? $item->name;
        $item->description = $request->description ?? $item->description;


        // validando a imagem

        if ($request->hasFile('image') && $request->file('image')->isValid()) {
            # code...

            $extension = $request->image->extension;
            $data = strtotime('now');

            $path_image = md5($request->image->getClientOriginalName()).'_'.$data.'.'.$extension;

            $request->image->move(public_path('images/'.$nickname.'/categories/'.$request->id.'/items'));

            $item->image = $path_image ?? $item->image;

        }


        return redirect('/'.$nickname.'/'.$category)
            ->with('msg-success', "Item editado com sucesso!");
    }
    function destroy(Request $request, $nickname, $category)
    {
        $item = Item::find($request->id_item);

        $item->delete();
        
        return redirect('/'.$nickname.'/'.$category)
            ->with('msg-success', "Item excluído com sucesso!");
    }
    function editor($nickname, $category)
    {
        // titulo do item
        $title = true;

        // verifica a quantidade de contents deletados
        $is_deleted = true;
        // verifica o total de contents
        $total = true;
        // todos os contents daquele item
        $db_url = true;
        // id da categoria (theme)
        $id = true;
        //id do item escolhido
        $id_item = true;

        return view('modulos.vejaeditor', [
            'title' => $title,
            'is_deleted' => $is_deleted,
            'total' => $total,
            'db_url' => $db_url,
            'id' => $id,
            'id_item' => $id_item,
            'nickname' => $nickname,
            'category' => $category
        ]);
    }
}
