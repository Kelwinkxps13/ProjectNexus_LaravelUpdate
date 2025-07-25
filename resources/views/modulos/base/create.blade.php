{{--
    Importação inicial do projeto.
    Serve pra pegar o layout da página principal, e aplicar em cada view em que será extendido.
--}}
@extends('layouts.main')
@section('title', 'Criar Item do tema '.$cat->name)
@section('content')

<div class="container my-5">
    <div class="row justify-content-center">
        <div class="col-lg-8 col-md-10 col-12">
            <div class="card custom-card">
                <div class="card-header custom-header text-center fs-4 py-4">
                    <strong>Formulário de Criação de {{$page}}</strong>
                </div>
                <div class="card-body p-5">
                    <form action="{{route('item_store', ['nickname' => $nickname, 'category_name_slug' => $category_name_slug])}}" method="POST" enctype="multipart/form-data">
                        @csrf
                        <input type="hidden" name="id" value="{{$id}}">
                        <div class="mb-4">
                            <label for="name" class="form-label">Nome</label>
                            <input name="name" type="text" class="form-control custom-input" id="name"
                                placeholder="ex: Red Dead Redemption 2" required>
                            @error('name')
                            <div class="text-danger">{{$message}}</div>
                            @enderror
                        </div>
                        <div class="mb-4">
                            <label for="description" class="form-label">Descrição</label>
                            <textarea name="description" id="autoTextarea" style="overflow:hidden; resize: none;" rows="4" class="form-control custom-input" id="description"
                                placeholder="ex: Um jogo com detalhes incríveis, história maravilhosa e um ambiente realista mais incrível ainda..." required></textarea>
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