<?php

use App\Http\Controllers\ProfileController;
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
Route::get('/', [IndexController::class, 'index']);
Route::get('/create', [IndexController::class, 'create']);
Route::post('/store', [IndexController::class, 'store']);
Route::get('/edit', [IndexController::class, 'edit']);
Route::post('/update', [IndexController::class, 'update']);
Route::post('/editor', [IndexController::class, 'editor']);

// rotas de theme

Route::post('/theme/store', [ThemeController::class, 'store']);
Route::post('/theme/update', [ThemeController::class, 'store']);
Route::post('/theme/destroy{id}', [ThemeController::class, 'destroy']);


require __DIR__.'/auth.php';
