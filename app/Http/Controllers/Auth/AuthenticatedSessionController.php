<?php

namespace App\Http\Controllers\Auth;

use App\Http\Controllers\Controller;
use App\Http\Requests\Auth\LoginRequest;
use App\Models\Firsttime;
use Illuminate\Http\RedirectResponse;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use Illuminate\View\View;


class AuthenticatedSessionController extends Controller
{
    /**
     * Display the login view.
     */
    public function create(): View
    {
        return view('auth.login');
    }

    /**
     * Handle an incoming authentication request.
     */
    public function store(LoginRequest $request): RedirectResponse
    {
        $request->authenticate();

        $request->session()->regenerate();

        $ft = Firsttime::where('user_id', Auth::id())->first();
        if (!$ft) {
            Firsttime::create([
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
        }else{
            unset($ft);
        }
        
        return redirect()->intended(route('index', absolute: false));
    }

    /**
     * Destroy an authenticated session.
     */
    public function destroy(Request $request): RedirectResponse
    {
        Auth::guard('web')->logout();

        $request->session()->invalidate();

        $request->session()->regenerateToken();

        return redirect('/')
            ->with('msg-success', 'deslogado(a) com sucesso!');;
    }
}
