<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;

class ContentController extends Controller
{
    function create () {
        return view('modulos.block.create', [

        ]);
    }

    function store () {
        $id = true;
        $id_item = true;
        return redirect('/theme/'.$id.'/show/'.$id_item);
    }

    function edit () {
        return view('modulos.block.edit', [

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
