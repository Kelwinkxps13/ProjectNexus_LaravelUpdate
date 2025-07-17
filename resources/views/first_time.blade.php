{{--
    Importação inicial do projeto.
    Serve pra pegar o layout da página principal, e aplicar em cada view em que será extendido.
--}}
@extends('layouts.main')
@section('content')

@if ($validate == 'editor')
@section('title', 'Tutorial - Editor')
<div class="container my-5 d-flex justify-content-center">
    <div class="card shadow-lg" style="max-width: 500px;">
        <div class="card-body">
            <h5 class="card-title"> Editor </h5>
            <div class="card-text">
                <p>
                     Nessa parte, você tem pode fazer algumas coisas interessantes: 
                </p>
                <p>
                    1 - Editar sua página inicial;
                </p>
                <p>
                    2 - Editar ou excluir um tema que você criou.
                </p>
                
            </div>
            <div class="d-grid">
                <a href="{{ $route }}" class="btn btn-primary">Continuar</a>
            </div>
        </div>
    </div>
</div>
@elseif ($validate == 'generic')
@section('title', 'Tutorial - Temas')
<div class="container my-5 d-flex justify-content-center">
    <div class="card shadow-lg" style="max-width: 500px;">
        <div class="card-body">
            <h5 class="card-title"> Temas </h5>
            <div class="card-text">
                <p>
                     Editor 
                </p>
                
            </div>
            <div class="d-grid">
                <a href="{{ $route }}" class="btn btn-primary">Continuar</a>
            </div>
        </div>
    </div>
</div>
@elseif ($validate == 'index')
@section('title', 'Tutorial - Página Inicial')
<div class="container my-5 d-flex justify-content-center">
    <div class="card shadow-lg" style="max-width: 500px;">
        <div class="card-body">
            <h5 class="card-title"> Página Inicial </h5>
            <div class="card-text">
                <p>
                     Editor 
                </p>
                
            </div>
            <div class="d-grid">
                <a href="{{ $route }}" class="btn btn-primary">Continuar</a>
            </div>
        </div>
    </div>
</div>
@elseif ($validate == 'indexcreator')
@section('title', 'Tutorial - Criar Pagina de boas vindas')
<div class="container my-5 d-flex justify-content-center">
    <div class="card shadow-lg" style="max-width: 500px;">
        <div class="card-body">
            <h5 class="card-title"> Página de Boas Vindas </h5>
            <div class="card-text">
                <p>
                     Editor 
                </p>
                
            </div>
            <div class="d-grid">
                <a href="{{ $route }}" class="btn btn-primary">Continuar</a>
            </div>
        </div>
    </div>
</div>
@elseif ($validate == 'indexeditor')
@section('title', 'Tutorial - Editar página de boas vindas')
<div class="container my-5 d-flex justify-content-center">
    <div class="card shadow-lg" style="max-width: 500px;">
        <div class="card-body">
            <h5 class="card-title"> Editar Página de Boas vindas </h5>
            <div class="card-text">
                <p>
                     Editor 
                </p>
                
            </div>
            <div class="d-grid">
                <a href="{{ $route }}" class="btn btn-primary">Continuar</a>
            </div>
        </div>
    </div>
</div>
@elseif ($validate == 'main')
@section('title', 'Tutorial - Página de boas vindas')
<div class="container my-5 d-flex justify-content-center">
    <div class="card shadow-lg" style="max-width: 500px;">
        <div class="card-body">
            <h5 class="card-title"> Página de Boas Vindas </h5>
            <div class="card-text">
                <p>
                     Editor 
                </p>
                
            </div>
            <div class="d-grid">
                <a href="{{ $route }}" class="btn btn-primary">Continuar</a>
            </div>
        </div>
    </div>
</div>
@elseif ($validate == 'veja')
@section('title', 'Tutorial - Ver Conteúdo')
<div class="container my-5 d-flex justify-content-center">
    <div class="card shadow-lg" style="max-width: 500px;">
        <div class="card-body">
            <h5 class="card-title"> Ver Conteúdo de um Item </h5>
            <div class="card-text">
                <p>
                     Editor 
                </p>
                
            </div>
            <div class="d-grid">
                <a href="{{ $route }}" class="btn btn-primary">Continuar</a>
            </div>
        </div>
    </div>
</div>
@elseif ($validate == 'vejaeditor')
@section('title', 'Tutorial - Editar Conteúdo')
<div class="container my-5 d-flex justify-content-center">
    <div class="card shadow-lg" style="max-width: 500px;">
        <div class="card-body">
            <h5 class="card-title"> Editar Conteúdo de um Item </h5>
            <div class="card-text">
                <p>
                     Editor 
                </p>
                
            </div>
            <div class="d-grid">
                <a href="{{ $route }}" class="btn btn-primary">Continuar</a>
            </div>
        </div>
    </div>
</div>
@elseif ($validate == 'base_create')
@section('title', 'Tutorial - Criar Item')
<div class="container my-5 d-flex justify-content-center">
    <div class="card shadow-lg" style="max-width: 500px;">
        <div class="card-body">
            <h5 class="card-title"> Criar Item </h5>
            <div class="card-text">
                <p>
                     Editor 
                </p>
                
            </div>
            <div class="d-grid">
                <a href="{{ $route }}" class="btn btn-primary">Continuar</a>
            </div>
        </div>
    </div>
</div>
@elseif ($validate == 'base_edit')
@section('title', 'Tutorial - Editar Item')
<div class="container my-5 d-flex justify-content-center">
    <div class="card shadow-lg" style="max-width: 500px;">
        <div class="card-body">
            <h5 class="card-title"> Editar Item </h5>
            <div class="card-text">
                <p>
                     Editor 
                </p>
                
            </div>
            <div class="d-grid">
                <a href="{{ $route }}" class="btn btn-primary">Continuar</a>
            </div>
        </div>
    </div>
</div>
@elseif ($validate == 'block_create')
@section('title', 'Tutorial - Criar Conteúdo')
<div class="container my-5 d-flex justify-content-center">
    <div class="card shadow-lg" style="max-width: 500px;">
        <div class="card-body">
            <h5 class="card-title"> Criar um bloco de conteúdo </h5>
            <div class="card-text">
                <p>
                     Editor 
                </p>
                
            </div>
            <div class="d-grid">
                <a href="{{ $route }}" class="btn btn-primary">Continuar</a>
            </div>
        </div>
    </div>
</div>
@elseif ($validate == 'block_edit')
@section('title', 'Tutorial - Editar conteúdo')
<div class="container my-5 d-flex justify-content-center">
    <div class="card shadow-lg" style="max-width: 500px;">
        <div class="card-body">
            <h5 class="card-title"> Editar um bloco de conteúdio </h5>
            <div class="card-text">
                <p>
                     Editor 
                </p>
                
            </div>
            <div class="d-grid">
                <a href="{{ $route }}" class="btn btn-primary">Continuar</a>
            </div>
        </div>
    </div>
</div>
@elseif ($validate == 'generic_create')
@section('title', 'Tutorial - Criar Tema')
<div class="container my-5 d-flex justify-content-center">
    <div class="card shadow-lg" style="max-width: 500px;">
        <div class="card-body">
            <h5 class="card-title"> Criar tema </h5>
            <div class="card-text">
                <p>
                     Editor 
                </p>
                
            </div>
            <div class="d-grid">
                <a href="{{ $route }}" class="btn btn-primary">Continuar</a>
            </div>
        </div>
    </div>
</div>
@elseif ($validate == 'generic_edit')
@section('title', 'Tutorial - Editar tema')
<div class="container my-5 d-flex justify-content-center">
    <div class="card shadow-lg" style="max-width: 500px;">
        <div class="card-body">
            <h5 class="card-title"> Editar tema </h5>
            <div class="card-text">
                <p>
                     Editor 
                </p>
                
            </div>
            <div class="d-grid">
                <a href="{{ $route }}" class="btn btn-primary">Continuar</a>
            </div>
        </div>
    </div>
</div>
@endif


@endsection