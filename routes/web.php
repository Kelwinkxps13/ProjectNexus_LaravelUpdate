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
// Rotas principais (fixas)
Route::get('/', [IndexController::class, 'index'])->middleware(['att_status'])->name('index');
Route::get('/notifications', [UserController::class, 'notifications'])->middleware(['att_status'])->name('notifications');
Route::delete('/notifications', [UserController::class, 'notifications_destroy'])->middleware(['att_status'])->name('notification_destroy');
Route::get('/pesquisa', [IndexController::class, 'search'])->middleware(['att_status'])->name('search');

// Rotas de usuário
Route::post('/{nickname}', [UserController::class, 'store'])->middleware(['is_creator', 'att_status'])->name('user_store');
Route::patch('/{nickname}', [UserController::class, 'update'])->middleware(['is_creator', 'has_main_page', 'att_status'])->name('user_update');
Route::get('/{nickname}', [UserController::class, 'index'])->middleware(['att_status'])->name('user_index');

// Rotas específicas de usuário
Route::get('/{nickname}/editor', [UserController::class, 'editor'])->middleware(['is_creator', 'has_main_page', 'att_status'])->name('user_editor');
Route::get('/{nickname}/create', [UserController::class, 'create'])->middleware(['is_creator', 'att_status'])->name('user_create');
Route::get('/{nickname}/edit', [UserController::class, 'edit'])->middleware(['is_creator', 'has_main_page', 'att_status'])->name('user_edit');


// Follow / Unfollow
Route::post('/{nickname}/follow', [UserController::class, 'follow'])->middleware(['att_status'])->name('follow');
Route::post('/{nickname}/unfollow', [UserController::class, 'unfollow'])->middleware(['att_status'])->name('unfollow');

// Categorias (Themes)
Route::get('/{nickname}/categorycreate', [ThemeController::class, 'create'])->middleware(['is_creator', 'has_main_page', 'att_status'])->name('category_create');
Route::post('/{nickname}/category', [ThemeController::class, 'store'])->middleware(['is_creator', 'has_main_page', 'att_status'])->name('category_store');
Route::patch('/{nickname}/category', [ThemeController::class, 'update'])->middleware(['is_creator', 'has_main_page', 'att_status'])->name('category_update');
Route::delete('/{nickname}/category', [ThemeController::class, 'destroy'])->middleware(['is_creator', 'has_main_page', 'att_status'])->name('category_destroy');
Route::get('/{nickname}/{category_name_slug}/edit', [ThemeController::class, 'edit'])->middleware(['is_creator', 'has_main_page', 'att_status'])->name('category_edit');
Route::get('/{nickname}/{category_name_slug}', [ThemeController::class, 'index'])->middleware(['att_status'])->name('category_index');

// Itens (Itens de Categoria)
Route::get('/{nickname}/{category_name_slug}/create', [ItemController::class, 'create'])->middleware(['is_creator', 'has_main_page', 'att_status'])->name('item_create');
Route::post('/{nickname}/{category_name_slug}/', [ItemController::class, 'store'])->middleware(['is_creator', 'has_main_page', 'att_status'])->name('item_store');
Route::patch('/{nickname}/{category_name_slug}/', [ItemController::class, 'update'])->middleware(['is_creator', 'has_main_page', 'att_status'])->name('item_update');
Route::delete('/{nickname}/{category_name_slug}/', [ItemController::class, 'destroy'])->middleware(['is_creator', 'has_main_page', 'att_status'])->name('item_destroy');
Route::get('/{nickname}/{category_name_slug}/{item_name_slug}/edit', [ItemController::class, 'edit'])->middleware(['is_creator', 'has_main_page', 'att_status'])->name('item_edit');
Route::get('/{nickname}/{category_name_slug}/{item_name_slug}/editor', [ItemController::class, 'editor'])->middleware(['is_creator', 'has_main_page', 'att_status'])->name('item_editor');
Route::get('/{nickname}/{category_name_slug}/{item_name_slug}', [ItemController::class, 'index'])->middleware(['att_status'])->name('item_index');

// Likes / Dislikes
Route::post('/{nickname}/{category_name_slug}/{item_name_slug}/like', [ItemController::class, 'like'])->middleware(['att_status'])->name('item_like');
Route::post('/{nickname}/{category_name_slug}/{item_name_slug}/unlike', [ItemController::class, 'unlike'])->middleware(['att_status'])->name('item_unlike');
Route::post('/{nickname}/{category_name_slug}/{item_name_slug}/dislike', [ItemController::class, 'dislike'])->middleware(['att_status'])->name('item_dislike');
Route::post('/{nickname}/{category_name_slug}/{item_name_slug}/undislike', [ItemController::class, 'undislike'])->middleware(['att_status'])->name('item_undislike');

// Comentários
Route::post('/{nickname}/{category_name_slug}/{item_name_slug}/add_comment_0', [ItemController::class, 'add_comment_0'])->middleware(['att_status'])->name('add_comment_0');
Route::post('/{nickname}/{category_name_slug}/{item_name_slug}/add_comment_1', [ItemController::class, 'add_comment_1'])->middleware(['att_status'])->name('add_comment_1');
Route::post('/{nickname}/{category_name_slug}/{item_name_slug}/add_comment_2', [ItemController::class, 'add_comment_2'])->middleware(['att_status'])->name('add_comment_2');

// Blocos de conteúdo (dentro dos itens)
Route::get('/{nickname}/{category_name_slug}/{item_name_slug}/createblock', [ContentController::class, 'create'])->middleware(['is_creator', 'has_main_page', 'att_status'])->name('content_create');
Route::post('/{nickname}/{category_name_slug}/storeblock', [ContentController::class, 'store'])->middleware(['is_creator', 'has_main_page', 'att_status'])->name('content_store');
Route::patch('/{nickname}/{category_name_slug}/updateblock', [ContentController::class, 'update'])->middleware(['is_creator', 'has_main_page', 'att_status'])->name('content_update');
Route::delete('/{nickname}/{category_name_slug}/destroyblock', [ContentController::class, 'destroy'])->middleware(['is_creator', 'has_main_page', 'att_status'])->name('content_destroy');
Route::get('/{nickname}/{category_name_slug}/{item_name_slug}/{idblock}', [ContentController::class, 'edit'])->middleware(['is_creator', 'has_main_page', 'att_status'])->name('content_edit');
