<?php

namespace App\Http\Middleware;

use App\Models\Main;
use App\Models\User;
use Closure;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\Redirect;
use Symfony\Component\HttpFoundation\Response;

class hasMainPage
{
    /**
     * Handle an incoming request.
     *
     * @param  \Closure(\Illuminate\Http\Request): (\Symfony\Component\HttpFoundation\Response)  $next
     */
    public function handle(Request $request, Closure $next): Response
    {

        if (!Auth::check()) {
            return redirect('/')
                ->with('msg-danger', 'Você não tem permissão para acessar essa página!');
        } else {

            if (!Auth::user()->nickname != $request->route('nickname')) {
                # code...
                return redirect('/')
                    ->with('msg-danger', 'Você não tem permissão para acessar essa página!');
            } else {
                $main = Main::where('user_id', Auth::id())->first();
                if (!$main) {
                    # code...
                    return redirect('/' . Auth::user()->nickname . '/create')
                        ->with('msg-warning', 'Você ainda não tem uma página Inicial!');
                }
            }
        }
        return $next($request);
    }
}
