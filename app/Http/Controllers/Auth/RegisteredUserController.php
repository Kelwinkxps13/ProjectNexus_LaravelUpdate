<?php

namespace App\Http\Controllers\Auth;

use App\Http\Controllers\Controller;
use App\Models\User;
use App\Models\Firsttime;
use App\Models\Notification;
use Illuminate\Auth\Events\Registered;
use Illuminate\Http\RedirectResponse;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\Hash;
use Illuminate\Validation\Rules;
use Illuminate\View\View;

class RegisteredUserController extends Controller
{
    /**
     * Display the registration view.
     */
    public function create(): View
    {
        return view('auth.register');
    }

    /**
     * Handle an incoming registration request.
     *
     * @throws \Illuminate\Validation\ValidationException
     */
    public function store(Request $request): RedirectResponse
    {
        $request->validate([
            'name' => ['required', 'string', 'max:255'],
            'email' => ['required', 'string', 'lowercase', 'email', 'max:255', 'unique:' . User::class],
            'nickname' => ['required', 'string', 'max:255', 'unique:' . User::class],
            'password' => ['required', 'confirmed', Rules\Password::defaults()],
        ]);

        $user = User::create([
            'name' => $request->name,
            'email' => $request->email,
            'nickname' => $request->nickname,
            'password' => Hash::make($request->password),
            'followers' => [],
            'following' => []
        ]);

        



        event(new Registered($user));

        Auth::login($user);

        $first_time = Firsttime::create([
            'user_id' => Auth::id(),
            'editor' => 1,
            'generic' => 1,
            'index' => 1,
            'indexcreator' => 1,
            'indexeditor' => 1,
            'main' => 1,
            'veja' => 1,
            'vejaeditor' => 1,
            'base_create' => 1,
            'base_edit' => 1,
            'block_create' => 1,
            'block_edit' => 1,
            'generic_create' => 1,
            'generic_edit' => 1
        ]);

        Notification::create([
            'user_id' => Auth::id(),
            'name' => 'Seja Bem-vindo(a) ao Site Nexus!',
            'text' => 'Compartilhe, descubra novos conteúdos, interaja e divirta-se!',
            'status' => 'system'
        ]);

        return redirect(route('index', absolute: false));
    }
}
