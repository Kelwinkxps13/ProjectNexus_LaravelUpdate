{{--
    Importação inicial do projeto.
    Serve pra pegar o layout da página principal, e aplicar em cada view em que será extendido.
--}}
@extends('layouts.main')
@section('content')

@if ($validate == 'editor')
@section('title', 'Tutorial - xxx')
<div class="container my-5 d-flex justify-content-center">
    <div class="card shadow-lg" style="max-width: 500px;">
        <div class="card-body">
            <h5 class="card-title">????</h5>
            <div class="card-text">
                <p>
                    ????
                </p>
                
            </div>
            <div class="d-grid">
                <a href="{{ route('index') }}" class="btn btn-primary">Continuar</a>
            </div>
        </div>
    </div>
</div>
@elseif ($validate == 'generic')
@section('title', 'Tutorial - xxx')
<div class="container my-5 d-flex justify-content-center">
    <div class="card shadow-lg" style="max-width: 500px;">
        <div class="card-body">
            <h5 class="card-title">????</h5>
            <div class="card-text">
                <p>
                    ????
                </p>
                
            </div>
            <div class="d-grid">
                <a href="{{ route('index') }}" class="btn btn-primary">Continuar</a>
            </div>
        </div>
    </div>
</div>
@elseif ($validate == 'index')
@section('title', 'Tutorial - xxx')
<div class="container my-5 d-flex justify-content-center">
    <div class="card shadow-lg" style="max-width: 500px;">
        <div class="card-body">
            <h5 class="card-title">????</h5>
            <div class="card-text">
                <p>
                    ????
                </p>
                
            </div>
            <div class="d-grid">
                <a href="{{ route('index') }}" class="btn btn-primary">Continuar</a>
            </div>
        </div>
    </div>
</div>
@elseif ($validate == 'indexcreator')
@section('title', 'Tutorial - xxx')
<div class="container my-5 d-flex justify-content-center">
    <div class="card shadow-lg" style="max-width: 500px;">
        <div class="card-body">
            <h5 class="card-title">????</h5>
            <div class="card-text">
                <p>
                    ????
                </p>
                
            </div>
            <div class="d-grid">
                <a href="{{ route('index') }}" class="btn btn-primary">Continuar</a>
            </div>
        </div>
    </div>
</div>
@elseif ($validate == 'indexeditor')
@section('title', 'Tutorial - xxx')
<div class="container my-5 d-flex justify-content-center">
    <div class="card shadow-lg" style="max-width: 500px;">
        <div class="card-body">
            <h5 class="card-title">????</h5>
            <div class="card-text">
                <p>
                    ????
                </p>
                
            </div>
            <div class="d-grid">
                <a href="{{ route('index') }}" class="btn btn-primary">Continuar</a>
            </div>
        </div>
    </div>
</div>
@elseif ($validate == 'main')
@section('title', 'Tutorial - xxx')
<div class="container my-5 d-flex justify-content-center">
    <div class="card shadow-lg" style="max-width: 500px;">
        <div class="card-body">
            <h5 class="card-title">????</h5>
            <div class="card-text">
                <p>
                    ????
                </p>
                
            </div>
            <div class="d-grid">
                <a href="{{ route('index') }}" class="btn btn-primary">Continuar</a>
            </div>
        </div>
    </div>
</div>
@elseif ($validate == 'veja')
@section('title', 'Tutorial - xxx')
<div class="container my-5 d-flex justify-content-center">
    <div class="card shadow-lg" style="max-width: 500px;">
        <div class="card-body">
            <h5 class="card-title">????</h5>
            <div class="card-text">
                <p>
                    ????
                </p>
                
            </div>
            <div class="d-grid">
                <a href="{{ route('index') }}" class="btn btn-primary">Continuar</a>
            </div>
        </div>
    </div>
</div>
@elseif ($validate == 'vejaeditor')
@section('title', 'Tutorial - xxx')
<div class="container my-5 d-flex justify-content-center">
    <div class="card shadow-lg" style="max-width: 500px;">
        <div class="card-body">
            <h5 class="card-title">????</h5>
            <div class="card-text">
                <p>
                    ????
                </p>
                
            </div>
            <div class="d-grid">
                <a href="{{ route('index') }}" class="btn btn-primary">Continuar</a>
            </div>
        </div>
    </div>
</div>
@elseif ($validate == 'base_create')
@section('title', 'Tutorial - xxx')
<div class="container my-5 d-flex justify-content-center">
    <div class="card shadow-lg" style="max-width: 500px;">
        <div class="card-body">
            <h5 class="card-title">????</h5>
            <div class="card-text">
                <p>
                    ????
                </p>
                
            </div>
            <div class="d-grid">
                <a href="{{ route('index') }}" class="btn btn-primary">Continuar</a>
            </div>
        </div>
    </div>
</div>
@elseif ($validate == 'base_edit')
@section('title', 'Tutorial - xxx')
<div class="container my-5 d-flex justify-content-center">
    <div class="card shadow-lg" style="max-width: 500px;">
        <div class="card-body">
            <h5 class="card-title">????</h5>
            <div class="card-text">
                <p>
                    ????
                </p>
                
            </div>
            <div class="d-grid">
                <a href="{{ route('index') }}" class="btn btn-primary">Continuar</a>
            </div>
        </div>
    </div>
</div>
@elseif ($validate == 'block_create')
@section('title', 'Tutorial - xxx')
<div class="container my-5 d-flex justify-content-center">
    <div class="card shadow-lg" style="max-width: 500px;">
        <div class="card-body">
            <h5 class="card-title">????</h5>
            <div class="card-text">
                <p>
                    ????
                </p>
                
            </div>
            <div class="d-grid">
                <a href="{{ route('index') }}" class="btn btn-primary">Continuar</a>
            </div>
        </div>
    </div>
</div>
@elseif ($validate == 'block_edit')
@section('title', 'Tutorial - xxx')
<div class="container my-5 d-flex justify-content-center">
    <div class="card shadow-lg" style="max-width: 500px;">
        <div class="card-body">
            <h5 class="card-title">????</h5>
            <div class="card-text">
                <p>
                    ????
                </p>
                
            </div>
            <div class="d-grid">
                <a href="{{ route('index') }}" class="btn btn-primary">Continuar</a>
            </div>
        </div>
    </div>
</div>
@elseif ($validate == 'generic_create')
@section('title', 'Tutorial - xxx')
<div class="container my-5 d-flex justify-content-center">
    <div class="card shadow-lg" style="max-width: 500px;">
        <div class="card-body">
            <h5 class="card-title">????</h5>
            <div class="card-text">
                <p>
                    ????
                </p>
                
            </div>
            <div class="d-grid">
                <a href="{{ route('index') }}" class="btn btn-primary">Continuar</a>
            </div>
        </div>
    </div>
</div>
@elseif ($validate == 'generic_edit')
@section('title', 'Tutorial - xxx')
<div class="container my-5 d-flex justify-content-center">
    <div class="card shadow-lg" style="max-width: 500px;">
        <div class="card-body">
            <h5 class="card-title">????</h5>
            <div class="card-text">
                <p>
                    ????
                </p>
                
            </div>
            <div class="d-grid">
                <a href="{{ route('index') }}" class="btn btn-primary">Continuar</a>
            </div>
        </div>
    </div>
</div>
@endif


@endsection