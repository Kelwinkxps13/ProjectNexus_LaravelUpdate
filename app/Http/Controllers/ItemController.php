<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;

class ItemController extends Controller
{
    function create($nickname, $category)
    {
        // nome da categoria que vai ser adicionada um item
        $page = true;
        // id da categoria (theme)
        $id = true;

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

    function index($nickname, $category)
    {
        // qunatos itens no bd que estao marcados com is_deleted
        $is_deleted = false;
        // total de itens
        $total = false;
        // contents daquele item daquela category
        $db_url = false;

        //id da categoria
        $id = false;

        // id do item
        $id_item = false;

        return view('modulos.veja', [
            'is_deleted' => $is_deleted,
            'total' => $total,
            'db_url' => $db_url,
            'id' => $id,
            'id_item' => $id_item,
            'nickname' => $nickname,
            'category' => $category
        ]);
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
