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
// adicionado pelo dev
Route::get('/', [IndexController::class, 'index'])->middleware(['att_status'])->name('index'); // feito com sucesso!

Route::get('/notifications', [UserController::class, 'notifications'])->middleware(['att_status'])->name('notifications');
Route::get('/pesquisa', [IndexController::class, 'search'])->middleware(['att_status'])->name('search');
Route::get('/{nickname}/editor', [UserController::class, 'editor'])->middleware(['is_creator', 'has_main_page', 'att_status'])->name('user_editor'); // feito com sucesso!

// rotas dos blocos (conteúdo) de cada item
Route::get('/{nickname}/{category_name_slug}/createblock/{item_name_slug}', [ContentController::class, 'create'])->middleware(['is_creator', 'has_main_page', 'att_status'])->name('content_create'); // feito com sucesso!
Route::post('/{nickname}/{category_name_slug}/storeblock', [ContentController::class, 'store'])->middleware(['is_creator', 'has_main_page', 'att_status'])->name('content_store'); // feito com sucesso!
Route::patch('/{nickname}/{category_name_slug}/updateblock', [ContentController::class, 'update'])->middleware(['is_creator', 'has_main_page', 'att_status'])->name('content_update'); // feito com sucesso!
Route::delete('/{nickname}/{category_name_slug}/destroyblock', [ContentController::class, 'destroy'])->middleware(['is_creator', 'has_main_page', 'att_status'])->name('content_destroy'); // feito com sucesso!

Route::get('/{nickname}/category/create', [ThemeController::class, 'create'])->middleware(['is_creator', 'has_main_page', 'att_status'])->name('category_create'); // feito com sucesso!
Route::get('/{nickname}/{category_name_slug}/edit', [ThemeController::class, 'edit'])->middleware(['is_creator', 'has_main_page', 'att_status'])->name('category_edit'); // feito com sucesso!
Route::post('/{nickname}/category', [ThemeController::class, 'store'])->middleware(['is_creator', 'has_main_page', 'att_status'])->name('category_store'); // feito com sucesso!
Route::patch('/{nickname}/category', [ThemeController::class, 'update'])->middleware(['is_creator', 'has_main_page', 'att_status'])->name('category_update'); // feito com sucesso!
Route::delete('/{nickname}/category', [ThemeController::class, 'destroy'])->middleware(['is_creator', 'has_main_page', 'att_status'])->name('category_destroy'); // feito com sucesso!

Route::get('/{nickname}/create', [UserController::class, 'create'])->middleware(['is_creator', 'att_status'])->name('user_create'); // feito com sucesso!
Route::get('/{nickname}/edit', [UserController::class, 'edit'])->middleware(['is_creator', 'has_main_page', 'att_status'])->name('user_edit'); // feito com sucesso!

// FOLLOWERS
Route::post('/{nickname}/follow', [UserController::class, 'follow'])->middleware(['att_status'])->name('follow'); // feito com sucesso!
Route::post('/{nickname}/unfollow', [UserController::class, 'unfollow'])->middleware(['att_status'])->name('unfollow'); // feito com sucesso!

// rotas do registro de theme (os itens)
Route::get('/{nickname}/{category_name_slug}/create', [ItemController::class, 'create'])->middleware(['is_creator', 'has_main_page', 'att_status'])->name('item_create'); // feito com sucesso!
Route::get('/{nickname}/{category_name_slug}/{item_name_slug}', [ItemController::class, 'index'])->middleware(['att_status'])->name('item_index'); // feito com sucesso!
Route::post('/{nickname}/{category_name_slug}/', [ItemController::class, 'store'])->middleware(['is_creator', 'has_main_page', 'att_status'])->name('item_store'); // feito com sucesso!
Route::post('/{nickname}/{category_name_slug}/{item_name_slug}/like', [ItemController::class, 'like'])->middleware(['att_status'])->name('item_like'); // feito com sucesso!
Route::post('/{nickname}/{category_name_slug}/{item_name_slug}/unlike', [ItemController::class, 'unlike'])->middleware(['att_status'])->name('item_unlike'); // feito com sucesso!
Route::post('/{nickname}/{category_name_slug}/{item_name_slug}/dislike', [ItemController::class, 'dislike'])->middleware(['att_status'])->name('item_dislike'); // feito com sucesso!
Route::post('/{nickname}/{category_name_slug}/{item_name_slug}/undislike', [ItemController::class, 'undislike'])->middleware(['att_status'])->name('item_undislike'); // feito com sucesso!

// adicionar comentários
Route::post('/{nickname}/{category_name_slug}/{item_name_slug}/add_comment_0', [ItemController::class, 'add_comment_0'])->middleware(['att_status'])->name('add_comment_0'); // feito com sucesso!
Route::post('/{nickname}/{category_name_slug}/{item_name_slug}/add_comment_1', [ItemController::class, 'add_comment_1'])->middleware(['att_status'])->name('add_comment_1'); // feito com sucesso!
Route::post('/{nickname}/{category_name_slug}/{item_name_slug}/add_comment_2', [ItemController::class, 'add_comment_2'])->middleware(['att_status'])->name('add_comment_2'); // feito com sucesso!

Route::get('/{nickname}/{category_name_slug}/edit/{item_name_slug}', [ItemController::class, 'edit'])->middleware(['is_creator', 'has_main_page', 'att_status'])->name('item_edit'); // feito com sucesso!
Route::patch('/{nickname}/{category_name_slug}/', [ItemController::class, 'update'])->middleware(['is_creator', 'has_main_page', 'att_status'])->name('item_update'); // feito com sucesso!
Route::delete('/{nickname}/{category_name_slug}/', [ItemController::class, 'destroy'])->middleware(['is_creator', 'has_main_page', 'att_status'])->name('item_destroy'); // feito com sucesso!
Route::get('/{nickname}/{category_name_slug}/{item_name_slug}/editor', [ItemController::class, 'editor'])->middleware(['is_creator', 'has_main_page', 'att_status'])->name('item_editor'); // feito com sucesso!
Route::get('/{nickname}/{category_name_slug}/{item_name_slug}/{idblock}', [ContentController::class, 'edit'])->middleware(['is_creator', 'has_main_page', 'att_status'])->name('content_edit'); // feito com sucesso!
// rotas de theme
Route::get('/{nickname}/{category_name_slug}', [ThemeController::class, 'index'])->middleware(['att_status'])->name('category_index'); // feito com sucesso!



// rotas do user
Route::get('/{nickname}', [UserController::class, 'index'])->middleware(['att_status'])->name('user_index'); // feito com sucesso!
Route::post('/{nickname}', [UserController::class, 'store'])->middleware(['is_creator', 'att_status'])->name('user_store'); // feito com sucesso!
Route::patch('/{nickname}', [UserController::class, 'update'])->middleware(['is_creator', 'has_main_page', 'att_status'])->name('user_update'); // feito com sucesso!
