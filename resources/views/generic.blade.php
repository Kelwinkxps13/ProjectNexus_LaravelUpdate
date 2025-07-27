{{--
    Importação inicial do projeto.
    Serve pra pegar o layout da página principal, e aplicar em cada view em que será extendido.
--}}
@extends('layouts.main')
@section('title', 'Tema '.$db_theme->name.' de '.$nickname)
@section('content')

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

    <div class="container-fluid px-0 px-md-3">
        <div class="row row-cols-1 row-cols-sm-2 row-cols-lg-3 row-cols-xl-4 g-4">
            @foreach ($db_url as $f)
            <div class="col mb-4">
                <div class="card h-100 shadow-sm">
                    <!-- Imagem -->
                    <div class="bg-light d-flex align-items-center justify-content-center" style="height: 200px; overflow: hidden;">
                        @if($f->image === null)
                        <img src="/default/no image.png" alt="Profile" class="img-fluid w-100 h-100 object-fit-cover">
                        @else
                        <img src="/images/{{$nickname}}/categories/{{$f->category_id}}/items/{{ $f->image }}" alt="Profile" class="img-fluid w-100 h-100 object-fit-cover">
                        @endif
                    </div>

                    <!-- Corpo do Card -->
                    <div class="card-body d-flex flex-column">
                        <h5 class="card-title">{{ $f->name }}</h5>
                        <p class="card-text text-muted mb-3" style="display: -webkit-box; -webkit-line-clamp: 2; -webkit-box-orient: vertical; overflow: hidden;">{{ $f->description }}</p>

                        <!-- Botões Principais -->
                        <div class="mt-auto">
                            <div class="d-flex justify-content-center flex-wrap gap-2 mb-3">
                                @if(Auth::check() && Auth::user()->nickname == $nickname)
                                <form action="{{ route('item_destroy', ['nickname' => $nickname, 'category_name_slug' => $category_name_slug]) }}" method="post" class="flex-grow-1">
                                    @csrf
                                    @method('DELETE')
                                    <input type="hidden" name="item_name_slug" value="{{ $f->name_slug }}">
                                    <button type="submit" class="btn btn-outline-secondary btn-sm w-100 border text-dark bg-white hover-bg-gray">
                                        <i class="fas fa-trash me-1"></i> Excluir
                                    </button>
                                </form>

                                <form action="{{ route('item_edit', ['nickname' => $nickname, 'category_name_slug' => $category_name_slug, 'item_name_slug' => $f->name_slug]) }}" method="get" class="flex-grow-1">
                                    @csrf
                                    <button type="submit" class="btn btn-outline-secondary btn-sm w-100 border text-dark bg-white hover-bg-gray">
                                        <i class="fas fa-edit me-1"></i> Editar
                                    </button>
                                </form>
                                @endif

                                <a href="{{ route('item_index', ['nickname' => $nickname, 'category_name_slug' => $category_name_slug, 'item_name_slug' => $f->name_slug]) }}" class="btn btn-outline-secondary btn-sm flex-grow-1 border text-dark bg-white hover-bg-gray">
                                    <i class="fas fa-eye me-1"></i> Ver
                                </a>
                            </div>

                            <style>
                                .hover-bg-gray:hover {
                                    background-color: #e9ecef !important;
                                    color: #212529 !important;
                                }

                                .border {
                                    border: 1px solid #dee2e6 !important;
                                }
                            </style>
                            <!-- Likes -->
                            @if (Auth::check())
                            <div class="d-flex justify-content-center gap-2">
                                {{-- LIKE --}}
                                @if ($f->like_type === 1)
                                <form action="{{ route('item_unlike', ['nickname' => $nickname, 'category_name_slug' => $category_name_slug, 'item_name_slug' => $f->name_slug]) }}" method="post" class="flex-grow-1">
                                    @csrf
                                    <button type="submit" class="btn btn-outline-secondary btn-sm w-100 border text-dark bg-white hover-bg-gray">
                                        <i class="fas fa-thumbs-up me-1"></i> {{ count($f->likes) }}
                                    </button>
                                </form>
                                <form action="{{ route('item_dislike', ['nickname' => $nickname, 'category_name_slug' => $category_name_slug, 'item_name_slug' => $f->name_slug]) }}" method="post" class="flex-grow-1">
                                    @csrf
                                    <button type="submit" class="btn btn-outline-secondary btn-sm w-100 border text-dark bg-white hover-bg-gray">
                                        <i class="far fa-thumbs-down me-1"></i> {{ count($f->dislikes) }}
                                    </button>
                                </form>
                                @elseif ($f->like_type === 2)
                                <form action="{{ route('item_like', ['nickname' => $nickname, 'category_name_slug' => $category_name_slug, 'item_name_slug' => $f->name_slug]) }}" method="post" class="flex-grow-1">
                                    @csrf
                                    <button type="submit" class="btn btn-outline-secondary btn-sm w-100 border text-dark bg-white hover-bg-gray">
                                        <i class="far fa-thumbs-up me-1"></i> {{ count($f->likes) }}
                                    </button>
                                </form>
                                <form action="{{ route('item_undislike', ['nickname' => $nickname, 'category_name_slug' => $category_name_slug, 'item_name_slug' => $f->name_slug]) }}" method="post" class="flex-grow-1">
                                    @csrf
                                    <button type="submit" class="btn btn-outline-secondary btn-sm w-100 border text-dark bg-white hover-bg-gray">
                                        <i class="fas fa-thumbs-down me-1"></i> {{ count($f->dislikes) }}
                                    </button>
                                </form>
                                @else
                                <form action="{{ route('item_like', ['nickname' => $nickname, 'category_name_slug' => $category_name_slug, 'item_name_slug' => $f->name_slug]) }}" method="post" class="flex-grow-1">
                                    @csrf
                                    <button type="submit" class="btn btn-outline-secondary btn-sm w-100 border text-dark bg-white hover-bg-gray">
                                        <i class="far fa-thumbs-up me-1"></i> {{ count($f->likes) }}
                                    </button>
                                </form>
                                <form action="{{ route('item_dislike', ['nickname' => $nickname, 'category_name_slug' => $category_name_slug, 'item_name_slug' => $f->name_slug]) }}" method="post" class="flex-grow-1">
                                    @csrf
                                    <button type="submit" class="btn btn-outline-secondary btn-sm w-100 border text-dark bg-white hover-bg-gray">
                                        <i class="far fa-thumbs-down me-1"></i> {{ count($f->dislikes) }}
                                    </button>
                                </form>
                                @endif
                            </div>
                            @endif
                        </div>
                    </div>
                </div>
            </div>
            @endforeach
        </div>
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