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
<h4 class="text-center">Olá, {{Auth::user()->nickname}}!</h4>
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



<div class="container">
    <div class="row">
        <div class="col">
            <h3 class="text-center mt-5">Feed</h3>
            @if (Auth::check())
            @if ($is_following == 'following')
            <h3 class="text-center mt-4">Veja suas ultimas atualizações!</h3>
            @foreach ($themes as $f)
            <div class="card mb-4 shadow-sm">

                <!-- Banner de Fundo -->
                <div class="banner {{($f->image === null)?'no-image':''}} %>">
                    @if($f->image !==null)
                    <img src="/images/{{$f->user_nickname}}/categories/banners/{{$f->image}}" alt="Profile">
                    @endif
                    <div class="overlay">
                        <h4 class="card-title text-white title">
                            {{$f->name}} <br>
                            feito por {{$f->user_nickname}}
                        </h4>
                        <div>
                            <form action="{{ route('category_index', ['nickname' => $f->user_nickname, 'category_name_slug' => $f->name_slug]) }}" method="get">
                                <button type="submit" class="btn btn-dark">
                                    Ver Tema
                                </button>
                            </form>
                            <form action="{{ route('user_index', ['nickname' => $f->user_nickname]) }}" method="get">
                                <button type="submit" class="btn btn-dark">
                                    Ver usuário
                                </button>
                            </form>
                        </div>
                    </div>
                </div>
            </div>
            @endforeach
            @else
            <h4 class="text-center mt-5">Boas Vindas!</h4>

            <h3 class="text-center mt-4">Descubra mais!</h3>
            @foreach ($suggestion as $f)
            <div class="card mb-4 shadow-sm">

                <!-- Banner de Fundo -->
                <div class="banner {{($f->image === null)?'no-image':''}} %>">
                    @if($f->image !==null)
                    <img src="/images/{{$f->user_nickname}}/categories/banners/{{$f->image}}" alt="Profile">
                    @endif
                    <div class="overlay">
                        <h4 class="card-title text-white title">
                            {{$f->name}}
                        </h4>
                        <div>
                            <form action="{{ route('category_index', ['nickname' => $f->user_nickname, 'category_name_slug' => $f->name_slug]) }}" method="get">
                                <button type="submit" class="btn btn-dark">
                                    Ver Tema
                                </button>
                            </form>
                        </div>
                    </div>
                </div>
            </div>
            @endforeach
            @endif
            @else
            <h4 class="text-center my-5">Boas Vindas!</h4>

            <h3 class="text-center mt-4">Descubra mais!</h3>
            @foreach ($suggestion as $f)
            <div class="card mb-4 shadow-sm">

                <!-- Banner de Fundo -->
                <div class="banner {{($f->image === null)?'no-image':''}} %>">
                    @if($f->image !==null)
                    <img src="/images/{{$f->user_nickname}}/categories/banners/{{$f->image}}" alt="Profile">
                    @endif
                    <div class="overlay">
                        <h4 class="card-title text-white title">
                            {{$f->name}}
                        </h4>
                        <div>
                            <form action="{{ route('category_index', ['nickname' => $f->user_nickname, 'category_name_slug' => $f->name_slug]) }}" method="get">
                                <button type="submit" class="btn btn-dark">
                                    Ver Tema
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

<div class="row mt-5">
    <div class="col">
        

        {{--
            Se tiverem usuários criadores a serem mostrados
        --}}
        @if (!$users_foreach->isEmpty())
        <h2 class="mb-3">Veja os ultimos 10 usuarios Criadores!</h2>

        {{--
            Foreach desses usuários
        --}}
        @foreach ($users_foreach as $f)

        <h4>
            <a href="{{route('user_index', ['nickname' => $f->user_nickname]) }}"> Usuário - {{$f->user_nickname}}</a>
        </h4>

        @endforeach

        {{--
            Caso não tenham usuários criados ainda
        --}}
        @else

        <h4 class="text-center">Ainda sem usuarios criadores</h4>

        @endif





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