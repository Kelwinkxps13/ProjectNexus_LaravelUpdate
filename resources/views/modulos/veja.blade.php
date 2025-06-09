{{--
    Importação inicial do projeto.
    Serve pra pegar o layout da página principal, e aplicar em cada view em que será extendido.
--}}
@extends('layouts.main')
@section('title', 'Sobre '.$item->name)
@section('content')

<!-- forma padrao de um bloco, com titulo, texto e imagem -->
<!-- ideia do leandro: ir alternando onde a imagem fica, uma vez na esquerda, outra na direita -->
<div class="container-fluid my-4">


    {{--$_COOKIE
        Caso não tenha conteúdo para ser mostrado
    --}}
    @if ($db_url->isEmpty())

    {{--$_COOKIE
        Verifica se o usuário NÃO está logado
    --}}
    @if (!Auth::check())
    <h4 class="text-center">Sem conteúdos para mostrar</h4>

    {{--$_COOKIE
        Caso NÃO seja o criador
    --}}
    @elseif (Auth::user()->nickname != $nickname)
    <h4 class="text-center">Sem conteúdos para mostrar</h4>

    {{--$_COOKIE
        Caso seja o criador
    --}}
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

    {{--$_COOKIE
        Caso tenha imagem naquele bloco de conteúdo.

        se tiver, o texto ficará um pouco para o lado, enquando a imagem fica do lado.
        Caso não tenha, o texto ocupará a tela inteira.
    --}}
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
    {{--$_COOKIE
        Verifica se tem um usuário logado, e se tiver, verifica também se ele é o usuário criador
    --}}
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

        {{---

            Comentários dos usuários ficarão aqui 

            os comentários terão uma hierarquia:

            comentário > resposta > réplica

            consideremos os níveis:

            0 > 1 > 2

            ---}}

        {{--$_COOKIE
            Adicionar um comentário
        --}}
        @if (Auth::check())
        <form action="{{route('add_comment_0', ['nickname' => $nickname, 'category_name_slug' => $category_name_slug, 'item_name_slug' => $item_name_slug])}}" method="post">
            <div class="col">
                <textarea id="autoTextarea" name="text" class="form-control custom-input" placeholder="Digite aqui..." rows="1" style="overflow:hidden; resize: none;"></textarea>

                <div class="d-flex flex-row-reverse">
                    <button class="btn custom-btn" type="submit">Comentar</button>
                </div>
            </div>
        </form>
        @endif


        {{--$_COOKIE
            Ver os comentários
        --}}
        @if (isset($comments))

        @endif



    </div>





    @endif

</div>
@endsection