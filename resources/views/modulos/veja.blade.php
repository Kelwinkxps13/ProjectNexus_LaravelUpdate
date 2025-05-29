@extends('layouts.main')
@section('title', 'Sobre '.$item->name)
@section('content')

<!-- forma padrao de um bloco, com titulo, texto e imagem -->
<!-- ideia do leandro: ir alternando onde a imagem fica, uma vez na esquerda, outra na direita -->
<div class="container-fluid my-4">



    @if ($db_url->isEmpty())

    @if (!Auth::check())
    <h4 class="text-center">Sem conteúdos para mostrar</h4>
    @elseif (Auth::user()->nickname != $nickname)
    <h4 class="text-center">Sem conteúdos para mostrar</h4>
    @else
    <h2 class="text-center text-dark">Não tem nenhum Conteúdo? Adicione algum!</h2>
    <div class="row mt-4">
        <div class="col text-end">
            <form action="{{route('content_create', ['nickname' => $nickname, 'category_name_slug' => $category_name_slug, 'item_name_slug' => $item_name_slug])}}" method="get">
                @csrf
                <button type="submit" class="btn btn-outline-primary">Adicionar Novo Bloco de Conteúdo</button>
            </form>
        </div>
    </div>
    @endif

    @else

    @foreach ($db_url as $f)

    @if ($f->image)
    <div class="row mb-4 my-4">
        <div class="col-md-9 d-flex flex-column justify-content-center text-break">
            <h2 class="text-center text-dark">
                {{$f->name}}
            </h2>
            @php
            $paragraphs = preg_split('/\r\n|\n|\r/', $f->description);
            @endphp

            @foreach($paragraphs as $paragraph)
            <p class="text-center text-dark">
                {{ $paragraph }}
            </p>
            @endforeach
        </div>
        <div class="col-md-3 d-flex align-items-center justify-content-center bg-light"
            style="max-width: 286px; max-height: 286px; overflow: hidden;">
            <img src="/images/{{$nickname}}/categories/{{$id}}/item/{{$f->item_id}}/{{$f->image}}" alt="Profile" class="img-fluid"
                style="object-fit: cover;">
        </div>
    </div>
    @else
    <div class="row mb-4 my-4">
        <div class="col-md-12 d-flex flex-column justify-content-center text-break">
            <h2 class="text-center text-dark">
                {{$f->name}}
            </h2>
            @php
            $paragraphs = preg_split('/\r\n|\n|\r/', $f->description);
            @endphp

            @foreach($paragraphs as $paragraph)
            <p class="text-center text-dark">
                {{ $paragraph }}
            </p>
            @endforeach
        </div>
    </div>
    @endif
    @endforeach
    @if (Auth::check() && Auth::user()->nickname == $nickname)
    <div class="d-flex justify-content-center gap-3 float-end my-4">
        <a href="{{route('item_editor', ['nickname' => $nickname, 'category_name_slug' => $category_name_slug, 'item_name_slug' => $item_name_slug])}}"
            class="btn btn-outline-primary">Editor</a>
        <form action="{{route('content_create', ['nickname' => $nickname, 'category_name_slug' => $category_name_slug, 'item_name_slug' => $item_name_slug])}}" method="get">
            @csrf
            <button type="submit" class="btn btn-outline-primary">Adicionar
                Novo Conteúdo</button>
        </form>
    </div>
    @endif


    {{---

        Area reservada para fazer o sistema de comentarios.
        dentro do primeiro IF, ou seja, precisa ter conteudo no item para alguem poder comentar sobre.
    
    ---}}


    <div class="container my-5">
        <h4 class="text-center">
            Seção de Comentários
        </h4>

        <form action="" method="post">
            <div class="col">
                <textarea id="autoTextarea" class="form-control custom-input" placeholder="Digite aqui..." rows="1" style="overflow:hidden; resize: none;"></textarea>

                <div class="d-flex flex-row-reverse">
                    <button class="btn custom-btn" type="submit">Comentar</button>
                </div>
            </div>
        </form>

        {{---
            
            Comentários dos usuários ficarão aqui 
            
            ---}}



    </div>





    @endif

</div>
@endsection