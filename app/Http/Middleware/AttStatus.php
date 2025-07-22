<?php

namespace App\Http\Middleware;

use Illuminate\Support\Facades\Auth;
use Closure;
use Illuminate\Http\Request;
use Symfony\Component\HttpFoundation\Response;
use App\Models\Category;
use App\Models\Notification;
use App\Models\Follower; 


class AttStatus
{
    /**
     * Handle an incoming request.
     *
     * @param  \Closure(\Illuminate\Http\Request): (\Symfony\Component\HttpFoundation\Response)  $next
     */
    public function handle(Request $request, Closure $next): Response
    {

        if ($request->method() == 'GET') {

            if (Auth::check()) {
                // dd('ola mund');
                // dd(Auth::user()->nickname);
                $user = Auth::user();

                $count_theme = Category::where('user_id', $user->id)->count();
                $count_followers = Follower::where('id_creator', $user->id)->count();
                $count_following = Follower::where('id_user', $user->id)->count();
                $notifications_user = Notification::where('user_id', Auth::id())->orWhere('user_id', 0)->count();
                if (!$notifications_user) {
                    $notifications_user = 0;
                }

                session([
                    'count_theme' => $count_theme,
                    'count_followers' => $count_followers,
                    'count_following' => $count_following,
                    'notifications_user' => $notifications_user
                ]);
            }
        }



        return $next($request);
    }
}
