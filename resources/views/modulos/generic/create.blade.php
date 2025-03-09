@extends('layouts.main')
@section('name', 'Criar Item')
@section('content') %>

<div class="container my-5">
    <div class="row justify-content-center">
        <div class="col-lg-8 col-md-10 col-12">
            <div class="card custom-card">
                <div class="card-header custom-header text-center fs-4 py-4">
                    <strong>Formulário de Criação de Categoria</strong>
                </div>
                <div class="card-body p-5">
                    <form action="/{{$nickname}}/category" method="POST" enctype="multipart/form-data">
                        @csrf
                        <div class="mb-4">
                            <label for="name" class="form-label">Nome</label>
                            <input name="name" type="text" class="form-control custom-input" id="name"
                                placeholder="ex: Jogos" required>
                        </div>
                        <div class="mb-4">
                            <label for="description" class="form-label">Descrição</label>
                            <textarea name="description" rows="4" class="form-control custom-input" id="description"
                                placeholder="ex: parte reservada para mostrar meus favoritos." required></textarea>
                        </div>

                        <div class="mb-4">
                            <label for="image" class="form-label">Adicionar Banner de fundo</label>
                            <input name="image" type="file" class="form-control custom-input" id="image">
                        </div>

                        <div class="text-center mt-4">
                            <button type="submit" class="btn custom-btn">Enviar</button>
                        </div>

                    </form>
                </div>
            </div>
        </div>
    </div>
</div>

@endsection