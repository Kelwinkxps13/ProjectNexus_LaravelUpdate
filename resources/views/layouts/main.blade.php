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

  <!-- @vite(['resources/js/app.js']) -->

  {{-- - CSS do font awesome - --}}
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css" />

  {{-- - CSS do Google - --}}
  <link href="https://fonts.googleapis.com/css2?family=Roboto" rel="stylesheet">
  {{-- - CSS do Bootstrap - --}}
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet"
    integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
  {{-- - CSS do Projeto- --}}
  <link rel="stylesheet" href="/css/style.css">



  <link href="https://fonts.googleapis.com/css?family=Roboto:300,400&display=swap" rel="stylesheet">

  <link href="https://fonts.googleapis.com/css?family=Poppins:300,400,500&display=swap" rel="stylesheet">

  <link href="https://fonts.googleapis.com/css?family=Source+Serif+Pro:400,600&display=swap" rel="stylesheet">

  <link rel="stylesheet" href="fonts/icomoon/style.css">

  <link rel="stylesheet" href="css/owl.carousel.min.css">

  <!-- Bootstrap CSS -->
  <link rel="stylesheet" href="css/bootstrap.min.css">

  <!-- Style -->
  <link rel="stylesheet" href="css/style.css">



</head>

<body class="d-flex flex-column min-vh-100">


  <style>
    .btn {
      padding: .55rem 1.5rem .45rem;
    }
  </style>

  <!-- Navbar -->
  <header>
    <!-- Navbar -->
    <nav class="navbar navbar-expand-lg navbar-dark bg-dark">
      <!-- Container wrapper -->
      <div class="container-fluid">
        <!-- Navbar brand -->
        <a class="navbar-brand" href="#">Nexus</a>

        <!-- Toggle button -->
        <button class="navbar-toggler" type="button" data-mdb-collapse-init
          data-mdb-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false"
          aria-label="Toggle navigation">
          <i class="fas fa-bars text-light"></i>
        </button>

        <!-- Collapsible wrapper -->
        <div class="collapse navbar-collapse" id="navbarSupportedContent">
          <div class="d-flex justify-content-between align-items-center w-100">

            <!-- ESQUERDA: Links -->
            <ul class="navbar-nav d-flex flex-row mt-3 mt-lg-0">
              <li class="nav-item text-center mx-2 mx-lg-1">
                <a class="nav-link active" aria-current="page" href="/">
                  <div><i class="fas fa-home fa-lg mb-1"></i></div>
                  Início
                </a>
              </li>

              @auth
              <li class="nav-item text-center mx-2 mx-lg-1">
                <a class="nav-link" href="/{{Auth::user()->nickname}}">
                  <div>
                    <i class="fas fa-user fa-lg mb-1"></i>
                    <!-- <span class="badge rounded-pill badge-notification bg-danger">11</span> -->
                  </div>
                  Minha Página
                </a>
              </li>

              <li class="nav-item text-center mx-2 mx-lg-1">
                <a class="nav-link" href="/{{Auth::user()->nickname}}/editor">
                  <div>
                    <i class="fas fa-pen fa-lg mb-1"></i>
                    <!-- <span class="badge rounded-pill badge-notification bg-warning">11</span> -->
                  </div>
                  Editor
                </a>
              </li>
              @endauth
            </ul>


            <!-- CENTRO: Search -->
            <form class="d-flex my-2" style="width: 300px;">
              <input type="search" class="form-control me-2" placeholder="Search" aria-label="Search" />
              <button class="btn btn-primary" type="submit">Search</button>
            </form>

            <!-- DIREITA: Estatísticas + Notificações + Avatar -->
            <ul class="navbar-nav d-flex flex-row align-items-center mt-3 mt-lg-0">

              @auth
              
              <!-- <li class="nav-item d-flex align-items-center text-center mx-2">
                <div class="d-flex flex-column me-3">
                  <strong class="number text-white">{{ session('count_theme') }}</strong>
                  <small class="number-label text-muted">Temas</small>
                </div>
                <div class="d-flex flex-column me-3">
                  <strong class="number text-white">{{ session('count_followers') }}</strong>
                  <small class="number-label text-muted">Seguidores</small>
                </div>
                <div class="d-flex flex-column">
                  <strong class="number text-white">{{ session('count_following') }}</strong>
                  <small class="number-label text-muted">Seguindo</small>
                </div>
              </li>


              
              <li class="nav-item text-center mx-2 mx-lg-1">
                <a class="nav-link" href="#!">
                  <div>
                    <i class="fas fa-bell fa-lg mb-1"></i>
                    <span class="badge rounded-pill badge-notification bg-info">11</span>
                  </div>
                  Notificações
                </a>
              </li> -->

              <!-- Avatar + Dropdown -->
              <li class="nav-item dropdown ms-2">
                <a class="nav-link dropdown-toggle d-flex align-items-center" href="#" id="navbarDropdownMenuLink"
                  role="button" data-bs-toggle="dropdown" aria-expanded="false">
                  <img src="https://mdbootstrap.com/img/Photos/Avatars/img%20(9).jpg" class="rounded-circle" height="30" alt=""
                    loading="lazy" />
                  {{ Auth::user()->nickname }}
                </a>
                <ul class="dropdown-menu dropdown-menu-end" aria-labelledby="navbarDropdownMenuLink">
                  <li><a class="dropdown-item" href="#">My profile</a></li>
                  <li><a class="dropdown-item" href="#">Settings</a></li>
                  <li>
                    <form method="POST" action="{{ route('logout') }}" class="logout-form">
                      @csrf
                      <x-dropdown-link :href="route('logout')"
                        onclick="event.preventDefault(); this.closest('form').submit();" class="dropdown-item text-dark">
                        {{ __('Log Out') }}
                      </x-dropdown-link>
                    </form>
                  </li>
                </ul>
              </li>
              @endauth

              @guest
              <li class="nav-item dropdown ms-2">
                <a class="nav-link dropdown-toggle d-flex align-items-center" href="#" id="navbarDropdownMenuLink"
                  role="button" data-bs-toggle="dropdown" aria-expanded="false">
                  <img src="default/icon-profile-image.jpg" class="rounded-circle" height="30" alt="" loading="lazy" />
                </a>
                <ul class="dropdown-menu dropdown-menu-end" aria-labelledby="navbarDropdownMenuLink">
                  <li><a class="dropdown-item" href="{{ route('login') }}">Login</a></li>
                  <li><a class="dropdown-item" href="{{ route('register') }}">Cadastrar</a></li>
                </ul>
              </li>
              @endguest

            </ul>


          </div>
        </div>

        <!-- Collapsible wrapper -->
      </div>
      <!-- Container wrapper -->
    </nav>
    <!-- Navbar -->
  </header>
  <!-- Navbar -->



  <main>
    <div class="site-section">
      <div class="container">
        <div class="row justify-content-center">

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

        </div>
      </div>
    </div>
  </main>






  {{-- JS Bootstrap --}}
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>
  <script>
    const textarea = document.getElementById("autoTextarea");
    if (textarea) {
      textarea.addEventListener("input", () => {
        textarea.style.height = "auto";
        textarea.style.height = textarea.scrollHeight + "px";
      });
    }
  </script>


  <!-- Jquery needed -->
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>

  <!-- Function used to shrink nav bar removing paddings and adding black background -->
  <script>
    $(window).scroll(function() {
      if ($(document).scrollTop() > 50) {
        $('.nav').addClass('affix');
        console.log("OK");
      } else {
        $('.nav').removeClass('affix');
      }
    });
  </script>


  <script src="js/jquery-3.3.1.min.js"></script>
  <script src="js/popper.min.js"></script>
  <script src="js/bootstrap.min.js"></script>
  <script src="js/main.js"></script>





</body>


</html>