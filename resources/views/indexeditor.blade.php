@extends('layouts.main')
@section('title', 'Editar Tela Inicial')
@section('content')

<div class="container my-5">
    <div class="row justify-content-center">
        <div class="col-lg-8 col-md-10 col-12">
            <div class="card custom-card">
                <div class="card-header custom-header text-center fs-4 py-4">
                    <strong>Formulário de Edição da Tela Inicial</strong>
                </div>
                <div class="card-body p-5">
                    <form action="{{route('user_update', ['nickname' => $nickname])}}" method="POST">
                        @csrf
                        @method('PATCH')
                        <div class="mb-4">
                            <label for="name" class="form-label">Título</label>
                            <input name="name" type="text" class="form-control custom-input" id="name"
                                placeholder="ex: olá mundo!" value="{{$main->name}}" required>
                        </div>
                        <div class="mb-4">
                            <label for="subtitle" class="form-label">Subtítulo</label>
                            <input name="subtitle" type="text" class="form-control custom-input" id="subtitle"
                                placeholder="ex: seja bem vindo(a) à minha página!" value="{{$main->subtitle}}">
                        </div>
                        <div class="mb-4">
                            <label for="description" class="form-label">Descrição</label>
                            <textarea name="description" rows="4" id="autoTextarea" style="overflow:hidden; resize: none;" class="form-control custom-input" id="description"
                                placeholder="ex: aqui vou postar algumas coisas que acho interessante."
                                required>{{$main->description}}</textarea>
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