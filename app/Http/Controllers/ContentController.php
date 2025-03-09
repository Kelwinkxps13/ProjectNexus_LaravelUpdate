<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;

class ContentController extends Controller
{
    function create ($nickname, $category) {
        // id da category
        $id = true;
        // id do item que vai ser adicionado um bloco
        $id_item = true;
        return view('modulos.block.create', [
            'id' => $id,
            'id_item' => $id_item,
            'nickname' => $nickname,
            'category' => $category
        ]);
    }

    function store ($nickname, $category) {
        $id = true;
        $id_item = true;
        return redirect('/theme/'.$id.'/show/'.$id_item);
    }

    function edit ($nickname, $category) {
        // id da category
        $id = true;
        // id do item que vai ser adicionado um bloco
        $id_item = true;
        // dados do bloco (content) que irá ser modificado
        $db = true;
        return view('modulos.block.edit', [
            'id' => $id,
            'id_item' => $id_item,
            'db' => $db,
            'nickname' => $nickname,
            'category' => $category
        ]);
    }

    function update ($nickname, $category) {
        $id = true;
        $id_item = true;
        return redirect('/theme/'.$id.'/show/'.$id_item);
    }
    function destroy ($nickname, $category) {
        $id = true;
        $id_item = true;
        return redirect('/theme/'.$id.'/show/'.$id_item);
    }
}
