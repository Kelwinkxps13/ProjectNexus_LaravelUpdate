@extends('layouts.main')
@section('title', 'Criar Tela Inicial')
@section('content')

<h2 class="text-center my-3">
    {{$db_theme->title}}
</h2>

<div class="mt-4 text-center">
    <p>
        {{$db_theme->description}}
    </p>
</div>

<div class="container">
    @if ($final_verification)
    @if(Auth::user()->nickname == $nickname)
    <h2 class="text-center"> Não há nada para mostrar? Adicione algo!</h2>

    <div class="row mt-4">
        <div class="col">
            <form action="/{{$nickname}}/category/create" method="get">
                @csrf
                <button type="submit" class="btn btn-outline-primary float-end">
                    Adicionar
                </button>
            </form>
        </div>
    </div>
    @else
    <h4 class="text-center"> Categoria sem nada para mostrar</h2>
    @endif
    @else
    <div class="row row-cols-1 row-cols-md-3 g-4">
        @foreach ($db_url as $f)
        @ if($f->is_deleted===false)
        <div class="col-4 my-3">
            <div class="card" style="width: 18rem;">
                <div class="d-flex align-items-center justify-content-center bg-secondary"
                    style="width: 286px; height: 286px; overflow: hidden;">
                    @ if($f->image===null)
                    <img src="/images/no image.png" alt="Profile"
                        style="width: 100%; height: 100%; object-fit: cover;">
                    @else
                    <img src="{{ $f->image }}" alt="Profile"
                        style="width: 100%; height: 100%; object-fit: cover;">
                    @endif
                </div>
                <div class="card-body">
                    <h5 class="card-title">
                        {{ $f->title }}
                    </h5>
                    <p class="card-text">
                        {{ $f->description }}
                    </p>
                    <div class="d-flex justify-content-center gap-3">
                        <a href="/{{$$nickname}}/{{$category}}/{{$f->id}}" class="btn btn-primary">Veja!</a>
                        <form action="/{{$$nickname}}/{{$category}}/edit/{{$f->id}}" method="get">
                            @csrf
                            <button type="submit" class="btn btn-warning">Editar</button>
                        </form>
                        <form action="/{{$$nickname}}/{{$category}}/{{$f->id}}" method="post">
                            @csrf
                            @method('DELETE')
                            <button type="submit" class="btn btn-danger">Excluir</button>
                        </form>
                    </div>
                </div>
            </div>

        </div>
        @endif
        @endforeach

    </div>
    <div class="row mt-4">
        <div class="col">
            <form action="/{{$$nickname}}/{{$category}}/create" method="get">
                @csrf
                <button type="submit" class="btn btn-outline-primary float-end">
                    Adicionar
                </button>
            </form>
        </div>
    </div>
    @endif
</div>

@endsection