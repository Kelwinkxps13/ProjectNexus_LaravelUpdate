{{--
    Importação inicial do projeto.
    Serve pra pegar o layout da página principal, e aplicar em cada view em que será extendido.
--}}
@extends('layouts.main')
@section('title', 'Tema '.$db_theme->name.' de '.$nickname)
@section('content')

<form action="{{ route('user_index', ['nickname' => $nickname]) }}" method="get">
    <button type="submit" class="btn btn-dark">
        Voltar pra página do usuário
    </button>
</form>

{{--
    Dados do tema atual
--}}
<h2 class="text-center my-3">
    {{$db_theme->name}}
</h2>

<div class="mt-4 text-center">
    <p>
        {{$db_theme->description}}
    </p>
</div>


<div class="container">


    {{--
        Caso não tenha Itens a serem mostrados
    --}}
    @if ($db_url->isEmpty())

    {{--
            Caso o usuário não esteja logado
        --}}
    @if (!Auth::check())
    <h2 class="text-center"> Tema sem nada para mostrar</h2>

    {{--
            Caso tenha um usuário logado, mas não seja o criador
        --}}
    @elseif (Auth::user()->nickname != $nickname)
    <h2 class="text-center"> Tema sem nada para mostrar</h2>

    {{--
            Caso seja o usuário criador
        --}}
    @else
    <h2 class="text-center"> Não há nada para mostrar? Adicione algo!</h2>

    <div class="row mt-4">
        <div class="col">
            <form action="{{route('item_create', ['nickname' => $nickname, 'category_name_slug' => $category_name_slug])}}" method="get">
                @csrf
                <button type="submit" class="btn btn-outline-primary float-end">
                    Adicionar
                </button>
            </form>
        </div>
    </div>
    @endif

    {{--
        Caso tenha Itens a serem mostrados
    --}}
    @else
    <div class="row row-cols-1 row-cols-md-3 g-4">
        {{--
                        foreach do itens que serâo mostrados
                    --}}
        @foreach ($db_url as $f)
        <div class="col-4 my-3">
            <div class="card" style="width: 18rem;">
                <div class="d-flex align-items-center justify-content-center bg-secondary"
                    style="width: 286px; height: 286px; overflow: hidden;">
                    {{--
                                    Verifica se aquele item tem alguma imagem, caso tenha,
                                    será mostrada no banner.
                                --}}
                    @if($f->image===null)
                    <img src="/default/no image.png" alt="Profile"
                        style="width: 100%; height: 100%; object-fit: cover;">
                    @else
                    <img src="/images/{{$nickname}}/categories/{{$f->category_id}}/items/{{ $f->image }}" alt="Profile"
                        style="width: 100%; height: 100%; object-fit: cover;">
                    @endif
                </div>
                <div class="card-body">
                    <h5 class="card-title">
                        {{ $f->name }}
                    </h5>
                    <p class="card-text">
                        {{ $f->description }}
                    </p>
                    <div class="d-flex justify-content-center gap-3">
                        <a href="{{route('item_index', ['nickname' => $nickname, 'category_name_slug' => $category_name_slug, 'item_name_slug' => $f->name_slug])}}" class="btn btn-primary">Veja!</a>

                        {{--
                                        Caso tenha um usuário logado, e se esse usuário for o criador da página
                                    --}}
                        @if(Auth::check())
                        @if (Auth::user()->nickname == $nickname)
                        <form action="{{route('item_edit', ['nickname' => $nickname, 'category_name_slug' => $category_name_slug, 'item_name_slug' => $f->name_slug])}}" method="get">
                            @csrf
                            <button type="submit" class="btn btn-warning">Editar</button>
                        </form>
                        <form action="{{route('item_destroy', ['nickname' => $nickname, 'category_name_slug' => $category_name_slug])}}" method="post">
                            @csrf
                            @method('DELETE')
                            <input type="hidden" name="item_name_slug" value="{{$f->name_slug}}">
                            <button type="submit" class="btn btn-danger">Excluir</button>
                        </form>


                        @endif
                        @endif
                    </div>
                    <!-- <label for="">Likes: {{ count($f->likes) }} Dislikes: {{count($f->dislikes)}}</label><br> -->
                    {{--
                                    Verifica se o usuário está logado
                                --}}
                    @if (Auth::check())
                    {{---

                                    like_type:
                                    0 => nem like nem dislike
                                    1 => deu like
                                    2 => deu dislike
                                    
                                    ---}}
                    {{--
                                    Caso o tipo de like daquele item for 1, ou seja,
                                    não deu like nem dislike, as cores dos botôes serão mostradas
                                    de acordo com o like_type.
                                    Note se essa lógica se aplpica ao resto do ifelse
                                --}}
                    @if ($f->like_type === 1)
                    <div class="d-flex gap-2">
                        <form action="{{route('item_unlike', ['nickname' => $nickname, 'category_name_slug' => $category_name_slug, 'item_name_slug' => $f->name_slug])}}" method="post">
                            @csrf
                            <button type="submit"
                                class="p-2 bg-transparent border-0 outline-none focus:outline-none focus:ring-2 focus:ring-blue-500 rounded-full">

                                <i class="fa-solid fa-thumbs-up text-gray-700 hover:text-blue-600 transition-all duration-200"></i>
                                {{--$_COOKIE
                                            Verifica a quantidade de likes que aquele item em específico tem
                                        --}}
                            </button> {{ count($f->likes) }}
                        </form>
                        <form action="{{route('item_dislike', ['nickname' => $nickname, 'category_name_slug' => $category_name_slug, 'item_name_slug' => $f->name_slug])}}" method="post">
                            @csrf
                            <button type="submit"
                                class="p-2 bg-transparent border-0 outline-none focus:outline-none focus:ring-2 focus:ring-blue-500 rounded-full">
                                <i class="fa-regular fa-thumbs-down text-gray-700 hover:text-blue-600 transition-all duration-200"></i>
                                {{--$_COOKIE
                                            Verifica a quantidade de dislikes que aquele item em especifico tem.
                                        --}}
                            </button> {{ count($f->dislikes) }}
                        </form>
                    </div>
                    @elseif ($f->like_type === 2)
                    <div class="d-flex gap-2">
                        <form action="{{route('item_like', ['nickname' => $nickname, 'category_name_slug' => $category_name_slug, 'item_name_slug' => $f->name_slug])}}" method="post">
                            @csrf
                            <button type="submit"
                                class="p-2 bg-transparent border-0 outline-none focus:outline-none focus:ring-2 focus:ring-blue-500 rounded-full">
                                <i class="fa-regular fa-thumbs-up text-gray-700 hover:text-blue-600 transition-all duration-200"></i>
                            </button> {{ count($f->likes) }}
                        </form>
                        <form action="{{route('item_undislike', ['nickname' => $nickname, 'category_name_slug' => $category_name_slug, 'item_name_slug' => $f->name_slug])}}" method="post">
                            @csrf
                            <button type="submit"
                                class="p-2 bg-transparent border-0 outline-none focus:outline-none focus:ring-2 focus:ring-blue-500 rounded-full">
                                <i class="fa-solid fa-thumbs-down text-gray-700 hover:text-blue-600 transition-all duration-200"></i>
                            </button> {{ count($f->dislikes) }}
                        </form>
                    </div>
                    @else
                    <div class="d-flex gap-2">
                        <form action="{{route('item_like', ['nickname' => $nickname, 'category_name_slug' => $category_name_slug, 'item_name_slug' => $f->name_slug])}}" method="post">
                            @csrf
                            <button type="submit"
                                class="p-2 bg-transparent border-0 outline-none focus:outline-none focus:ring-2 focus:ring-blue-500 rounded-full">
                                <i class="fa-regular fa-thumbs-up text-gray-700 hover:text-blue-600 transition-all duration-200"></i>
                            </button> {{ count($f->likes) }}
                        </form>
                        <form action="{{route('item_dislike', ['nickname' => $nickname, 'category_name_slug' => $category_name_slug, 'item_name_slug' => $f->name_slug])}}" method="post">
                            @csrf
                            <button type="submit"
                                class="p-2 bg-transparent border-0 outline-none focus:outline-none focus:ring-2 focus:ring-blue-500 rounded-full">
                                <i class="fa-regular fa-thumbs-down text-gray-700 hover:text-blue-600 transition-all duration-200"></i>
                            </button> {{ count($f->dislikes) }}
                        </form>
                    </div>

                    @endif

                    @endif
                </div>
            </div>

        </div>
        @endforeach

    </div>

    {{--$_COOKIE
                    Caso tenha um usuário autenticado, e esse usuário for o dono da página,

                    O sistema mostrará para ele um botão de adicionar um novo item
                --}}
    @if (Auth::check() && Auth::user()->nickname == $nickname)
    <div class="row mt-4">
        <div class="col">
            <form action="{{route('item_create', ['nickname' => $nickname, 'category_name_slug' => $category_name_slug])}}" method="get">
                @csrf
                <button type="submit" class="btn btn-outline-primary float-end">
                    Adicionar
                </button>
            </form>
        </div>
    </div>
    @endif
    @endif

</div>
@endsection