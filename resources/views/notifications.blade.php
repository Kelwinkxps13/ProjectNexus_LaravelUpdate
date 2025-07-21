{{--
    Importação inicial do projeto.
    Serve pra pegar o layout da página principal, e aplicar em cada view em que será extendido.
--}}

@extends('layouts.main')
@section('title', 'Notificações')
@section('content')

<div class="container my-5">
    <h3 class="mb-4">Notificações</h3>

    @if (isset($notifications))
        @if ($notifications > 0)
            @foreach ($notifications as $notification)
                @if ($notification->status == 'new_comment')
                    <div class="card mb-3 shadow-sm border-0 rounded-4 p-3 bg-light-subtle">
                        <div class="d-flex align-items-start">
                            <div class="me-3">
                                <i class="fa-solid fa-comment-dots fa-xl text-warning"></i>
                            </div>
                            <div class="flex-grow-1">
                                <h5 class="fw-bold mb-1">Novo Comentário</h5>
                                <p class="mb-1 text-muted"><a href="{{route('user_index', ['nickname' => $notification->responser_nickname])}}"><strong>{{'@'.$notification->responser_nickname}}</strong></a> comentou na sua <a href="{{$notification->route}}">postagem</a>: <em>{{$notification->text}}</em></p>
                                <small class="text-muted">{{ $notification->created_at->diffForHumans() }}</small>
                            </div>
                            <div class="ms-3">
                                <button class="btn btn-sm btn-outline-secondary rounded-pill"><i class="fa-solid fa-xmark"></i></button>
                            </div>
                        </div>
                    </div>
                @elseif ($notification->status == 'new_follower')
                    <div class="card mb-3 shadow-sm border-0 rounded-4 p-3 bg-light-subtle">
                        <div class="d-flex align-items-start">
                            <div class="me-3">
                                <i class="fa-solid fa-user-plus fa-xl text-info"></i>
                            </div>
                            <div class="flex-grow-1">
                                <h5 class="fw-bold mb-1">Novo Seguidor</h5>
                                <p class="mb-1 text-muted"><a href="{{route('user_index', ['nickname' => $notification->responser_nickname])}}"><strong>{{'@'.$notification->responser_nickname}}</strong></a> começou a te seguir.</p>
                                <small class="text-muted">{{ $notification->created_at->diffForHumans() }}</small>
                            </div>
                            <div class="ms-3">
                                <button class="btn btn-sm btn-outline-secondary rounded-pill"><i class="fa-solid fa-xmark"></i></button>
                            </div>
                        </div>
                    </div>
                @elseif ($notification->status == 'error')
                    <div class="card mb-3 shadow-sm border-0 rounded-4 p-3 bg-light-subtle">
                        <div class="d-flex align-items-start">
                            <div class="me-3">
                                <i class="fa-solid fa-triangle-exclamation fa-xl text-danger"></i>
                            </div>
                            <div class="flex-grow-1">
                                <h5 class="fw-bold mb-1">Erro encontrado</h5>
                                <p class="mb-1 text-muted">Houve uma falha ao processar a solicitação.</p>
                                <small class="text-muted">{{ $notification->created_at->diffForHumans() }}</small>
                            </div>
                            <div class="ms-3">
                                <button class="btn btn-sm btn-outline-secondary rounded-pill"><i class="fa-solid fa-xmark"></i></button>
                            </div>
                        </div>
                    </div>
                @elseif ($notification->status == 'system')
                    <div class="card mb-3 shadow-sm border-0 rounded-4 p-3 bg-light-subtle">
                        <div class="d-flex align-items-start">
                            <div class="me-3">
                                <i class="fa-solid fa-circle-info fa-xl text-primary"></i>
                            </div>
                            <div class="flex-grow-1">
                                <h5 class="fw-bold mb-1">Atualização do Sistema</h5>
                                <p class="mb-1 text-muted">O sistema será atualizado hoje às 02:00. Não se esqueça de salvar seus dados.</p>
                                <small class="text-muted">{{ $notification->created_at->diffForHumans() }}</small>
                            </div>
                            <div class="ms-3">
                                <button class="btn btn-sm btn-outline-secondary rounded-pill"><i class="fa-solid fa-xmark"></i></button>
                            </div>
                        </div>
                    </div>
                @elseif ($notification->status == 'new_theme')
                    <div class="card mb-3 shadow-sm border-0 rounded-4 p-3 bg-light-subtle">
                        <div class="d-flex align-items-start">
                            <div class="me-3">
                                <i class="fa-solid fa-book-open fa-xl text-success"></i>
                            </div>
                            <div class="flex-grow-1">
                                <h5 class="fw-bold mb-1">Novo Tema Criado</h5>
                                <p class="mb-1 text-muted"><a href="{{route('user_index', ['nickname' => $notification->responser_nickname])}}"><strong>{{'@'.$notification->responser_nickname}}</strong></a> criou um novo tema: <em>"<a href="{{$notification->route}}">{{ $notification->theme_name }}</a>"</em></p>
                                <small class="text-muted">{{ $notification->created_at->diffForHumans() }}</small>
                            </div>
                            <div class="ms-3">
                                <button class="btn btn-sm btn-outline-secondary rounded-pill"><i class="fa-solid fa-xmark"></i></button>
                            </div>
                        </div>
                    </div>
                @elseif ($notification->status == 'new_item')
                    <div class="card mb-3 shadow-sm border-0 rounded-4 p-3 bg-light-subtle">
                        <div class="d-flex align-items-start">
                            <div class="me-3">
                                <i class="fa-solid fa-cube fa-xl text-secondary"></i>
                            </div>
                            <div class="flex-grow-1">
                                <h5 class="fw-bold mb-1">Novo Item Adicionado</h5>
                                <p class="mb-1 text-muted"><a href="{{route('user_index', ['nickname' => $notification->responser_nickname])}}"><strong> adicionou um novo item ao tema <em>"<a href="{{$notification->text}}">{{ $notification->theme_name }}</a>"</em>: <a href="{{$notification->route}}"><strong>{{ $notification->name }}</strong></a> </p>
                                <small class="text-muted">{{ $notification->created_at->diffForHumans() }}</small>
                            </div>
                            <div class="ms-3">
                                <button class="btn btn-sm btn-outline-secondary rounded-pill"><i class="fa-solid fa-xmark"></i></button>
                            </div>
                        </div>
                    </div>
                @endif
            @endforeach
        @else
        <h4>Sem novas notificações</h4>
        @endif
    @endif
    


    <!-- <div class="card mb-3 shadow-sm border-0 rounded-4 p-3 bg-light-subtle">
        <div class="d-flex align-items-start">
            <div class="me-3">
                <i class="fa-solid fa-check-circle fa-xl text-success"></i>
            </div>
            <div class="flex-grow-1">
                <h5 class="fw-bold mb-1">Operação concluída</h5>
                <p class="mb-1 text-muted">Sua tarefa foi processada com sucesso.</p>
                <small class="text-muted">{{ $notification->created_at->diffForHumans() }}</small>
            </div>
            <div class="ms-3">
                <button class="btn btn-sm btn-outline-secondary rounded-pill"><i class="fa-solid fa-xmark"></i></button>
            </div>
        </div>
    </div> -->

    


    

</div>


@endsection