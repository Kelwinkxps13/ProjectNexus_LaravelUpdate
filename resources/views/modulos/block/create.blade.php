@extends('layouts.main')
@section('title', 'Criar Item')
@section('content')

<div class="container my-5">
    <div class="row justify-content-center">
        <div class="col-lg-8 col-md-10 col-12">
            <div class="card custom-card">
                <div class="card-header custom-header text-center fs-4 py-4">
                    <strong> Formulário de Criação de Conteúdos</strong>
                </div>
                <div class="card-body p-5">
                    <form action="/theme/{{$id}}/storeblock" method="POST" enctype="multipart/form-data">
                        @csrf
                        <input type="hidden" name="id_item" value="{{$id_item}}">
                        <div class="mb-4">
                            <label for="title" class="form-label">Nome</label>
                            <input name="title" type="text" class="form-control custom-input" id="title"
                                placeholder="ex: Introdução" required>
                        </div>
                        <div class="mb-4">
                            <label for="description" class="form-label">Descrição</label>
                            <textarea name="description" rows="4" class="form-control custom-input" id="description"
                                placeholder="ex: O jogo conta a história de Arthur Morgan, membro da gangue Van Der Linde que está fugindo das autoridades devido a um assalto que fizeram em Blackwater..." required></textarea>
                        </div>
                        <div class="mb-4">
                            <label for="image" class="form-label">Adicionar Imagem</label>
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