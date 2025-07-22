{{--
    Importação inicial do projeto.
    Serve pra pegar o layout da página principal, e aplicar em cada view em que será extendido.
--}}
@extends('layouts.main')
@section('title', 'Editor de '.$nickname)
@section('content')

<div class="container py-4">
  <div class="row">
    <div class="col">
      <h2 class="mb-3 text-primary">
        <i class="fas fa-home me-2"></i>Página Inicial
      </h2>
      <div class="d-flex justify-content-end">
        <form action="{{ route('user_edit', ['nickname' => $nickname]) }}" method="get">
          @csrf
          <button type="submit" class="btn btn-warning">
            <i class="fas fa-edit me-1"></i>Editar Página Inicial
          </button>
        </form>
      </div>
    </div>
  </div>

  <div class="row mt-5">
    <div class="col">
      <h2 class="mb-4 text-success">
        <i class="fas fa-palette me-2"></i>Temas
      </h2>

      @if ($themes_foreach->isEmpty())
        <h4 class="text-center text-muted">
          <i class="fas fa-folder-open me-2"></i>Sem Temas!
        </h4>
      @else
        @foreach ($themes_foreach as $f)
          <div class="card border-0 rounded-4 shadow mb-4">
            <div class="banner">
              @if($f->image !==null)
                <img src="/images/{{$f->user_nickname}}/categories/banners/{{$f->image}}" alt="Profile">
              @else
                <img src="/default/banner-default.jpg" alt="Profile">
              @endif
              <div class="overlay">
                <h4 class="card-title title">
                  {{$f->name}}
                </h4>
                <div class="d-flex gap-2">
                  <form action="{{ route('category_edit', ['nickname' => $nickname, 'category_name_slug' => $f->name_slug]) }}" method="get">
                    @csrf
                    <button type="submit" class="btn btn-warning btn-sm">
                      <i class="fas fa-edit me-1"></i>Editar
                    </button>
                  </form>
                  <form action="{{ route('category_destroy', ['nickname' => $nickname]) }}" method="post">
                    @csrf
                    @method('DELETE')
                    <input type="hidden" name="id" value="{{$f->id}}">
                    <button type="submit" class="btn btn-danger btn-sm">
                      <i class="fas fa-trash me-1"></i>Excluir
                    </button>
                  </form>
                </div>
              </div>
            </div>
          </div>

          <style>
            .banner {
              width: 100%;
              height: 140px;
              overflow: hidden;
              position: relative;
              border-radius: 8px;
              background-color: white;
            }

            .banner img {
              width: 100%;
              height: 100%;
              object-fit: cover;
              position: absolute;
              top: 0;
              left: 0;
            }

            .overlay {
              position: absolute;
              top: 0;
              left: 0;
              width: 100%;
              height: 100%;
              display: flex;
              align-items: center;
              justify-content: space-between;
              padding: 0 20px;
              background: rgba(0, 0, 0, 0.5);
              color: white;
            }

            .title {
              margin: 0;
              font-size: 1.2rem;
              font-weight: bold;
              text-shadow: 2px 2px 4px rgba(0, 0, 0, 1);
            }

            .no-image {
              background-color: #f0f0f0 !important;
            }

            .no-image .overlay {
              background: none;
              color: black !important;
              text-shadow: none;
            }

            .btn-dark {
              background-color: #343a40;
              border-color: #23272b;
            }

            .btn-dark:hover {
              background-color: #23272b;
              border-color: #1d2124;
            }
          </style>
        @endforeach
      @endif
    </div>
  </div>

  <div class="row my-5">
    <div class="d-flex justify-content-center gap-3">
      <form action="{{ route('category_create', ['nickname' => $nickname]) }}" method="get">
        @csrf
        <button type="submit" class="btn btn-outline-primary">
          <i class="fas fa-plus-circle me-1"></i>Adicionar Novo Tema
        </button>
      </form>
    </div>
  </div>
</div>


@endsection