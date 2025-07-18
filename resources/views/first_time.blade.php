{{--
    Importação inicial do projeto.
    Serve pra pegar o layout da página principal, e aplicar em cada view em que será extendido.
--}}
@extends('layouts.main')
@section('content')

@if ($validate == 'editor')
@section('title', 'Tutorial - Editor')
<div class="container my-5 d-flex justify-content-center">
    <div class="card shadow-lg" style="max-width: 500px;">
        <div class="card-body">
            <h5 class="card-title"> Editor </h5>
            <div class="card-text">
                <p>
                    Nessa parte, você tem pode fazer algumas coisas interessantes:
                </p>
                <p>
                    1 - Editar sua página inicial;
                </p>
                <p>
                    2 - Editar ou excluir um tema que você criou.
                </p>

            </div>
            <div class="d-grid">
                <a href="{{ $route }}" class="btn btn-primary">Continuar</a>
            </div>
        </div>
    </div>
</div>
@elseif ($validate == 'generic')
@section('title', 'Tutorial - Temas')
<div class="container my-5 d-flex justify-content-center">
    <div class="card shadow-lg" style="max-width: 500px;">
        <div class="card-body">
            <h5 class="card-title"> Temas </h5>
            <div class="card-text">
                <p>
                    Aqui você poder todos os itens criados dentro do tema escolhido (se tiver algum item)
                </p>
                <p>
                    A estrutura de compatilhamento funciona da seguinte forma: Você tem o Tema, dentro de cada tema, temos os itens, e dentro de cada item, temos o conteúdo de cada item.
                </p>
                <p>
                    Exemplo:
                    <li>
                        Tema escolhido: Jogos
                    </li>
                    <li>
                        Item do tema: Super Mario
                    </li>
                    <li>
                        Dentro desse item, você tem conteúdos relacionados ao Jogo Super mario.
                    </li>
                </p>

            </div>
            <div class="d-grid">
                <a href="{{ $route }}" class="btn btn-primary">Continuar</a>
            </div>
        </div>
    </div>
</div>
@elseif ($validate == 'index')
@section('title', 'Tutorial - Página Inicial')
<div class="container my-5 d-flex justify-content-center">
    <div class="card shadow-lg" style="max-width: 500px;">
        <div class="card-body">
            <h5 class="card-title"> Página Inicial </h5>
            <div class="card-text">
                <p>
                    Bem vindo(a) ao site Nexus!
                </p>
                <p>
                    Na primeira vez que você entra em cada página, você verá um tutorial como essse, que ensina como funciona o site, além de apresentar as funcionalidades.
                </p>
                <h5> Sobre a Página Inicial</h5>
                <p>
                    Na página inicial, assim que entrar pela primeira vez, você verá algumas recomendações de alguns Temas criados pela comunidade, para você dar uma olhada.
                </p>
                <p>
                    Você também verá uma parte que mostra as Páginas de Boas Vindas dos usuários em si, para descobrir mais daquele criador!
                </p>
                <p>
                    Crie, explore, compartilhe com outros usuários, e divirta-se!
                </p>
                <p>

                </p>

            </div>
            <div class="d-grid">
                <a href="{{ $route }}" class="btn btn-primary">Continuar</a>
            </div>
        </div>
    </div>
</div>
@elseif ($validate == 'indexcreator')
@section('title', 'Tutorial - Criar Pagina de boas vindas')
<div class="container my-5 d-flex justify-content-center">
    <div class="card shadow-lg" style="max-width: 500px;">
        <div class="card-body">
            <h5 class="card-title"> Página de Boas Vindas </h5>
            <div class="card-text">
                <p>
                    Aqui, você da início à sua jornada de criador no site!
                </p>
                <p>
                    Crie sua página inicial, para prosseguir na criação dos seus próprios temas!
                </p>
            </div>
            <div class="d-grid">
                <a href="{{ $route }}" class="btn btn-primary">Continuar</a>
            </div>
        </div>
    </div>
</div>
@elseif ($validate == 'indexeditor')
@section('title', 'Tutorial - Editar página de boas vindas')
<div class="container my-5 d-flex justify-content-center">
    <div class="card shadow-lg" style="max-width: 500px;">
        <div class="card-body">
            <h5 class="card-title"> Editar Página de Boas vindas </h5>
            <div class="card-text">
                <p>
                    Caso tenha se arrependido de algo, ou deseja fazer alguma mudança, você pode editar sua página de boas vindas do jeito que quiser.
                </p>

            </div>
            <div class="d-grid">
                <a href="{{ $route }}" class="btn btn-primary">Continuar</a>
            </div>
        </div>
    </div>
</div>
@elseif ($validate == 'main')
@section('title', 'Tutorial - Página de boas vindas')
<div class="container my-5 d-flex justify-content-center">
    <div class="card shadow-lg" style="max-width: 500px;">
        <div class="card-body">
            <h5 class="card-title"> Página de Boas Vindas </h5>
            <div class="card-text">
                <p>
                    Aqui você verá informaçoes como a quantidade de Temas criados pelo usuário, Quantos seguidores ele tem, e quantos usuários ele segue.
                </p>
                <p>
                    Essa página mostra todos os Temas de cada usuário para você navegar por eles. Quem sabe o que você descobre de novo?
                </p>
                <p>
                    Além disso, você pode seguir o usuário se quiser, para acompanhar suas futuras atualizações, sejam Temas novos, Itens novos, ou até mesmo, conteúdos novos de um item.
                </p>

            </div>
            <div class="d-grid">
                <a href="{{ $route }}" class="btn btn-primary">Continuar</a>
            </div>
        </div>
    </div>
</div>
@elseif ($validate == 'veja')
@section('title', 'Tutorial - Ver Conteúdo')
<div class="container my-5 d-flex justify-content-center">
    <div class="card shadow-lg" style="max-width: 500px;">
        <div class="card-body">
            <h5 class="card-title"> Ver Conteúdo de um Item </h5>
            <div class="card-text">
                <p>
                    Essa página mostra o conteúdo de cada item que o usuário quis compartilhar com todos!
                </p>
                <p>
                    Exemplo: O item Harry Potter (de um tema Filmes) pode apresentar um conteúdo como: Introdução, Sobre a História, Curiosidades, O que achei do filme?, etc.
                </p>
                <p>
                    O usuário é livre pra adicionar o conteúdo que ele quiser dentro de um item.
                </p>

            </div>
            <div class="d-grid">
                <a href="{{ $route }}" class="btn btn-primary">Continuar</a>
            </div>
        </div>
    </div>
</div>
@elseif ($validate == 'vejaeditor')
@section('title', 'Tutorial - Editar Conteúdo')
<div class="container my-5 d-flex justify-content-center">
    <div class="card shadow-lg" style="max-width: 500px;">
        <div class="card-body">
            <h5 class="card-title"> Editar Conteúdo(s) de um Item </h5>
            <div class="card-text">
                <p>
                    Aqui você tem acesso à página de edição de todos os conteúdos de um item que você adicionou.
                </p>
                <p>
                    Basta escolher o Bloco de Conteúdo que deseja editar ou excluir, e continuar navegando.
                </p>

            </div>
            <div class="d-grid">
                <a href="{{ $route }}" class="btn btn-primary">Continuar</a>
            </div>
        </div>
    </div>
</div>
@elseif ($validate == 'base_create')
@section('title', 'Tutorial - Criar Item')
<div class="container my-5 d-flex justify-content-center">
    <div class="card shadow-lg" style="max-width: 500px;">
        <div class="card-body">
            <h5 class="card-title"> Criar Item </h5>
            <div class="card-text">
                <p>
                    Após você criar seu primeiro tema, nada melhor que adicionar o primeiro item daquele tema!
                </p>
                <p>
                    Você pode adicionar um título, uma descrição breve do que será abordado, e uma imagem para atrair o público.
                </p>
                <p>
                    Boa sorte na criação do item!
                </p>

            </div>
            <div class="d-grid">
                <a href="{{ $route }}" class="btn btn-primary">Continuar</a>
            </div>
        </div>
    </div>
</div>
@elseif ($validate == 'base_edit')
@section('title', 'Tutorial - Editar Item')
<div class="container my-5 d-flex justify-content-center">
    <div class="card shadow-lg" style="max-width: 500px;">
        <div class="card-body">
            <h5 class="card-title"> Editar Item </h5>
            <div class="card-text">
                <p>
                    Caso tenha se arrependido de algo, ou deseja fazer alguma mudança, você pode editar seu item do jeito que quiser.
                </p>

            </div>
            <div class="d-grid">
                <a href="{{ $route }}" class="btn btn-primary">Continuar</a>
            </div>
        </div>
    </div>
</div>
@elseif ($validate == 'block_create')
@section('title', 'Tutorial - Criar Conteúdo')
<div class="container my-5 d-flex justify-content-center">
    <div class="card shadow-lg" style="max-width: 500px;">
        <div class="card-body">
            <h5 class="card-title"> Criar um bloco de conteúdo </h5>
            <div class="card-text">
                <p>
                    Não é interessante deixar um item vazio após sua criação. E é exatamente por esse motivo, que você adiciona os Blocos de Conteúdo para compartilhar suas ideias daquele item.
                </p>
                <p>
                    A criação do bloco de conteúdo consiste basicamente em: Título, texto e uma imagem (opcional).
                </p>
                <p>
                    Você pode adicionar quantos Blocos você quiser em cada item! Divirta-se na criação!
                </p>

            </div>
            <div class="d-grid">
                <a href="{{ $route }}" class="btn btn-primary">Continuar</a>
            </div>
        </div>
    </div>
</div>
@elseif ($validate == 'block_edit')
@section('title', 'Tutorial - Editar conteúdo')
<div class="container my-5 d-flex justify-content-center">
    <div class="card shadow-lg" style="max-width: 500px;">
        <div class="card-body">
            <h5 class="card-title"> Editar um bloco de conteúdio </h5>
            <div class="card-text">
                <p>
                    Caso tenha se arrependido de algo, ou deseja fazer alguma mudança, você pode editar seu bloco de conteúdo do jeito que quiser do jeito que quiser.
                </p>

            </div>
            <div class="d-grid">
                <a href="{{ $route }}" class="btn btn-primary">Continuar</a>
            </div>
        </div>
    </div>
</div>
@elseif ($validate == 'generic_create')
@section('title', 'Tutorial - Criar Tema')
<div class="container my-5 d-flex justify-content-center">
    <div class="card shadow-lg" style="max-width: 500px;">
        <div class="card-body">
            <h5 class="card-title"> Criar tema </h5>
            <div class="card-text">
                <p>
                    Para dar início ao compartilhamento das coisas de seu interesse, você deve primeiro, criar um Tema a ser abordado.
                </p>
                <p>
                    A estrutura de compatilhamento funciona da seguinte forma: Você tem o Tema, dentro de cada tema temos os itens, e dentro de cada item, temos o conteúdo de cada item.
                </p>
                <p>
                    Exemplo:
                    <li>
                        Tema: Jogos
                    </li>
                    <li>
                        Item do tema: Super Mario
                    </li>
                    <li>
                        Dentro desse item, você tem conteúdos relacionados ao Jogo Super mario.
                    </li>
                </p>
                <p>
                    Divirta-se no compartilhamento!
                </p>

            </div>
            <div class="d-grid">
                <a href="{{ $route }}" class="btn btn-primary">Continuar</a>
            </div>
        </div>
    </div>
</div>
@elseif ($validate == 'generic_edit')
@section('title', 'Tutorial - Editar tema')
<div class="container my-5 d-flex justify-content-center">
    <div class="card shadow-lg" style="max-width: 500px;">
        <div class="card-body">
            <h5 class="card-title"> Editar tema </h5>
            <div class="card-text">
                <p>
                    Caso tenha se arrependido de algo, ou deseja fazer alguma mudança, você pode editar seu tema do jeito que quiser.
                </p>

            </div>
            <div class="d-grid">
                <a href="{{ $route }}" class="btn btn-primary">Continuar</a>
            </div>
        </div>
    </div>
</div>
@endif


@endsection