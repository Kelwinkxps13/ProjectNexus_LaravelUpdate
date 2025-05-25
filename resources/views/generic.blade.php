@extends('layouts.main')
@section('title', 'Tema '.$db_theme->name.' de '.$nickname)
@section('content')

<h2 class="text-center my-3">
    {{$db_theme->name}}
</h2>

<div class="mt-4 text-center">
    <p>
        {{$db_theme->description}}
    </p>
</div>

<div class="container">





@if ($db_url->isEmpty())

    @if (!Auth::check())
    <h4 class="text-center"> Tema sem nada para mostrar</h2>
    @elseif (Auth::user()->nickname != $nickname)
    <h4 class="text-center"> Tema sem nada para mostrar</h2>
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
    
@else
<div class="row row-cols-1 row-cols-md-3 g-4">
        @foreach ($db_url as $f)
        <div class="col-4 my-3">
            <div class="card" style="width: 18rem;">
                <div class="d-flex align-items-center justify-content-center bg-secondary"
                    style="width: 286px; height: 286px; overflow: hidden;">
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
                </div>
            </div>

        </div>
        @endforeach

    </div>
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

@endsection