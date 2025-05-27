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
Route::get('/', [IndexController::class, 'index'])->name('index'); // feito com sucesso!

Route::get('/{nickname}/editor', [UserController::class, 'editor'])->middleware(['is_creator', 'has_main_page'])->name('user_editor'); // feito com sucesso!

//rotas dos blocos (conteudo) de cada item
Route::get('/{nickname}/{category_name_slug}/editblock', [ContentController::class, 'edit'])->middleware(['is_creator', 'has_main_page'])->name('content_edit'); // feito com sucesso!
Route::get('/{nickname}/{category_name_slug}/createblock/{item_name_slug}', [ContentController::class, 'create'])->middleware(['is_creator', 'has_main_page'])->name('content_create'); // feito com sucesso!
Route::post('/{nickname}/{category_name_slug}/storeblock', [ContentController::class, 'store'])->middleware(['is_creator', 'has_main_page'])->name('content_store'); // feito com sucesso!
Route::patch('/{nickname}/{category_name_slug}/updateblock', [ContentController::class, 'update'])->middleware(['is_creator', 'has_main_page'])->name('content_update'); // feito com sucesso!
Route::delete('/{nickname}/{category_name_slug}/destroyblock', [ContentController::class, 'destroy'])->middleware(['is_creator', 'has_main_page'])->name('content_destroy'); // feito com sucesso!


Route::get('/{nickname}/category/create', [ThemeController::class, 'create'])->middleware(['is_creator', 'has_main_page'])->name('category_create'); // feito com sucesso!
Route::get('/{nickname}/{category_name_slug}/edit', [ThemeController::class, 'edit'])->middleware(['is_creator', 'has_main_page'])->name('category_edit'); // feito com sucesso!
Route::post('/{nickname}/category', [ThemeController::class, 'store'])->middleware(['is_creator', 'has_main_page'])->name('category_store'); // feito com sucesso!
Route::patch('/{nickname}/category', [ThemeController::class, 'update'])->middleware(['is_creator', 'has_main_page'])->name('category_update'); // feito com sucesso!
Route::delete('/{nickname}/category', [ThemeController::class, 'destroy'])->middleware(['is_creator', 'has_main_page'])->name('category_destroy'); // feito com sucesso!


Route::get('/{nickname}/create', [UserController::class, 'create'])->middleware(['is_creator'])->name('user_create'); // feito com sucesso!
Route::get('/{nickname}/edit', [UserController::class, 'edit'])->middleware(['is_creator', 'has_main_page'])->name('user_edit'); // feito com sucesso!


//rotas do registro de theme (os itens)
Route::get('/{nickname}/{category_name_slug}/create', [ItemController::class, 'create'])->middleware(['is_creator', 'has_main_page'])->name('item_create'); // feito com sucesso!
Route::get('/{nickname}/{category_name_slug}/{item_name_slug}', [ItemController::class, 'index'])->name('item_index'); // feito com sucesso!
Route::post('/{nickname}/{category_name_slug}/', [ItemController::class, 'store'])->middleware(['is_creator', 'has_main_page'])->name('item_store'); // feito com sucesso!
Route::post('/{nickname}/{category_name_slug}/{item_name_slug}/like', [ItemController::class, 'like'])->name('item_like'); // feito com sucesso!
Route::post('/{nickname}/{category_name_slug}/{item_name_slug}/unlike', [ItemController::class, 'unlike'])->name('item_unlike'); // feito com sucesso!
Route::post('/{nickname}/{category_name_slug}/{item_name_slug}/dislike', [ItemController::class, 'dislike'])->name('item_dislike'); // feito com sucesso!
Route::post('/{nickname}/{category_name_slug}/{item_name_slug}/undislike', [ItemController::class, 'undislike'])->name('item_undislike'); // feito com sucesso!
Route::get('/{nickname}/{category_name_slug}/edit/{item_name_slug}', [ItemController::class, 'edit'])->middleware(['is_creator', 'has_main_page'])->name('item_edit'); // feito com sucesso!
Route::patch('/{nickname}/{category_name_slug}/', [ItemController::class, 'update'])->middleware(['is_creator', 'has_main_page'])->name('item_update'); // feito com sucesso!
Route::delete('/{nickname}/{category_name_slug}/', [ItemController::class, 'destroy'])->middleware(['is_creator', 'has_main_page'])->name('item_destroy'); // feito com sucesso!
Route::get('/{nickname}/{category_name_slug}/{item_name_slug}/editor', [ItemController::class, 'editor'])->middleware(['is_creator', 'has_main_page'])->name('item_editor'); // feito com sucesso!


// rotas de theme
Route::get('/{nickname}/{category_name_slug}', [ThemeController::class, 'index'])->name('category_index'); // feito com sucesso!





// rotas do user
Route::get('/{nickname}', [UserController::class, 'index'])->name('user_index'); // feito com sucesso!

Route::post('/{nickname}', [UserController::class, 'store'])->middleware(['is_creator'])->name('user_store'); // feito com sucesso!

Route::patch('/{nickname}', [UserController::class, 'update'])->middleware(['is_creator', 'has_main_page'])->name('user_update'); // feito com sucesso!


