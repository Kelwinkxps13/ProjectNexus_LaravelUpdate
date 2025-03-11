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

    function store()
    {
        $id = true;
        return redirect('/theme/show/' . $id);
    }


    function edit($nickname, $category)
    {
        // nome da categoria que vai ser adicionada um item
        $page = true;
        // id da categoria (theme)
        $id = true;
        // informações sobre aquele item
        $db = true;
        return view('modulos.base.edit', [
            'page' => $page,
            'id' => $id,
            'db' => $db,
            'nickname' => $nickname,
            'category' => $category
        ]);
    }

    function update($nickname, $category)
    {
        $id = true;
        return redirect('/theme/show/' . $id);
    }
    function destroy($nickname, $category)
    {
        $id = true;
        return redirect('/theme/show/' . $id);
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
