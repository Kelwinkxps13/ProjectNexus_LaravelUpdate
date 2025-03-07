<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Models\Category;

class IndexController extends Controller
{
    public function index() {

        // foreach de todos os temas!

        $themes_foreach = Category::orderBy('created_at', 'desc')->limit(5)->get();
            

        return view('index', [
            'themes_foreach' => $themes_foreach
        ]);
    }
}
