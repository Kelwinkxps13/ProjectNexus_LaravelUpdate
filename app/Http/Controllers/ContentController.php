<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;

class ContentController extends Controller
{
    function create () {
        // id da category
        $id = true;
        // id do item que vai ser adicionado um bloco
        $id_item = true;
        return view('modulos.block.create', [
            'id' => $id,
            'id_item' => $id_item
        ]);
    }

    function store () {
        $id = true;
        $id_item = true;
        return redirect('/theme/'.$id.'/show/'.$id_item);
    }

    function edit () {
        // id da category
        $id = true;
        // id do item que vai ser adicionado um bloco
        $id_item = true;
        // dados do bloco (content) que irá ser modificado
        $db = true;
        return view('modulos.block.edit', [
            'id' => $id,
            'id_item' => $id_item,
            'db' => $db
        ]);
    }

    function update () {
        $id = true;
        $id_item = true;
        return redirect('/theme/'.$id.'/show/'.$id_item);
    }
    function destroy () {
        $id = true;
        $id_item = true;
        return redirect('/theme/'.$id.'/show/'.$id_item);
    }
}
