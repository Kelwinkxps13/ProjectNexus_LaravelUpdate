@extends('layouts.main')
@section('title', 'Página Inicial')
@section('content')
<h5 class="mb-5">Dica: Dê uma olhadinha no <a href="/editor">editor</a> para ter acesso a personalização de suas coisas!</h5>

<div class="text-center">
    <h3 class="display-4 fw-bold">
        {{$db_main->title}} 👋
    </h3>
    <h3 class="lead">
        {{$db_main->subtitle}}
    </h3>
</div>

<div class="mt-5 mb-5">
    <p class="lead">
        {{$db_main->description}}
    </p>
</div>

@if($final_verification)
<br>
<br>
<div class="text-center mb-4 my-4">
    <h4 class="mb-4 my-4">Não tem nenhuma categoria? Adicione alguma!</h4>
    <form action="/theme/create" method="get">
        <button type="submit" class="btn btn-outline-primary">
            Adicionar Nova Categoria
        </button>
    </form>
</div>
@else
<div class="row mt-5">
    <div class="col">
        <h2 class="mb-3">Suas Categorias</h2>

        @foreach ($themes_foreach as $f)
        @if ($f->is_deleted==false)
        <div class="card mb-4 shadow-sm">
            <!-- Banner de Fundo -->
            <div class="banner {{ $f->image === null ? 'no-image' : '' }}">
                @if ($f->image !== null)
                <img src="{{ $f->image }}" alt="Profile">
                @endif
                <div class="overlay">
                    <h4 class="card-title text-white title">
                        {{$f->title}}
                    </h4>
                    <div>
                        <form action="/theme/show/{{$f->id}}" method="get">
                            <button type="submit" class="btn btn-dark">
                                Ver Categoria
                            </button>
                        </form>
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



        @endif
        @endforeach
        @endif
        @endsection