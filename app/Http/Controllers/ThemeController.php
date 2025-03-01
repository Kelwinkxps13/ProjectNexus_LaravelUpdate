<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;

class ThemeController extends Controller
{
    function create () {
        return view('modulos.generic.create', [

        ]);
    }

    function store () {
        return redirect('/');
    }

    function show () {
        return view('generic', [

        ]);
    }

    function edit () {
        return view('modulos.generic.edit', [

        ]);
    }

    function update () {
        return redirect('/');
    }
    function destroy () {
        return redirect('/editor');
    }
    function editor () {
        return view('editor', [

        ]);
    }
}
