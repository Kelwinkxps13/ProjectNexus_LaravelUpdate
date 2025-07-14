<?php

use App\Http\Middleware\hasMainPage;
use App\Http\Middleware\IsCreator;
use App\Http\Middleware\AttStatus;
use Illuminate\Foundation\Application;
use Illuminate\Foundation\Configuration\Exceptions;
use Illuminate\Foundation\Configuration\Middleware;

return Application::configure(basePath: dirname(__DIR__))
    ->withRouting(
        web: __DIR__.'/../routes/web.php',
        commands: __DIR__.'/../routes/console.php',
        health: '/up',
    )
    ->withMiddleware(function (Middleware $middleware) {
        $middleware
        ->append(AttStatus::class)
        ->alias([
            'is_creator' => IsCreator::class,
            'has_main_page' => hasMainPage::class
        ]);
    })
    ->withExceptions(function (Exceptions $exceptions) {
        //
    })->create();
