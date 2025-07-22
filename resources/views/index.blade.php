{{--
    Importação inicial do projeto.
    Serve pra pegar o layout da página principal, e aplicar em cada view em que será extendido.
--}}
@extends('layouts.main')
@section('title', 'Página Inicial')
@section('content')

{{--
    Caso o usuário não esteja autenticado
--}}
@guest
<h4 class="text-center">Olá, Visitante!</h4>
@endguest
{{--
    Caso o usuário esteja autenticado
--}}
@auth
{{--$_COOKIE
    nada acontece, mas antes aparecia "Ola, usuario tal!" 
    ninguem liga pra voce!
--}}
@endauth

{{--$_COOKIE
    Aqui vou separar a parte para fazer o pequeno sistema de Feed de cada usuário

    Sistema simples.

    o que vai ter?
    - Cada usuário vai ter um feed personalizado;
    - Aparecerá os ultímos conteúdos adicionados por cada criador que o usuário segue (em ordem decrescente de data);
    - Quando acabar os novos conteúdos, o feed começará a mostrar conteúdos sugeridos de outros criadores.
        Como talvez funcione essa sugestão?
        - o sistema pegará palavras chave dos criadores que o usuário segue, para aplicar em outros usuários, para
        tentar mostrar conteúdos semelhantes (se por possivel implementar isso)

    Caso o usuário não siga ninguém, será mostrado um feed inicial de boas-vindas
    O que vai ter nesse feed inicial?
    - Os Ultimos 10 conteúdos adicionados de criadores;
    - Sugestões para seguir alguns criadores;
    - Sugestão para o próprio usuário começar a criar seus conteúdos
--}}

{{--$_COOKIE

    IF o usuário segue pelo menos um:
    senao segue ninguem

--}}



<div class="container my-5">
    <div class="row justify-content-center">
        <div class="col-lg-10">

            <h3 class="text-center text-primary mb-4">
                <i class="fas fa-rss me-2"></i>Feed
            </h3>

            @if (Auth::check())
            @if ($is_following == 'following')
            <h4 class="text-center text-success mb-4">
                <i class="fas fa-bolt me-2"></i>Veja suas últimas atualizações!
            </h4>

            @foreach ($themes as $f)
            <div class="card border-0 rounded-4 shadow mb-4">
                <div class="banner">
                    {{-- NÃO ALTERADO --}}
                    @if($f->image !== null)
                    <img src="/images/{{$f->user_nickname}}/categories/banners/{{$f->image}}" alt="Profile">
                    @else
                    <img src="/default/banner-default.jpg" alt="Profile">
                    @endif
                    <div class="overlay">
                        <h4 class="card-title text-white title">
                            {{$f->name}} <br>
                            feito por {{$f->user_nickname}}
                        </h4>
                        <div class="float-end">
                            <form action="{{ route('category_index', ['nickname' => $f->user_nickname, 'category_name_slug' => $f->name_slug]) }}" method="get" class="d-inline">
                                <button type="submit" class="btn btn-outline-light btn-sm me-1">
                                    <i class="fas fa-eye me-1"></i>Ver Tema
                                </button>
                            </form>
                            <form action="{{ route('user_index', ['nickname' => $f->user_nickname]) }}" method="get" class="d-inline">
                                <button type="submit" class="btn btn-outline-light btn-sm">
                                    <i class="fas fa-user me-1"></i>Ver usuário
                                </button>
                            </form>
                        </div>
                    </div>
                </div>
            </div>
            @endforeach

            @if (count($suggestion) > 0)
            <hr class="my-4">
            <h4 class="text-center text-info mb-4">
                <i class="fas fa-lightbulb me-2"></i>Veja sugestões de outros conteúdos!
            </h4>

            @foreach ($suggestion as $f)
            <div class="col-md-12 mb-4">
                <div class="card border-0 rounded-4 shadow">
                    <div class="banner">
                        @if($f->image !== null)
                        <img src="/images/{{$f->user_nickname}}/categories/banners/{{$f->image}}" alt="Profile">
                        @else
                        <img src="/default/banner-default.jpg" alt="Profile">
                        @endif
                        <div class="overlay d-flex justify-content-between align-items-center px-4">
                            <div>
                                <h4 class="card-title text-white title mb-1">
                                    {{$f->name}}
                                </h4>
                                <small class="text-white-50">feito por {{$f->user_nickname}}</small>
                            </div>
                            <div class="float-end">
                                <form action="{{ route('category_index', ['nickname' => $f->user_nickname, 'category_name_slug' => $f->name_slug]) }}" method="get" class="d-inline">
                                    <button type="submit" class="btn btn-outline-light btn-sm me-1">
                                        <i class="fas fa-eye me-1"></i>Ver Tema
                                    </button>
                                </form>
                                <form action="{{ route('user_index', ['nickname' => $f->user_nickname]) }}" method="get" class="d-inline">
                                    <button type="submit" class="btn btn-outline-light btn-sm">
                                        <i class="fas fa-user me-1"></i>Ver usuário
                                    </button>
                                </form>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            @endforeach
            @else
            <h4 class="text-center text-secondary mt-4">
                <i class="fas fa-info-circle me-2"></i>Sem sugestões de mais conteúdos!
            </h4>
            @endif

            @else
            <h4 class="text-center mt-5 text-primary"><i class="fas fa-hand-sparkles me-2"></i>Boas Vindas!</h4>
            <h4 class="text-center text-secondary mb-4"><i class="fas fa-search me-2"></i>Descubra mais!</h4>

            @foreach ($suggestion as $f)
            <div class="card border-0 rounded-4 shadow mb-4">
                <div class="banner">
                    {{-- NÃO ALTERADO --}}
                    @if($f->image !== null)
                    <img src="/images/{{$f->user_nickname}}/categories/banners/{{$f->image}}" alt="Profile">
                    @else
                    <img src="/default/banner-default.jpg" alt="Profile">
                    @endif
                    <div class="overlay">
                        <h4 class="card-title text-white title">
                            {{$f->name}} <br>
                            feito por {{$f->user_nickname}}
                        </h4>
                        <div>
                            <form action="{{ route('category_index', ['nickname' => $f->user_nickname, 'category_name_slug' => $f->name_slug]) }}" method="get" class="d-inline">
                                <button type="submit" class="btn btn-outline-light btn-sm me-1">
                                    <i class="fas fa-eye me-1"></i>Ver Tema
                                </button>
                            </form>
                            <form action="{{ route('user_index', ['nickname' => $f->user_nickname]) }}" method="get" class="d-inline">
                                <button type="submit" class="btn btn-outline-light btn-sm">
                                    <i class="fas fa-user me-1"></i>Ver usuário
                                </button>
                            </form>
                        </div>
                    </div>
                </div>
            </div>
            @endforeach
            @endif
            @else
            <h4 class="text-center text-primary my-5">
                <i class="fas fa-door-open me-2"></i>Boas Vindas!
            </h4>

            <h4 class="text-center text-secondary mb-4">
                <i class="fas fa-compass me-2"></i>Descubra mais!
            </h4>

            @foreach ($suggestion as $f)
            <div class="card border-0 rounded-4 shadow mb-4">
                <div class="banner">
                    {{-- NÃO ALTERADO --}}
                    @if($f->image !== null)
                    <img src="/images/{{$f->user_nickname}}/categories/banners/{{$f->image}}" alt="Profile">
                    @else
                    <img src="/default/banner-default.jpg" alt="Profile">
                    @endif
                    <div class="overlay">
                        <h4 class="card-title text-white title">
                            {{$f->name}} <br>
                            feito por {{$f->user_nickname}}
                        </h4>
                        <div>
                            <form action="{{ route('category_index', ['nickname' => $f->user_nickname, 'category_name_slug' => $f->name_slug]) }}" method="get" class="d-inline">
                                <button type="submit" class="btn btn-outline-light btn-sm me-1">
                                    <i class="fas fa-eye me-1"></i>Ver Tema
                                </button>
                            </form>
                            <form action="{{ route('user_index', ['nickname' => $f->user_nickname]) }}" method="get" class="d-inline">
                                <button type="submit" class="btn btn-outline-light btn-sm">
                                    <i class="fas fa-user me-1"></i>Ver usuário
                                </button>
                            </form>
                        </div>
                    </div>
                </div>
            </div>
            @endforeach
            @endif
        </div>
    </div>
</div>



<div class="container">
    {{-- Verifica se existem usuários criadores --}}
    @if (!$users_foreach->isEmpty())
    <h2 class="mb-4 text-center">Descubra mais criadores!</h2>

    <div class="row row-cols-1 row-cols-md-2 row-cols-lg-3 g-4">
        {{-- Loop para exibir os usuários criadores --}}
        @foreach ($users_foreach as $f)
        <div class="col">
            <div class="card shadow-sm rounded-3 border-0">
                <div class="card-body">
                    <h5 class="card-title d-flex align-items-center">
                        <i class="fa-solid fa-user-circle me-3 text-primary"></i>
                        <a href="{{ route('user_index', ['nickname' => $f->user_nickname]) }}" class="text-decoration-none text-dark fw-bold fs-4">
                            {{ '@'.$f->user_nickname }}
                        </a>
                    </h5>
                    <p class="card-text text-muted">Criador de temas, ideias e conteúdo inovador!</p>
                </div>
            </div>
        </div>
        @endforeach
    </div>
    @else
    <h4 class="text-center text-danger mt-4">Ainda não há usuários criadores disponíveis.</h4>
    @endif
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

@endsection