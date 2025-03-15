<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Models\Category;
use App\Models\Main;
use App\Models\User;

class IndexController extends Controller
{
    public function index() {

        // foreach de todos os temas!

        $themes_foreach = Category::orderBy('created_at', 'desc')->limit(5)->get();

        $users_foreach = Main::orderBy('user_nickname', 'desc')->limit(10)->get();

        return view('index', [
            'themes_foreach' => $themes_foreach,
            'users_foreach' => $users_foreach
        ]);
    }
}
