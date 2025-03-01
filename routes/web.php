<?php

use App\Http\Controllers\ProfileController;
use App\Http\Controllers\ThemeController;
use App\Http\Controllers\ItemController;
use App\Http\Controllers\ContentController;
use App\Http\Controllers\IndexController;
use Illuminate\Support\Facades\Route;



// Route::get('/', function () {
//     return view('welcome');
// });

Route::get('/dashboard', function () {
    return view('dashboard');
})->middleware(['auth', 'verified'])->name('dashboard');

Route::middleware('auth')->group(function () {
    Route::get('/profile', [ProfileController::class, 'edit'])->name('profile.edit');
    Route::patch('/profile', [ProfileController::class, 'update'])->name('profile.update');
    Route::delete('/profile', [ProfileController::class, 'destroy'])->name('profile.destroy');
});


// adicionado pelo dev

// rotas do index
Route::get('/', [IndexController::class, 'index']); // falta a logica do controller
Route::get('/create', [IndexController::class, 'create']); // falta tudo
Route::post('/store', [IndexController::class, 'store']); // falta tudo
Route::get('/edit', [IndexController::class, 'edit']); // falta tudo
Route::post('/update', [IndexController::class, 'update']); // falta tudo
Route::post('/editor', [IndexController::class, 'editor']); // falta tudo

// rotas de theme
Route::get('/theme/create', [ThemeController::class, 'create']); // falta tudo
Route::post('/theme/store', [ThemeController::class, 'store']); // falta tudo
Route::get('/theme/show/{id}', [ThemeController::class, 'show']); // falta tudo
Route::get('/theme/edit', [ThemeController::class, 'edit']); // falta tudo
Route::post('/theme/update', [ThemeController::class, 'store']); // falta tudo
Route::post('/theme/destroy{id}', [ThemeController::class, 'destroy']); // falta tudo

//rotas do registro de theme (os itens)
Route::get('/theme/{id}', [ItemController::class, 'index']); // falta tudo
Route::get('/theme/{id}/create', [ItemController::class, 'create']); // falta tudo
Route::post('/theme/{id}/store', [ItemController::class, 'store']); // falta tudo
Route::get('/theme/{id}/{id_item}', [ItemController::class, 'show']); // falta tudo
Route::get('/theme/{id}/edit/{id_item}', [ItemController::class, 'edit']); // falta tudo
Route::post('/theme/{id}/update', [ItemController::class, 'update']); // falta tudo
Route::post('/theme/{id}/destroy/{id_item}', [ItemController::class, 'destroy']); // falta tudo
Route::get('/theme/{id}/{id_item}/editor', [ItemController::class, 'editor']); // falta tudo

//rotas dos blocos (conteudo) de cada item
Route::get('/theme/{id}/createblock/{id_item}', [ContentController::class, 'create']); // falta tudo
Route::post('/theme/{id}/storeblock', [ContentController::class, 'store']); // falta tudo
Route::get('/theme/{id}/editblock/{id_item}/{id_block}', [ContentController::class, 'edit']); // falta tudo
Route::post('/theme/{id}/updateblock', [ContentController::class, 'update']); // falta tudo
Route::post('/theme/{id}/destroyblock/{id_item}/{idblock}', [ContentController::class, 'destroy']); // falta tudo


require __DIR__.'/auth.php';
