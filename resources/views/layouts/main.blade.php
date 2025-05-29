<!DOCTYPE html>
<html lang="{{ str_replace('_', '-', app()->getLocale()) }}">

@php

$data = session('user_data');

@endphp

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="csrf-token" content="{{ csrf_token() }}">
    <title>@yield('title')</title>

    {{-- - CSS do font awesome - --}}
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css" />
    {{-- - CSS do Projeto- --}}
    <link rel="stylesheet" href="/css/style.css">
    {{-- - CSS do Google - --}}
    <link href="https://fonts.googleapis.com/css2?family=Roboto" rel="stylesheet">
    {{-- - CSS do Bootstrap - --}}
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet"
        integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">



</head>

<body class="d-flex flex-column min-vh-100">


    {{-- -


Aqui na navbar, na parte de Ver Perfil, aqui o processo vai pegar o nickname do usuario logado,
e em seguida irá redirecionar pra pagina de perfil daquela pessoa


- --}}

    <header>
        <style>
            .navbar {
                background: linear-gradient(135deg, rgba(0, 150, 255, 0.7), rgba(0, 255, 150, 0.7));
                box-shadow: 0 4px 10px rgba(0, 0, 0, 0.3);
                backdrop-filter: blur(10px);
                /* border-radius: 10px; */
            }

            .navbar-brand {
                text-shadow: 2px 2px 10px rgba(255, 255, 255, 0.5);
                font-weight: bold;
            }

            .nav-link {
                color: white !important;
            }

            .nav-item .dropdown-menu {
                background: rgba(255, 255, 255, 0.8);
                border-radius: 5px;
            }

            .profile-icon {
                width: 35px;
                height: 35px;
                background: rgba(255, 255, 255, 0.3);
                overflow: hidden;
                box-shadow: 0 0 10px rgba(255, 255, 255, 0.5);
                border-radius: 50%;
            }
        </style>

        <nav class="navbar navbar-expand-lg">
            <div class="container-fluid">
                <a class="navbar-brand text-white" href="/">Site Pessoal</a>
                <button class="navbar-toggler border-light" type="button" data-bs-toggle="collapse"
                    data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false"
                    aria-label="Toggle navigation">
                    <span class="navbar-toggler-icon"></span>
                </button>
                <div class="collapse navbar-collapse" id="navbarSupportedContent">


                    @auth

                    <li class="nav-item dropdown">
                        <a class="nav-link dropdown-toggle" id="navbarDropdown" href="#" role="button" data-bs-toggle="dropdown"
                            aria-expanded="false"><i class="fas fa-user fa-fw"></i> Minha Área</a>
                        <ul class="dropdown-menu dropdown-menu-end">

                            <li><a class="dropdown-item text-dark" href="/{{Auth::user()->nickname}}">Página Inicial</a></li>
                            <li>
                                <hr class="dropdown-divider" />
                            </li>
                            <li><a class="dropdown-item text-dark" href="/{{Auth::user()->nickname}}/editor">Editor</a></li>

                        </ul>
                    </li>

                    @endauth

                    <ul class="navbar-nav ms-auto">
                        <li class="nav-item">
                            <a href="#" class="nav-link">
                                <div class="d-flex align-items-center justify-content-center profile-icon">
                                    <img src="default/icon-profile-image.jpg" alt="Profile"
                                        style="width: 100%; height: 100%; object-fit: cover;">
                                </div>
                            </a>
                        </li>
                        <li class="nav-item dropdown">
                            <a class="nav-link dropdown-toggle" id="navbarDropdown" href="#" role="button" data-bs-toggle="dropdown"
                                aria-expanded="false"><i class="fas fa-user fa-fw"></i></a>
                            <ul class="dropdown-menu dropdown-menu-end">

                                @auth
                                <li><a class="dropdown-item text-dark" href="{{route('profile.edit')}}">Ver Conta</a></li>
                                <li>
                                    <hr class="dropdown-divider" />
                                </li>
                                <form method="POST" action="{{ route('logout') }}" class="logout-form">
                                    @csrf
                                    <x-dropdown-link :href="route('logout')" onclick="event.preventDefault(); this.closest('form').submit();" class="dropdown-item text-dark">
                                        {{ __('Log Out') }}
                                    </x-dropdown-link>
                                </form>
                                @endauth
                                @guest

                                <li><a class="dropdown-item text-dark" href="{{ route('login') }}">Login</a></li>
                                <li>
                                    <hr class="dropdown-divider" />
                                </li>
                                <li><a class="dropdown-item text-dark" href="{{ route('register') }}">Cadastrar</a></li>
                                @endguest
                            </ul>
                        </li>
                    </ul>
                </div>
            </div>
        </nav>
    </header>

    @if (session('msg-warning'))
    <p class="msg-warning"> {{ session('msg-warning') }} </p>
    @endif
    @if (session('msg-success'))
    <p class="msg-success"> {{ session('msg-success') }} </p>
    @endif
    @if (session('msg-danger'))
    <p class="msg-danger"> {{ session('msg-danger') }} </p>
    @endif

    <div class="container-fluid mt-5">
        <div class="row">
            @yield('content')
        </div>
    </div>

    <footer class="text-dark py-4 mt-5">
        <div class="container text-center">
            <p class="mb-0">&copy; 2025 Kelwin Jhackson Gonçalves de Moura. Todos os direitos reservados.</p>
            <div class="mt-2">
                <a href="https://github.com/Kelwinkxps13/" target="_blank" class="text-dark me-3">
                    <i class="fab fa-github"></i> GitHub
                </a>
                <a href="https://www.facebook.com/kelwin.jhackson/" target="_blank" class="text-dark me-3">
                    <i class="fab fa-facebook"></i> Facebook
                </a>
                <a href="https://www.instagram.com/kelwinkxps13/" target="_blank" class="text-dark">
                    <i class="fab fa-instagram"></i> Instagram
                </a>
            </div>
        </div>
    </footer>

    {{-- -JS do Bootstrap- --}}
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous">
    </script>
    <script>
        const textarea = document.getElementById("autoTextarea");

        textarea.addEventListener("input", () => {
            textarea.style.height = "auto"; // Reseta a altura
            textarea.style.height = textarea.scrollHeight + "px"; // Define nova altura
        });
    </script>
</body>

</html>