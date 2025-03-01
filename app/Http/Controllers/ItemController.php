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
        return view('modulos.veja', [

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
