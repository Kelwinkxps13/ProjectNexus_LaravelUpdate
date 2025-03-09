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
Route::get('/{nickname}/create', [UserController::class, 'create'])->middleware('iscreator'); // falta a logica do controller
Route::post('/{nickname}/store', [UserController::class, 'store'])->middleware('iscreator'); // falta a logica do controller
Route::get('/{nickname}/edit', [UserController::class, 'edit'])->middleware('iscreator'); // falta a logica do controller
Route::post('/{nickname}/update', [UserController::class, 'update'])->middleware('iscreator'); // falta a logica do controller
Route::post('/{nickname}/editor', [UserController::class, 'editor'])->middleware('iscreator'); // falta a logica do controller

// rotas de theme
Route::get('/{nickname}/theme/create', [ThemeController::class, 'create'])->middleware('iscreator'); // falta a logica do controller
Route::post('/{nickname}/theme/store', [ThemeController::class, 'store'])->middleware('iscreator'); // falta tudo
Route::get('/{nickname}/theme/show/{id}', [ThemeController::class, 'show']); // falta a logica do controller
Route::get('/{nickname}/theme/edit', [ThemeController::class, 'edit'])->middleware('iscreator'); // falta a logica do controller
Route::post('/{nickname}/theme/update', [ThemeController::class, 'update'])->middleware('iscreator'); // falta tudo
Route::post('/{nickname}/theme/destroy{id}', [ThemeController::class, 'destroy'])->middleware('iscreator'); // falta tudo

//rotas do registro de theme (os itens)
Route::get('/{nickname}/theme/{id}/create', [ItemController::class, 'create'])->middleware('iscreator'); // falta a logica do controller
Route::post('/{nickname}/theme/{id}/store', [ItemController::class, 'store'])->middleware('iscreator'); // falta tudo
Route::get('/{nickname}/theme/{id}/{id_item}', [ItemController::class, 'show']); // falta a logica do controller
Route::get('/{nickname}/theme/{id}/edit/{id_item}', [ItemController::class, 'edit'])->middleware('iscreator'); // falta a logica do controller
Route::post('/{nickname}/theme/{id}/update', [ItemController::class, 'update'])->middleware('iscreator'); // falta tudo
Route::post('/{nickname}/theme/{id}/destroy/{id_item}', [ItemController::class, 'destroy'])->middleware('iscreator'); // falta tudo
Route::get('/{nickname}/theme/{id}/show/{id_item}/editor', [ItemController::class, 'editor'])->middleware('iscreator'); // falta a logica do controller

//rotas dos blocos (conteudo) de cada item
Route::get('/{nickname}/theme/{id}/createblock/{id_item}', [ContentController::class, 'create'])->middleware('iscreator'); // falta a logica do controller
Route::post('/{nickname}/theme/{id}/storeblock', [ContentController::class, 'store'])->middleware('iscreator'); // falta tudo
Route::get('/{nickname}/theme/{id}/editblock/{id_item}/{id_block}', [ContentController::class, 'edit'])->middleware('iscreator'); // falta a logica do controller
Route::post('/{nickname}/theme/{id}/updateblock', [ContentController::class, 'update'])->middleware('iscreator'); // falta tudo
Route::post('/{nickname}/theme/{id}/destroyblock/{id_item}/{idblock}', [ContentController::class, 'destroy'])->middleware('iscreator'); // falta tudo
