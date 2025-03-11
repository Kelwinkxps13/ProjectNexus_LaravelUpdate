<?php

use App\Http\Controllers\ProfileController;
use App\Http\Controllers\ThemeController;
use App\Http\Controllers\ItemController;
use App\Http\Controllers\ContentController;
use App\Http\Controllers\IndexController;
use App\Http\Controllers\UserController;
use App\Http\Middleware\IsCreator;
use Illuminate\Support\Facades\Route;

require __DIR__ . '/auth.php';

// Route::get('/', function () {
//     return view('welcome');
// });

// Route::get('/dashboard', function () {
//     return view('dashboard');
// })->middleware(['auth', 'verified'])->name('dashboard');

Route::middleware('auth')->group(function () {
    Route::get('/profile', [ProfileController::class, 'edit'])->name('profile.edit');
    Route::patch('/profile', [ProfileController::class, 'update'])->name('profile.update');
    Route::delete('/profile', [ProfileController::class, 'destroy'])->name('profile.destroy');
});


// adicionado pelo dev
Route::get('/', [IndexController::class, 'index']); // feito com sucesso!
// rotas do user
Route::get('/{nickname}', [UserController::class, 'index']); // feito com sucesso!
Route::get('/{nickname}/create', [UserController::class, 'create'])->middleware('iscreator'); // feito com sucesso!
Route::post('/{nickname}', [UserController::class, 'store'])->middleware('iscreator'); // feito com sucesso!
Route::get('/{nickname}/edit', [UserController::class, 'edit'])->middleware('iscreator'); // feito com sucesso!
Route::patch('/{nickname}', [UserController::class, 'update'])->middleware('iscreator'); // feito com sucesso!
Route::post('/{nickname}/editor', [UserController::class, 'editor'])->middleware('iscreator'); // feito com sucesso!

// rotas de theme
Route::get('/{nickname}/{category}', [ThemeController::class, 'index']); // feito com sucesso!
Route::get('/{nickname}/category/create', [ThemeController::class, 'create'])->middleware('iscreator'); // feito com sucesso!
Route::post('/{nickname}/category', [ThemeController::class, 'store'])->middleware('iscreator'); // feito com sucesso!
Route::get('/{nickname}/{category}/edit', [ThemeController::class, 'edit'])->middleware('iscreator'); // feito com sucesso!
Route::patch('/{nickname}/category', [ThemeController::class, 'update'])->middleware('iscreator'); // feito com sucesso!
Route::delete('/{nickname}/category', [ThemeController::class, 'destroy'])->middleware('iscreator'); // feito com sucesso!

//rotas do registro de theme (os itens)
Route::get('/{nickname}/{category}/{id_item}', [ItemController::class, 'index']); // feito com sucesso!
Route::get('/{nickname}/{category}/create', [ItemController::class, 'create'])->middleware('iscreator'); // feito com sucesso!
Route::post('/{nickname}/{category}/{id_item}', [ItemController::class, 'store'])->middleware('iscreator'); // feito com sucesso!
Route::get('/{nickname}/{category}/edit/{id_item}', [ItemController::class, 'edit'])->middleware('iscreator'); // falta a logica do controller
Route::patch('/{nickname}/{category}/{id_item}', [ItemController::class, 'update'])->middleware('iscreator'); // falta tudo
Route::delete('/{nickname}/{category}/{id_item}', [ItemController::class, 'destroy'])->middleware('iscreator'); // falta tudo
Route::get('/{nickname}/{category}/{id_item}/editor', [ItemController::class, 'editor'])->middleware('iscreator'); // falta a logica do controller

//rotas dos blocos (conteudo) de cada item
Route::get('/{nickname}/{category}/createblock/{id_item}', [ContentController::class, 'create'])->middleware('iscreator'); // falta a logica do controller
Route::post('/{nickname}/{category}/storeblock', [ContentController::class, 'store'])->middleware('iscreator'); // falta tudo
Route::get('/{nickname}/{category}/editblock/{id_item}/{id_block}', [ContentController::class, 'edit'])->middleware('iscreator'); // falta a logica do controller
Route::patch('/{nickname}/{category}/updateblock', [ContentController::class, 'update'])->middleware('iscreator'); // falta tudo
Route::delete('/{nickname}/{category}/destroyblock/{id_item}/{idblock}', [ContentController::class, 'destroy'])->middleware('iscreator'); // falta tudo
