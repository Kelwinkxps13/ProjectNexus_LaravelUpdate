@extends('layouts.main')
@section('title', 'Página Inicial')
@section('content')

@guest
<h4 class="text-center">Olá, Visitante!</h4>
@endguest
@auth
<h4 class="text-center">Olá, {{Auth::user()->name}}!</h4>
@endauth


<div class="row mt-5">
    <div class="col">
        <h2 class="mb-3">Veja categorias criadas pela comunidade!</h2>

        @if (!$themes_foreach->isEmpty())

        @foreach ($themes_foreach as $f)
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
        @endforeach

        @else

        <h4 class="text-center">Ainda sem categorias criadas pela comunidade</h4>

        @endif


        @endsection