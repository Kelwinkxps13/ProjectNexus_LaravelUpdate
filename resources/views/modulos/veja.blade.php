@extends('layouts.main')
@section('title', 'Tela Veja')
@section('content')

<!-- forma padrao de um bloco, com titulo, texto e imagem -->
<!-- ideia do leandro: ir alternando onde a imagem fica, uma vez na esquerda, outra na direita -->
<div class="container-fluid my-4">
    @if ($db_url->isEmpty())
    @if(Auth::user()->nickname == $nickname)
    <h2 class="text-center text-dark">Não tem nenhum Conteúdo? Adicione algum!</h2>
    <div class="row mt-4">
        <div class="col text-end">
            <form action="/{{$nickname}}/{{$category}}/createblock/{{$id_item}}" method="get">
                @csrf
                <button type="submit" class="btn btn-outline-primary">Adicionar Novo Bloco de Conteúdo</button>
            </form>
        </div>
    </div>
    @else
    <h4 class="text-center">Sem conteúdos para mostrar</h4>
    @endif
    @else
    @foreach ($db_url as $f)

    @if ($f->image)
    <div class="row mb-4 my-4">
        <div class="col-md-9 d-flex flex-column justify-content-center text-break">
            <h2 class="text-center text-dark">
                {{$f->title}}
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
            <img src="{{$f->image}}" alt="Profile" class="img-fluid"
                style="object-fit: cover;">
        </div>
    </div>
    @else
    <div class="row mb-4 my-4">
        <div class="col-md-12 d-flex flex-column justify-content-center text-break">
            <h2 class="text-center text-dark">
                {{$f->title}}
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
    <div class="d-flex justify-content-center gap-3 float-end my-4">
        <a href="/theme/{{$id}}/show/{{$id_item}}/editor"
            class="btn btn-outline-primary">Editor</a>
        <form action="/{{$nickname}}/{{$category}}/createblock/{{$id_item}}" method="get">
            @csrf
            <button type="submit" class="btn btn-outline-primary">Adicionar
                Novo Conteúdo</button>
        </form>
    </div>

    @endif
</div>
@endsection