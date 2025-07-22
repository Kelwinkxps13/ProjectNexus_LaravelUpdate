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
        @if (count($notifications) > 0)
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
                                <div class="comentario">
                                    <div class="info d-flex justify-content-between">
                                        <span><strong>{{ $notification->comment->author_name }}</strong></span>
                                        <span>{{ $notification->comment->created_at->format('d \d\e F \d\e Y \à\s H:i:s') }}</span>
                                    </div>

                                    <div class="texto">
                                        @php
                                        $paragraphs = preg_split('/\r\n|\n|\r/', $notification->text);
                                        @endphp

                                        @foreach($paragraphs as $paragraph)
                                        <p class="text text-dark">
                                            {{ $paragraph }}
                                        </p>
                                        @endforeach
                                    </div>

                                    <button class="btn btn-primary btn-sm my-3 mt-2" onclick="mostrarResposta(this)">Responder</button>

                                    <!-- Formulário oculto por padrão -->
                                    <div class="resposta-form mt-2" style="display: none;">
                                        <form action="{{ $notification->comment->route }}" method="post">
                                            @csrf
                                            <div class="col">
                                                <textarea id="autoTextarea" name="text" class="form-control custom-input" placeholder="Digite aqui..." rows="1" style="overflow:hidden; resize: none;"></textarea>
                                                <input type="hidden" name="response_to" value="{{$notification->comment->id}}">
                                                <input type="hidden" name="response_to_commenter" value="{{$notification->comment->id_commenter}}">
                                                <div class="d-flex flex-row-reverse mt-2">
                                                    <button class="btn custom-btn" type="submit">Comentar</button>
                                                </div>
                                            </div>
                                        </form>
                                    </div>
                                </div>
                                <script>
                                    function mostrarResposta(botao) {
                                        const form = botao.nextElementSibling;
                                        if (form.style.display === "none") {
                                            form.style.display = "block";
                                        } else {
                                            form.style.display = "none";
                                        }
                                    }

                                    function mostrarRespostas(botao) {
                                        const form = botao.nextElementSibling;
                                        if (form.style.display === "none") {
                                            form.style.display = "block";
                                        } else {
                                            form.style.display = "none";
                                        }
                                    }
                                </script>
                                @if(isset($notification->created_at))
                                <small class="text-muted">{{ $notification->created_at->diffForHumans() }}</small>
                                @endif
                            </div>
                            <div class="ms-3">
                                <form action="{{route('notification_destroy')}}" method="POST">
                                @csrf    
                                @METHOD('DELETE')
                                <input type="hidden" name="id" value="{{$notification->id}}">
                                <button type="submit" class="btn btn-sm btn-outline-secondary rounded-pill"><i class="fa-solid fa-xmark"></i></button>
                                </form>
                            </div>
                        </div>
                    </div>
                @elseif ($notification->status == 'new_comment_2')
                    <div class="card mb-3 shadow-sm border-0 rounded-4 p-3 bg-light-subtle">
                        <div class="d-flex align-items-start">
                            <div class="me-3">
                                <i class="fa-solid fa-comment-dots fa-xl text-warning"></i>
                            </div>
                            <div class="flex-grow-1">
                                <h5 class="fw-bold mb-1">Nova Resposta ao seu Comentário</h5>
                                <p class="mb-1 text-muted"><a href="{{route('user_index', ['nickname' => $notification->responser_nickname])}}"><strong>{{'@'.$notification->responser_nickname}}</strong></a> respondeu seu comentário na <a href="{{$notification->route}}">postagem</a></p>
                                <div class="comentario">
                                    <div class="info d-flex justify-content-between">
                                        <span><strong>{{ $notification->comment->author_name }}</strong></span>
                                        <span>{{ $notification->comment->created_at->format('d \d\e F \d\e Y \à\s H:i:s') }}</span>
                                    </div>

                                    <div class="texto">
                                        @php
                                        $paragraphs = preg_split('/\r\n|\n|\r/', $notification->text);
                                        @endphp

                                        @foreach($paragraphs as $paragraph)
                                        <p class="text text-dark">
                                            {{ $paragraph }}
                                        </p>
                                        @endforeach
                                    </div>

                                    <button class="btn btn-primary btn-sm my-3 mt-2" onclick="mostrarResposta(this)">Responder</button>

                                    <!-- Formulário oculto por padrão -->
                                    <div class="resposta-form mt-2" style="display: none;">
                                        <form action="{{ $notification->comment->route }}" method="post">
                                            @csrf
                                            <div class="col">
                                                <textarea id="autoTextarea" name="text" class="form-control custom-input" placeholder="Digite aqui..." rows="1" style="overflow:hidden; resize: none;"></textarea>
                                                <input type="hidden" name="response_to" value="{{$notification->comment->id}}">
                                                <input type="hidden" name="response_to_commenter" value="{{$notification->comment->id_commenter}}">
                                                <div class="d-flex flex-row-reverse mt-2">
                                                    <button class="btn custom-btn" type="submit">Comentar</button>
                                                </div>
                                            </div>
                                        </form>
                                    </div>
                                </div>
                                <script>
                                    function mostrarResposta(botao) {
                                        const form = botao.nextElementSibling;
                                        if (form.style.display === "none") {
                                            form.style.display = "block";
                                        } else {
                                            form.style.display = "none";
                                        }
                                    }

                                    function mostrarRespostas(botao) {
                                        const form = botao.nextElementSibling;
                                        if (form.style.display === "none") {
                                            form.style.display = "block";
                                        } else {
                                            form.style.display = "none";
                                        }
                                    }
                                </script>
                                @if(isset($notification->created_at))
                                <small class="text-muted">{{ $notification->created_at->diffForHumans() }}</small>
                                @endif
                            </div>
                            <div class="ms-3">
                                <form action="{{route('notification_destroy')}}" method="POST">
                                @csrf    
                                @METHOD('DELETE')
                                <input type="hidden" name="id" value="{{$notification->id}}">
                                <button type="submit" class="btn btn-sm btn-outline-secondary rounded-pill"><i class="fa-solid fa-xmark"></i></button>
                                </form>
                            </div>
                        </div>
                    </div>
                @elseif ($notification->status == 'new_comment_3')
                    <div class="card mb-3 shadow-sm border-0 rounded-4 p-3 bg-light-subtle">
                        <div class="d-flex align-items-start">
                            <div class="me-3">
                                <i class="fa-solid fa-comment-dots fa-xl text-warning"></i>
                            </div>
                            <div class="flex-grow-1">
                                <h5 class="fw-bold mb-1">Nova Resposta ao seu Comentário</h5>
                                <p class="mb-1 text-muted"><a href="{{route('user_index', ['nickname' => $notification->responser_nickname])}}"><strong>{{'@'.$notification->responser_nickname}}</strong></a> respondeu seu comentário na <a href="{{$notification->route}}">postagem</a></p>
                                <div class="comentario">
                                    <div class="info d-flex justify-content-between">
                                        <span><strong>{{ $notification->comment->author_name }}</strong></span>
                                        <span>{{ $notification->comment->created_at->format('d \d\e F \d\e Y \à\s H:i:s') }}</span>
                                    </div>

                                    <div class="texto">
                                        @php
                                        $paragraphs = preg_split('/\r\n|\n|\r/', $notification->text);
                                        @endphp

                                        @foreach($paragraphs as $paragraph)
                                        <p class="text text-dark">
                                            {{ $paragraph }}
                                        </p>
                                        @endforeach
                                    </div>
                                </div>
                                @if(isset($notification->created_at))
                                <small class="text-muted">{{ $notification->created_at->diffForHumans() }}</small>
                                @endif
                            </div>
                            <div class="ms-3">
                                <form action="{{route('notification_destroy')}}" method="POST">
                                @csrf    
                                @METHOD('DELETE')
                                <input type="hidden" name="id" value="{{$notification->id}}">
                                <button type="submit" class="btn btn-sm btn-outline-secondary rounded-pill"><i class="fa-solid fa-xmark"></i></button>
                                </form>
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
                                @if(isset($notification->created_at))
                                <small class="text-muted">{{ $notification->created_at->diffForHumans() }}</small>
                                @endif
                            </div>
                            <div class="ms-3">
                                <form action="{{route('notification_destroy')}}" method="POST">
                                @csrf    
                                @METHOD('DELETE')
                                <input type="hidden" name="id" value="{{$notification->id}}">
                                <button type="submit" class="btn btn-sm btn-outline-secondary rounded-pill"><i class="fa-solid fa-xmark"></i></button>
                                </form>
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
                                <h5 class="fw-bold mb-1">{{$notification->name}}</h5>
                                <p class="mb-1 text-muted">{{$notification->text}}</p>
                                @if(isset($notification->created_at))
                                <small class="text-muted">{{ $notification->created_at->diffForHumans() }}</small>
                                @endif
                            </div>
                            <div class="ms-3">
                                <form action="{{route('notification_destroy')}}" method="POST">
                                @csrf    
                                @METHOD('DELETE')
                                <input type="hidden" name="id" value="{{$notification->id}}">
                                <button type="submit" class="btn btn-sm btn-outline-secondary rounded-pill"><i class="fa-solid fa-xmark"></i></button>
                                </form>
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
                                <h5 class="fw-bold mb-1">{{$notification->name}}</h5>
                                <p class="mb-1 text-muted">{{$notification->text}}</p>
                                @if(isset($notification->created_at))
                                <small class="text-muted">{{ $notification->created_at->diffForHumans() }}</small>
                                @endif
                            </div>
                            <div class="ms-3">
                                <form action="{{route('notification_destroy')}}" method="POST">
                                @csrf    
                                @METHOD('DELETE')
                                <input type="hidden" name="id" value="{{$notification->id}}">
                                <button type="submit" class="btn btn-sm btn-outline-secondary rounded-pill"><i class="fa-solid fa-xmark"></i></button>
                                </form>
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
                                @if(isset($notification->created_at))
                                <small class="text-muted">{{ $notification->created_at->diffForHumans() }}</small>
                                @endif
                            </div>
                            <div class="ms-3">
                                <form action="{{route('notification_destroy')}}" method="POST">
                                @csrf    
                                @METHOD('DELETE')
                                <input type="hidden" name="id" value="{{$notification->id}}">
                                <button type="submit" class="btn btn-sm btn-outline-secondary rounded-pill"><i class="fa-solid fa-xmark"></i></button>
                                </form>
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
                                <p class="mb-1 text-muted"><a href="{{route('user_index', ['nickname' => $notification->responser_nickname])}}"><strong>{{'@'.$notification->responser_nickname}}</strong> </a> adicionou um novo item ao tema <em>"<a href="{{$notification->text}}">{{ $notification->theme_name }}</a>"</em>: <a href="{{$notification->route}}"><strong>{{ $notification->name }}</strong></a> </p>
                                @if(isset($notification->created_at))
                                <small class="text-muted">{{ $notification->created_at->diffForHumans() }}</small>
                                @endif
                            </div>
                            <div class="ms-3">
                                <form action="{{route('notification_destroy')}}" method="POST">
                                @csrf    
                                @METHOD('DELETE')
                                <input type="hidden" name="id" value="{{$notification->id}}">
                                <button type="submit" class="btn btn-sm btn-outline-secondary rounded-pill"><i class="fa-solid fa-xmark"></i></button>
                                </form>
                            </div>
                        </div>
                    </div>
                @endif
            @endforeach
        @else
        <h4>Sem novas notificações</h4>
        @endif
    @endif

    

</div>


@endsection