  <aside class="sidebar">
    <div class="toggle">
      <a href="#" class="burger js-menu-toggle" data-toggle="collapse" data-target="#main-navbar">
        <span></span>
      </a>
    </div>

    @auth
    <div class="side-inner">

      <div class="profile">
        <img src="default/icon-profile-image.jpg" alt="Image" class="img-fluid">


        <h3 class="name">{{Auth::user()->name}}</h3>
        <span class="country">{{Auth::user()->nickname}}</span>
      </div>

      <div class="counter d-flex justify-content-center">
        <!-- <div class="row justify-content-center"> -->
        <div class="col">
          <strong class="number">{{session('count_theme')}}</strong>
          <span class="number-label">Temas</span>
        </div>
        <div class="col">
          <strong class="number">{{session('count_followers')}}</strong>
          <span class="number-label">Seguidores</span>
        </div>
        <div class="col">
          <strong class="number">{{session('count_following')}}</strong>
          <span class="number-label">Seguindo</span>
        </div>
        <!-- </div> -->
      </div>

      <div class="nav-menu">
        <ul>
          <li class="{{ request()->url() == url('/') ? 'active' : '' }}"><a href="/"><span class="icon-home mr-3"></span>Feed</a></li>
          <li class="{{ request()->url() == url('/').'/'.Auth::user()->nickname ? 'active' : '' }}"><a href="/{{Auth::user()->nickname}}"><span class="icon-home mr-3"></span>Minha Página</a></li>
          <!-- <li><a href="#"><span class="icon-search2 mr-3"></span>Explore</a></li>
          <li><a href="#"><span class="icon-notifications mr-3"></span>Notifications</a></li>
          <li><a href="#"><span class="icon-location-arrow mr-3"></span>Direct</a></li> -->
          <li class="{{ request()->url() == url('/').'/'.Auth::user()->nickname.'/editor' ? 'active' : '' }}"><a href="/{{Auth::user()->nickname}}/editor"><span class="icon-pie-chart mr-3"></span>Editor</a></li>
          <form method="POST" action="{{ route('logout') }}" class="logout-form">
            @csrf
            <li><a href=href="route('logout')" onclick="event.preventDefault(); this.closest('form').submit();"><span class="icon-sign-out mr-3"></span>Log Out</a></li>
          </form>

        </ul>
      </div>
    </div>
    @endauth
    @guest


    <div class="side-inner">

      <div class="profile">
        <img src="default/icon-profile-image.jpg" alt="Image" class="img-fluid">


        <h3 class="name">Guest</h3>
      </div>

      <div class="nav-menu">
        <ul>
          <li class="active"><a href="/"><span class="icon-home mr-3"></span>Feed</a></li>
          <!-- <li><a href="#"><span class="icon-search2 mr-3"></span>Explore</a></li>
          <li><a href="#"><span class="icon-notifications mr-3"></span>Notifications</a></li>
          <li><a href="#"><span class="icon-location-arrow mr-3"></span>Direct</a></li>
          <li><a href="#"><span class="icon-pie-chart mr-3"></span>Stats</a></li> -->
          <li><a href="{{ route('login') }}"><span class=" icon-sign-out mr-3"></span>Login</a></li>
          <li><a href="{{ route('register') }}"><span class="icon-sign-out mr-3"></span>Cadastrar</a></li>

        </ul>
      </div>
    </div>

    @endguest


  </aside>

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