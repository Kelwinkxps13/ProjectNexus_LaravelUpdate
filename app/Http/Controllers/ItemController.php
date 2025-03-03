<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;

class ItemController extends Controller
{
    function index () {
        return view('modulos.generic', [

        ]);
    }
    function create () {
        return view('modulos.base.create', [

        ]);
    }

    function store () {
        $id = true;
        return redirect('/theme/show/'.$id);
    }

    function show () {
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
            'id_item' => $id_item
        ]);
    }

    function edit () {
        return view('modulos.vejaeditor', [

        ]);
    }

    function update () {
        $id = true;
        return redirect('/theme/show/'.$id);
    }
    function destroy () {
        $id = true;
        return redirect('/theme/show/'.$id);
    }
}
