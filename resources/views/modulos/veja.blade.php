{{--
    Importação inicial do projeto.
    Serve pra pegar o layout da página principal, e aplicar em cada view em que será extendido.
--}}
@extends('layouts.main')
@section('title', 'Sobre '.$item->name)
@section('content')

<!-- forma padrao de um bloco, com titulo, texto e imagem -->
<!-- ideia do leandro: ir alternando onde a imagem fica, uma vez na esquerda, outra na direita -->
<div class="container-fluid my-4">


    {{--$_COOKIE
        Caso não tenha conteúdo para ser mostrado
    --}}
    @if ($db_url->isEmpty())

    {{--$_COOKIE
        Verifica se o usuário NÃO está logado
    --}}
    @if (!Auth::check())
    <h4 class="text-center">Sem conteúdos para mostrar</h4>

    {{--$_COOKIE
        Caso NÃO seja o criador
    --}}
    @elseif (Auth::user()->nickname != $nickname)
    <h4 class="text-center">Sem conteúdos para mostrar</h4>

    {{--$_COOKIE
        Caso seja o criador
    --}}
    @else
    <h2 class="text-center text-dark">Não tem nenhum Conteúdo? Adicione algum!</h2>
    <div class="row mt-4">
        <div class="col text-end">
            <form action="{{route('content_create', ['nickname' => $nickname, 'category_name_slug' => $category_name_slug, 'item_name_slug' => $item_name_slug])}}" method="get">
                @csrf
                <button type="submit" class="btn btn-outline-primary">Adicionar Novo Bloco de Conteúdo</button>
            </form>
        </div>
    </div>
    @endif

    @else

    @foreach ($db_url as $f)

    {{--$_COOKIE
        Caso tenha imagem naquele bloco de conteúdo.

        se tiver, o texto ficará um pouco para o lado, enquando a imagem fica do lado.
        Caso não tenha, o texto ocupará a tela inteira.
    --}}
    @if ($f->image)
    <div class="row mb-4 my-4">
        <div class="col-md-9 d-flex flex-column justify-content-center text-break">
            <h2 class="text-center text-dark">
                {{$f->name}}
            </h2>
            @php
            $paragraphs = preg_split('/\r\n|\n|\r/', $f->description);
            @endphp

            @foreach($paragraphs as $paragraph)
            <p class="text-center text-dark">
                {{ $paragraph }}
            </p>
            @endforeach
        </div>
        <div class="col-md-3 d-flex align-items-center justify-content-center bg-light"
            style="max-width: 286px; max-height: 286px; overflow: hidden;">
            <img src="/images/{{$nickname}}/categories/{{$id}}/item/{{$f->item_id}}/{{$f->image}}" alt="Profile" class="img-fluid"
                style="object-fit: cover;">
        </div>
    </div>
    @else
    <div class="row mb-4 my-4">
        <div class="col-md-12 d-flex flex-column justify-content-center text-break">
            <h2 class="text-center text-dark">
                {{$f->name}}
            </h2>
            @php
            $paragraphs = preg_split('/\r\n|\n|\r/', $f->description);
            @endphp

            @foreach($paragraphs as $paragraph)
            <p class="text-center text-dark">
                {{ $paragraph }}
            </p>
            @endforeach
        </div>
    </div>
    @endif
    @endforeach
    {{--$_COOKIE
        Verifica se tem um usuário logado, e se tiver, verifica também se ele é o usuário criador
    --}}
    @if (Auth::check() && Auth::user()->nickname == $nickname)
    <div class="d-flex justify-content-center gap-3 float-end my-4">
        <a href="{{route('item_editor', ['nickname' => $nickname, 'category_name_slug' => $category_name_slug, 'item_name_slug' => $item_name_slug])}}"
            class="btn btn-outline-primary">Editor</a>
        <form action="{{route('content_create', ['nickname' => $nickname, 'category_name_slug' => $category_name_slug, 'item_name_slug' => $item_name_slug])}}" method="get">
            @csrf
            <button type="submit" class="btn btn-outline-primary">Adicionar
                Novo Conteúdo</button>
        </form>
    </div>
    @endif


    {{---

        Area reservada para fazer o sistema de comentarios.
        dentro do primeiro IF, ou seja, precisa ter conteudo no item para alguem poder comentar sobre.
    
    ---}}

    <br>
    <br>
    <br>
    <div class="container my-5">
        <div class="card border-0 shadow-sm">
            <div class="card-header bg-primary text-white">
                <h4 class="mb-0">
                    <i class="fas fa-comments me-2"></i>Seção de Comentários
                </h4>
            </div>

            <div class="card-body">
                @if (count($comments) <= 0)
                    <div class="text-center py-5">
                    <i class="far fa-comment-slash text-muted fa-3x mb-3"></i>
                    <h4 class="text-muted">Nenhum comentário ainda...</h4>
                    <p class="text-muted">Seja o primeiro a comentar!</p>
            </div>
            @endif

            @if (Auth::check())
            <div class="mb-4 p-3 bg-light rounded">
                <form action="{{route('add_comment_0', ['nickname' => $nickname, 'category_name_slug' => $category_name_slug, 'item_name_slug' => $item_name_slug])}}" method="post">
                    @csrf
                    <div class="mb-3">
                        <label for="autoTextarea" class="form-label text-muted small">Adicionar comentário</label>
                        <textarea id="autoTextarea" name="text" class="form-control" placeholder="Digite seu comentário aqui..." rows="3" style="overflow:hidden; resize: none;"></textarea>
                    </div>
                    <div class="d-flex justify-content-end">
                        <button class="btn btn-primary" type="submit">
                            <i class="fas fa-paper-plane me-1"></i> Enviar
                        </button>
                    </div>
                </form>
            </div>
            @endif

            @if (($comments != null))
            <div class="comments-section">
                @foreach ($comments as $comment)
                <div class="comment mb-4 p-3 border rounded">
                    <div class="d-flex justify-content-between align-items-center mb-2">
                        <div class="d-flex align-items-center">
                            <div class="user-avatar me-2">
                                <i class="fas fa-user-circle fa-2x text-secondary"></i>
                            </div>
                            <div>
                                <a href="{{route('user_index', ['nickname' => $comment->author_name])}}" class="text-decoration-none text-dark"><strong class="d-block">{{ '@'.$comment->author_name }}</strong></a>
                                <small class="text-muted">{{ $comment->created_at->format('d/m/Y H:i') }}</small>
                            </div>
                        </div>
                        <div>
                            <small class="text-muted">{{ $comment->created_at->diffForHumans() }}</small>
                        </div>
                    </div>

                    <div class="comment-text mb-3">
                        @php
                        $paragraphs = preg_split('/\r\n|\n|\r/', $comment->text);
                        @endphp

                        @foreach($paragraphs as $paragraph)
                        <p class="mb-1">{{ $paragraph }}</p>
                        @endforeach
                    </div>

                    <div class="comment-actions">
                        @auth
                        <button class="btn btn-sm btn-outline-primary me-2" onclick="mostrarResposta(this)">
                            <i class="fas fa-reply me-1"></i> Responder
                        </button>
                        @endauth

                        @if (count($comment->responses) > 0)
                        <button class="btn btn-sm btn-outline-secondary" onclick="mostrarRespostas(this)">
                            <i class="fas fa-comments me-1"></i> Ver respostas ({{ count($comment->responses) }})
                        </button>
                        @endif
                    </div>

                    <!-- Formulário de resposta -->
                    <div class="resposta-form mt-3" style="display: none;">
                        <form action="{{ route('add_comment_1', ['nickname' => $nickname, 'category_name_slug' => $category_name_slug, 'item_name_slug' => $item_name_slug]) }}" method="post">
                            @csrf
                            <div class="mb-3">
                                <textarea name="text" class="form-control" placeholder="Digite sua resposta aqui..." rows="2" style="overflow:hidden; resize: none;"></textarea>
                                <input type="hidden" name="response_to" value="{{$comment->id}}">
                                <input type="hidden" name="response_to_commenter" value="{{$comment->id_commenter}}">
                            </div>
                            <div class="d-flex justify-content-end">
                                <button class="btn btn-primary btn-sm" type="submit">
                                    <i class="fas fa-paper-plane me-1"></i> Enviar resposta
                                </button>
                            </div>
                        </form>
                    </div>

                    <!-- Respostas nível 1 -->
                    <div class="responses mt-3" style="display: none;">
                        @foreach ($comment->responses as $responses)
                        <div class="response mb-3 ps-3 border-start">
                            <div class="d-flex justify-content-between align-items-center mb-2">
                                <div class="d-flex align-items-center">
                                    <div class="user-avatar me-2">
                                        <i class="fas fa-user-circle fa-lg text-secondary"></i>
                                    </div>
                                    <div>
                                        <a href="{{route('user_index', ['nickname' => $responses->author_name])}}" class="text-decoration-none text-dark"><strong class="d-block">{{ '@'.$responses->author_name }}</strong></a>
                                        <small class="text-muted">{{ $responses->created_at->format('d/m/Y H:i') }}</small>
                                    </div>
                                </div>
                                <div>
                                    <small class="text-muted">{{ $responses->created_at->diffForHumans() }}</small>
                                </div>
                            </div>

                            <div class="response-text mb-3">
                                @php
                                $paragraphs = preg_split('/\r\n|\n|\r/', $responses->text);
                                @endphp

                                @foreach($paragraphs as $paragraph)
                                <p class="mb-1">{{ $paragraph }}</p>
                                @endforeach
                            </div>

                            <div class="response-actions">
                                @auth
                                <button class="btn btn-sm btn-outline-success me-2" onclick="mostrarResposta(this)">
                                    <i class="fas fa-reply me-1"></i> Responder
                                </button>
                                @endauth

                                @if (count($responses->responses2) > 0)
                                <button class="btn btn-sm btn-outline-secondary" onclick="mostrarRespostas(this)">
                                    <i class="fas fa-comments me-1"></i> Ver respostas ({{ count($responses->responses2) }})
                                </button>
                                @endif
                            </div>

                            <!-- Formulário de resposta nível 2 -->
                            <div class="resposta-form mt-3" style="display: none;">
                                <form action="{{ route('add_comment_2', ['nickname' => $nickname, 'category_name_slug' => $category_name_slug, 'item_name_slug' => $item_name_slug]) }}" method="post">
                                    @csrf
                                    <div class="mb-3">
                                        <textarea name="text" class="form-control" placeholder="Digite sua resposta aqui..." rows="2" style="overflow:hidden; resize: none;"></textarea>
                                        <input type="hidden" name="response_to" value="{{$responses->id}}">
                                        <input type="hidden" name="response_to_commenter" value="{{$responses->id_commenter}}">
                                    </div>
                                    <div class="d-flex justify-content-end">
                                        <button class="btn btn-success btn-sm" type="submit">
                                            <i class="fas fa-paper-plane me-1"></i> Enviar resposta
                                        </button>
                                    </div>
                                </form>
                            </div>

                            <!-- Respostas nível 2 -->
                            <div class="responses mt-3" style="display: none;">
                                @foreach ($responses->responses2 as $responses2)
                                <div class="response mb-3 ps-3 border-start">
                                    <div class="d-flex justify-content-between align-items-center mb-2">
                                        <div class="d-flex align-items-center">
                                            <div class="user-avatar me-2">
                                                <i class="fas fa-user-circle text-secondary"></i>
                                            </div>
                                            <div>
                                                <a href="{{route('user_index', ['nickname' => $responses2->author_name])}}" class="text-decoration-none text-dark"><strong class="d-block">{{ '@'.$responses2->author_name }}</strong></a>
                                                <small class="text-muted">{{ $responses2->created_at->format('d/m/Y H:i') }}</small>
                                            </div>
                                        </div>
                                        <div>
                                            <small class="text-muted">{{ $responses2->created_at->diffForHumans() }}</small>
                                        </div>
                                    </div>

                                    <div class="response-text">
                                        @php
                                        $paragraphs = preg_split('/\r\n|\n|\r/', $responses2->text);
                                        @endphp

                                        @foreach($paragraphs as $paragraph)
                                        <p class="mb-1">{{ $paragraph }}</p>
                                        @endforeach
                                    </div>
                                </div>
                                @endforeach
                            </div>
                        </div>
                        @endforeach
                    </div>
                </div>
                @endforeach
            </div>
            @endif
        </div>
    </div>
</div>

<script>
    function mostrarResposta(botao) {
        const form = botao.closest('.comment-actions, .response-actions').nextElementSibling;
        form.style.display = form.style.display === "none" ? "block" : "none";
    }

    function mostrarRespostas(botao) {
        const responsesContainer = botao.closest('.comment-actions, .response-actions').parentElement.querySelector('.responses');
        responsesContainer.style.display = responsesContainer.style.display === "none" ? "block" : "none";

        // Atualizar ícone do botão
        const icon = botao.querySelector('i');
        if (responsesContainer.style.display === "block") {
            icon.classList.remove('fa-comments');
            icon.classList.add('fa-comment-slash');
        } else {
            icon.classList.remove('fa-comment-slash');
            icon.classList.add('fa-comments');
        }
    }

    // Auto-resize textareas
    document.querySelectorAll('textarea').forEach(textarea => {
        textarea.addEventListener('input', function() {
            this.style.height = 'auto';
            this.style.height = (this.scrollHeight) + 'px';
        });
    });
</script>

<style>
    .comment,
    .response {
        transition: all 0.3s ease;
    }

    .comment:hover,
    .response:hover {
        box-shadow: 0 0.125rem 0.25rem rgba(0, 0, 0, 0.075);
    }

    .border-start {
        border-left: 3px solid #dee2e6 !important;
    }

    .user-avatar {
        width: 32px;
        text-align: center;
    }
</style>





@endif

</div>
@endsection