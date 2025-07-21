{{--
    Importação inicial do projeto.
    Serve pra pegar o layout da página principal, e aplicar em cada view em que será extendido.
--}}

@extends('layouts.main')
@section('title', 'Busca')
@section('content')


<div class="container py-5">

    {{-- Resultados de usuários --}}
    @if ($users->count() > 0)
    <h4 class="mb-3">Usuários encontrados</h4>
    @foreach ($users as $user)
    <div class="card mb-3 shadow-sm rounded-4">
        <div class="card-body d-flex align-items-center">
            <i class="fa-solid fa-user-circle fa-2xl text-primary me-3"></i>
            <div class="flex-grow-1">
                <h5 class="mb-1">{{ '@'.$user->nickname }}</h5>
                <p class="mb-0 text-muted">Criador de temas interativos e fã de segurança da informação</p>
            </div>
            <a href="{{route('user_index', ['nickname' => $user->nickname])}}" class="btn btn-sm btn-primary">Ver</a>
        </div>
    </div>
    @endforeach
    @else
    <p class="text-muted">Nenhum usuário encontrado para "{{ $query }}".</p>
    @endif

    {{-- Resultados de temas --}}
    @if ($themes->count() > 0)
    <h4 class="mt-5 mb-3">Temas encontrados</h4>
    @foreach ($themes as $theme)
    <div class="card mb-3 shadow-sm rounded-4">
        <div class="card-body">
            <h5 class="card-title mb-1"><i class="fa-solid fa-book-open text-info me-2"></i>{{ $theme->name }}</h5>
            <p class="card-text text-muted">Tema criado por <strong>{{ '@'.$theme->user_nickname }}</strong>. Aborda tópicos interessantes.</p>
            <a href="{{ route('category_index', ['nickname' => $theme->user->nickname, 'category_name_slug' => $theme->name_slug]) }}" class="btn btn-sm btn-primary">Ver tema</a>
        </div>
    </div>
    @endforeach
    @else
    <p class="text-muted">Nenhum tema encontrado para "{{ $query }}".</p>
    @endif

    {{-- Resultados de itens --}}
    @if ($items->count() > 0)
    <h4 class="mt-5 mb-3">Itens encontrados</h4>
    @foreach ($items as $item)
    <div class="card mb-3 shadow-sm rounded-4">
        <div class="card-body">
            <h6 class="card-subtitle mb-1 text-dark"><i class="fa-solid fa-shield-halved text-danger me-2"></i>{{ $item->name }}</h6>
            <p class="mb-0 text-muted">Item do tema: <strong>{{ $item->category->name }}</strong> — Explica o funcionamento e importância.</p>
            <a href="{{route('item_index', ['nickname' => $item->category->user_nickname, 'category_name_slug' => $item->category->name_slug, 'item_name_slug' => $item->name_slug])}}" class="btn btn-sm btn-secondary mt-2">Ver item</a>
        </div>
    </div>
    @endforeach
    @else
    <p class="text-muted">Nenhum item encontrado para "{{ $query }}".</p>
    @endif

</div>


@endsection