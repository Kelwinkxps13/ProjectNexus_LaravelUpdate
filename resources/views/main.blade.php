{{--
    Importação inicial do projeto.
    Serve pra pegar o layout da página principal, e aplicar em cada view em que será extendido.
--}}

@extends('layouts.main')
@section('title', 'Página Inicial de '.$nickname)
@section('content')

{{--
    Verifica se o usuário está autenticado.
    Em seguida, verifica se o usuário logado é o usuário dono da página
--}}
@if (Auth::check() && Auth::user()->nickname == $nickname)
<h5 class="mb-5">Dica: Dê uma olhadinha no <a href="{{route('user_editor', ['nickname' => $nickname])}}">editor</a> para ter acesso a personalização de suas coisas!</h5>
@endif

{{--
    Verifica se o usuário está autenticado.
    Em seguida, verifica se o usuário logado é o dono da página.
    Em seguida, verifica se o usuário NÃO TEM tela inicial.
--}}
@if (Auth::check() && Auth::user()->nickname == $nickname && !$db_main)

<h4 class="text-center">Você ainda não tem uma tela inicial. Crie uma para começar a compartilhar as coisas de seu interesse!</h4>


<div class="row my-5">
    <div class="d-flex justify-content-center gap-3 float-end my-4">
        {{--
                Formulário para: caso o usuário não tenha página inicial,
                aparecer um botão falando pra ele criá-la
            --}}
        <form action="{{route('user_create', ['nickname' => $nickname])}}" method="get">
            @csrf
            <button type="submit" class="btn btn-outline-primary">
                Criar tela inicial
            </button>
        </form>
    </div>
</div>

{{--
    Caso não tenha Usuário autenticado, e não tenha coisas a serem exibidas.
--}}
@elseif(!$db_main)
<h4 class="text-center">Usuário ainda sem tela inicial</h4>

{{--
    Caso não seja nada acima, os bem vindos da página serão mostrados.
--}}
@else



<div class="container py-5">

    <!-- Header: Nome + Seguir -->
    <div class="d-flex flex-column flex-md-row align-items-center justify-content-between mb-5">
        @if (Auth::check() && Auth::user()->nickname == $nickname)
        <div class="text-center text-md-start">
            <h2 class="fw-bold mb-1">
                Sua página</span>
            </h2>
            <p class="text-muted mb-0">Bem-vindo(a) !</p>
        </div>
        @else
        <div class="text-center text-md-start">
            <h2 class="fw-bold mb-1">
                Página de {{ $nickname }}
            </h2>
            <p class="text-muted mb-0">Bem-vindo(a) ao perfil de {{ $nickname }}!</p>
        </div>
        @endif


        <!-- Botão seguir -->
        @auth
        @if (Auth::user()->nickname != $nickname)
        <div class="mt-3 mt-md-0">
            @if ($is_following)
            <form action="{{ route('unfollow', ['nickname' => $nickname]) }}" method="post">
                @csrf
                <button class="btn btn-outline-danger">
                    <i class="fas fa-user-minus me-2"></i>Deixar de Seguir
                </button>
            </form>
            @else
            <form action="{{ route('follow', ['nickname' => $nickname]) }}" method="post">
                @csrf
                <button class="btn btn-outline-primary">
                    <i class="fas fa-user-plus me-2"></i>Seguir
                </button>
            </form>
            @endif
        </div>
        @endif
        @endauth
    </div>

    <!-- Estatísticas -->
    <div class="row text-center mb-5">
        <div class="col-4">
            <i class="fas fa-book fa-lg text-primary mb-1"></i>
            <h5 class="fw-bold mb-0">{{ count($count_theme) }}</h5>
            <small class="text-muted">Temas</small>
        </div>

        <div class="col-4">
            @auth
            <a href="{{ route('user_followers', ['nickname' => $nickname]) }}" class="text-decoration-none">
                <i class="fas fa-users fa-lg text-success mb-1"></i>
                <h5 class="fw-bold mb-0 text-dark">{{ count($count_followers) }}</h5>
                <small class="text-muted">Seguidores</small>
            </a>
            @endauth
            @guest
            <i class="fas fa-users fa-lg text-success mb-1"></i>
            <h5 class="fw-bold mb-0 text-dark">{{ count($count_followers) }}</h5>
            <small class="text-muted">Seguidores</small>
            @endguest

        </div>

        <div class="col-4">
            @auth
            <a href="{{ route('user_following', ['nickname' => $nickname]) }}" class="text-decoration-none">
                <i class="fas fa-user-friends fa-lg text-warning mb-1"></i>
                <h5 class="fw-bold mb-0 text-dark">{{ count($count_following) }}</h5>
                <small class="text-muted">Seguindo</small>
            </a>
            @endauth
            @guest
            <i class="fas fa-user-friends fa-lg text-warning mb-1"></i>
            <h5 class="fw-bold mb-0 text-dark">{{ count($count_following) }}</h5>
            <small class="text-muted">Seguindo</small>
            @endguest

        </div>
    </div>


    <!-- Nome e subtítulo -->
    <div class="text-center mb-4">
        <h1 class="display-4 fw-bold">{{ $db_main->name }}</h1>
        <p class="lead text-muted fst-italic">{{ $db_main->subtitle }}</p>
    </div>

    <!-- Descrição -->
    <div class="text-center px-3 px-md-5 mt-4">
        <p class="lead text-body-secondary fs-5">
            {{ $db_main->description }}
        </p>
    </div>

</div>





{{--
    Caso tenha conteúdos a serem mostrados daquele usuário
--}}
@if ($themes_foreach->isEmpty())

{{--
        Caso o usuário NÃO esteja autenticado
    --}}
@if (!Auth::check())
<br>
<br>
<div class="text-center mb-4 my-4">
    <h4 class="mb-4 my-4">Usuário Sem Temas!</h4>

</div>

{{--
        Caso o usuário esteja autenticado, e NÃO seja o dono da página
    --}}
@elseif (Auth::user()->nickname != $nickname)
<br>
<br>
<div class="text-center mb-4 my-4">
    <h4 class="mb-4 my-4">Usuário Sem Temas!</h4>

</div>

{{--
        Caso seja o dono da página
    --}}
@else

{{--
            Formulário para adicionar um novo tema a ser discutido
            obs: note que so aparece pro usuário dono da página
        --}}
<br>
<br>
<div class="text-center mb-4 my-4">
    <h4 class="mb-4 my-4">Não tem nenhum Tema a ser discutido? Adicione algum!</h4>
    <form action="{{route('category_create', ['nickname' => $nickname])}}" method="get">
        @csrf
        <button type="submit" class="btn btn-outline-primary">
            Adicionar Novo Tema
        </button>
    </form>
</div>
@endif


{{--
    Caso tenha coisas a serem mostradas.
--}}
@else
<div class="row mt-5">
    <div class="col">
        @if (Auth::check() && Auth::user()->nickname == $nickname)
        <h2 class="mb-3 text-center">Seus Temas</h2>
        @else
        <h2 class="mb-3 text-center">Temas de {{$nickname}}</h2>
        @endif


        {{--
                Foreach dos temas daquele usuário
            --}}

        <div class="container my-5">
            <div class="row justify-content-center">
                <div class="col-lg-10">
                    @foreach ($themes_foreach as $f)
                    <div class="card border-0 rounded-4 shadow mb-4">
                        <!-- Banner de Fundo -->
                        <div class="banner">
                            @if($f->image !== null)
                            <img src="/images/{{$f->user_nickname}}/categories/banners/{{$f->image}}" alt="Profile">
                            @else
                            <img src="/default/banner-default.jpg" alt="Profile">
                            @endif
                            <div class="overlay d-flex justify-content-between align-items-center px-4">
                                <div class="w-100 d-flex justify-content-between align-items-center">
                                    <!-- Esquerda: Título e nome do autor -->
                                    <div class="text-start">
                                        <h4 class="card-title text-white title mb-1">
                                            {{$f->name}}
                                        </h4>
                                        <small class="text-white-50">feito por {{$f->user_nickname}}</small>
                                    </div>

                                    <!-- Direita: Botões -->
                                    <div class="text-end">
                                        <form action="{{ route('category_index', ['nickname' => $f->user_nickname, 'category_name_slug' => $f->name_slug]) }}" method="get" class="d-inline">
                                            <button type="submit" class="btn btn-outline-light btn-sm me-1">
                                                <i class="fas fa-eye me-1"></i>Ver Tema
                                            </button>
                                        </form>
                                    </div>
                                </div>
                            </div>

                        </div>
                    </div>

                    <style>
                        .banner {
                            width: 100%;
                            height: 140px;
                            /* Banner mais fino */
                            overflow: hidden;
                            position: relative;
                            border-radius: 8px;
                            /* Arredondamento opcional */
                            background-color: white;
                            /* Cor de fundo padrão */
                        }

                        .banner img {
                            width: 100%;
                            height: 100%;
                            object-fit: cover;
                            position: absolute;
                            top: 0;
                            left: 0;
                        }

                        .overlay {
                            position: absolute;
                            top: 0;
                            left: 0;
                            width: 100%;
                            height: 100%;
                            display: flex;
                            align-items: center;
                            /* Centraliza verticalmente */
                            justify-content: space-between;
                            /* Mantém o título à esquerda e o botão à direita */
                            padding: 0 20px;
                            background: rgba(0, 0, 0, 0.5);
                            /* Escurece um pouco a imagem */
                            color: white;
                        }

                        .title {
                            margin: 0;
                            font-size: 1.2rem;
                            font-weight: bold;
                            text-shadow: 2px 2px 4px rgba(0, 0, 0, 1);
                            /* Sombra preta forte */
                        }

                        /* Se não houver imagem, o fundo fica branco e o texto preto */
                        .no-image {
                            background-color: #f0f0f0 !important;
                            /* Cinza bem claro */
                        }

                        .no-image .overlay {
                            background: none;
                            /* Remove a camada escura */
                            color: black !important;
                            /* Texto preto */
                            text-shadow: none;
                            /* Remove a sombra do texto */
                        }

                        .btn-dark {
                            background-color: #343a40;
                            /* Cor mais escura */
                            border-color: #23272b;
                        }

                        .btn-dark:hover {
                            background-color: #23272b;
                            /* Ainda mais escuro no hover */
                            border-color: #1d2124;
                        }
                    </style>


                    @endforeach
                </div>
            </div>
        </div>
    </div>
</div>





@endif
@endif
@endsection