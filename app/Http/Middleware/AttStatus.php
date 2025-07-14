<?php

namespace App\Http\Middleware;

use Closure;
use Illuminate\Http\Request;
use Symfony\Component\HttpFoundation\Response;
use App\Models\Category;
use App\Models\Follower;
use Illuminate\Support\Facades\Auth;

class AttStatus
{
    /**
     * Handle an incoming request.
     *
     * @param  \Closure(\Illuminate\Http\Request): (\Symfony\Component\HttpFoundation\Response)  $next
     */
    public function handle(Request $request, Closure $next): Response
    {


        if (Auth::check()) {
            $user = Auth::user();

            $count_theme = Category::where('user_id', $user->id)->count();
            $count_followers = Follower::where('id_creator', $user->id)->count();
            $count_following = Follower::where('id_user', $user->id)->count();

            session([
                'count_theme' => $count_theme,
                'count_followers' => $count_followers,
                'count_following' => $count_following,
            ]);
        }

        return $next($request);
    }
}
