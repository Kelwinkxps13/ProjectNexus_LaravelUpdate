{{--
    Importação inicial do projeto.
    Serve pra pegar o layout da página principal, e aplicar em cada view em que será extendido.
--}}
@extends('layouts.main')
@section('title', 'Criar Bloco do item '.$item->name)
@section('content')

<div class="container my-5">
    <div class="row justify-content-center">
        <div class="col-lg-8 col-md-10 col-12">
            <div class="card custom-card">
                <div class="card-header custom-header text-center fs-4 py-4">
                    <strong> Formulário de Criação de Conteúdos</strong>
                </div>
                <div class="card-body p-5">
                    <form action="{{route('content_store', ['nickname' => $nickname, 'category_name_slug' => $category_name_slug])}}" method="POST" enctype="multipart/form-data">
                        @csrf
                        <input type="hidden" name="id" value="{{$id}}">
                        <input type="hidden" name="item_name_slug" value="{{$item_name_slug}}">
                        <div class="mb-4">
                            <label for="name" class="form-label">Nome</label>
                            <input name="name" type="text" class="form-control custom-input" id="name"
                                placeholder="ex: Introdução" required>
                            @error('name')
                            <div class="text-danger">{{$message}}</div>
                            @enderror
                        </div>
                        <div class="mb-4">
                            <label for="description" class="form-label">Descrição</label>
                            <textarea name="description" rows="4" id="autoTextarea" style="overflow:hidden; resize: none;" class="form-control custom-input" id="description"
                                placeholder="ex: O jogo conta a história de Arthur Morgan, membro da gangue Van Der Linde que está fugindo das autoridades devido a um assalto que fizeram em Blackwater..." required></textarea>
                            @error('description')
                            <div class="text-danger">{{$message}}</div>
                            @enderror
                        </div>
                        <div class="mb-4">
                            <label for="image" class="form-label">Adicionar Imagem</label>
                            <input name="image" type="file" class="form-control custom-input" id="image">
                            @error('image')
                            <div class="text-danger">{{$message}}</div>
                            @enderror
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