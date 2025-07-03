<?php

namespace App\Http\Controllers;

use App\Models\Category;
use App\Models\User;
use App\Models\Comment;
use App\Models\Item;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Redirect;
use Illuminate\Support\Facades\Auth;

class ItemController extends Controller
{

    function index($nickname, $category_name_slug, $item_name_slug)
    {

        $cat = Category::where('name_slug', $category_name_slug)->where('user_nickname', $nickname)->first();
        // contents daquele item daquela category
        $item = Item::where('name_slug', $item_name_slug)->where('category_id', $cat->id)->first();

        if (!$item) {
            # code...
            return Redirect::to(route('category_index', ['nickname' => $nickname, 'category_name_slug' => $category_name_slug]))
                ->with('msg-warning', "Item não encontrado!");
        }

        $db_url = $item->contents()->get();

        //id da categoria
        $id = $item->category_id;

        // id do item
        $item_name_slug = $item->name_slug;

        //comentarios
        $comments = Comment::where('id_item', $item->id)->where('comment_level', 0)->get();
        if ($comments != null) {
            foreach ($comments as $key => $value) {
                $user = User::where('id', $value->id_commenter)->first();
                $value->author_name = $user->nickname;

                //verificando respostas a este comentário
                $value->responses = Comment::where('id_item', $item->id)->where('response_to', $value->id)->get();
                if ($value->responses) {
                    foreach ($value->responses as $key => $response) {
                        $user_r = User::where('id', $response->id_commenter)->first();
                        $response->author_name = $user_r->nickname;

                        //verificando respostas a este comentário
                        $response->responses2 = Comment::where('id_item', $item->id)->where('response_to', $response->id)->get();
                        if ($response->responses2) {
                            foreach ($response->responses2 as $key => $response2) {
                                $user_r2 = User::where('id', $response2->id_commenter)->first();
                                $response2->author_name = $user_r2->nickname;
                            }
                        }
                    }
                }
            };
        }

        return view('modulos.veja', [
            'item' => $item,
            'db_url' => $db_url,
            'id' => $id,
            'item_name_slug' => $item_name_slug,
            'nickname' => $nickname,
            'category_name_slug' => $category_name_slug,
            'comments' => $comments
        ]);
    }

    function create($nickname, $category_name_slug)
    {
        // nome da categoria que vai ser adicionada um item
        $cat = Category::where('name_slug', $category_name_slug)->where('user_nickname', $nickname)->first();

        if (!$cat) {
            # code...
            return Redirect::to(route('user_index', ['nickname' => $nickname]))
                ->with('msg-warning', "categoria não encontrada!");
        }
        $page = $cat->name;

        // id da categoria (theme)
        $id = $cat->id;

        return view('modulos.base.create', [
            'page' => $page,
            'id' => $id,
            'nickname' => $nickname,
            'cat' => $cat,
            'category_name_slug' => $category_name_slug
        ]);
    }

    function store(Request $request, $nickname, $category_name_slug)
    {

        //  protected $fillable = ['name', 'description', 'image', 'category_id'];]

        $request->validate([
            'name' => 'required|string|max:50',
            'description' => 'required|string|max:255',
            'image' => 'nullable|image|mimes:png,jpg,svg,jpeg,gif|max:2048'
        ], [
            'name.max' => 'Tamanho máximo de 50 caracteres excedido',
            'name.string' => 'O conteúdo deve ser um texto',
            'description.max' => 'Tamanho máximo de 255 caracteres excedido',
            'description.string' => 'O conteúdo deve ser um texto',
            'image.required' => 'Você precisa enviar uma imagem',
            'image.image' => 'O conteúdo deve ser uma imagem',
            'image.mimes' => 'São aceitos somente os formatos jpeg, jpg, png, gif e svg',
            'image.max' => 'O tamanho máximo permitido é 2MB',
        ]);

        $cat = Category::where('name_slug', $category_name_slug)->where('user_nickname', $nickname)->first();

        $verify = Item::where('name_slug', str($request->name)->slug())->where('category_id', $cat->id)->first();;
        if ($verify) {
            return Redirect::to(route('item_create', ['nickname' => $nickname, 'category_name_slug' => $category_name_slug]))
                ->with('msg-warning', 'Já existe um item com esse nome!');
        }

        $item = new Item;
        $item->name = $request->name;
        $item->name_slug = str($request->name)->slug();
        $item->description = $request->description;


        // validando a imagem

        if ($request->hasFile('image') && $request->file('image')->isValid()) {
            $image = $request->file('image');
            $extension = $image->getClientOriginalExtension();
            $data = strtotime('now');
            $path_image = md5($image->getClientOriginalName()) . '_' . $data . '.' . $extension;
            $image->move(public_path('images/' . $nickname . '/categories/' . $request->id . '/items'), $path_image);
            $item->image = $path_image;
        }

        $item->category_id = $request->id;
        $item->likes = [];
        $item->dislikes = [];
        $item->save();


        return Redirect::to(route('category_index', ['nickname' => $nickname, 'category_name_slug' => $category_name_slug]))
            ->with('msg-success', "Item criado com sucesso!");
    }


    function edit($nickname, $category_name_slug, $item_name_slug)
    {
        // nome da categoria que vai ser modificada um item
        $cat = Category::where('name_slug', $category_name_slug)->where('user_nickname', $nickname)->first();
        if (!$cat) {
            # code...
            return Redirect::to(route('user_index', ['nickname' => $nickname]))
                ->with('msg-warning', "categoria não encontrada!");
        }
        $page = $cat->name;
        // id da categoria (theme)
        $id = $cat->id;

        // informações sobre aquele item
        $cat = Category::where('name_slug', $category_name_slug)->where('user_nickname', $nickname)->first();
        $db = Item::where('name_slug', $item_name_slug)->where('category_id', $cat->id)->first();

        return view('modulos.base.edit', [
            'page' => $page,
            'id' => $id,
            'db' => $db,
            'cat' => $cat,
            'nickname' => $nickname,
            'category_name_slug' => $category_name_slug
        ]);
    }

    function like($nickname, $category_name_slug, $item_name_slug)
    {
        // nome da categoria que vai ser modificada um item
        $cat = Category::where('name_slug', $category_name_slug)->where('user_nickname', $nickname)->first();
        if (!$cat) {
            # code...
            return Redirect::to(route('user_index', ['nickname' => $nickname]))
                ->with('msg-warning', "categoria não encontrada!");
        }

        // informações sobre aquele item
        $cat = Category::where('name_slug', $category_name_slug)->where('user_nickname', $nickname)->first();
        $item = Item::where('name_slug', $item_name_slug)->where('category_id', $cat->id)->first();


        $dislikes = $item->dislikes;

        // verifica se o elemento ja deu dislike anteriormente
        $key = array_search(Auth::id(), $dislikes);

        // caso tenha dado, ele tira esse dislike, e laika
        unset($dislikes[$key]);
        $dislikes = array_values($dislikes);
        $item->dislikes = $dislikes;

        $likes = $item->likes;
        $likes[] = Auth::id();

        $item->likes = $likes;
        $item->save();

        return Redirect::to(route('category_index', ['nickname' => $nickname, 'category_name_slug' => $category_name_slug]))
            ->with('msg-success', "Item marcado como LIKE com sucesso!");
    }
    function unlike($nickname, $category_name_slug, $item_name_slug)
    {
        // nome da categoria que vai ser modificada um item
        $cat = Category::where('name_slug', $category_name_slug)->where('user_nickname', $nickname)->first();
        if (!$cat) {
            # code...
            return Redirect::to(route('user_index', ['nickname' => $nickname]))
                ->with('msg-warning', "categoria não encontrada!");
        }

        // informações sobre aquele item
        $cat = Category::where('name_slug', $category_name_slug)->where('user_nickname', $nickname)->first();
        $item = Item::where('name_slug', $item_name_slug)->where('category_id', $cat->id)->first();

        $likes = $item->likes;

        $key = array_search(Auth::id(), $likes);
        unset($likes[$key]);

        $likes = array_values($likes);

        $item->likes = $likes;
        $item->save();

        return Redirect::to(route('category_index', ['nickname' => $nickname, 'category_name_slug' => $category_name_slug]))
            ->with('msg-success', "Item desmarcado como LIKE com sucesso!");
    }

    function dislike($nickname, $category_name_slug, $item_name_slug)
    {
        // nome da categoria que vai ser modificada um item
        $cat = Category::where('name_slug', $category_name_slug)->where('user_nickname', $nickname)->first();
        if (!$cat) {
            # code...
            return Redirect::to(route('user_index', ['nickname' => $nickname]))
                ->with('msg-warning', "categoria não encontrada!");
        }

        // informações sobre aquele item
        $cat = Category::where('name_slug', $category_name_slug)->where('user_nickname', $nickname)->first();
        $item = Item::where('name_slug', $item_name_slug)->where('category_id', $cat->id)->first();


        $likes = $item->likes;

        // verifica se o elemento ja deu like anteriormente
        $key = array_search(Auth::id(), $likes);

        // caso tenha dado, ele tira esse like, e dislaika
        unset($likes[$key]);
        $likes = array_values($likes);
        $item->likes = $likes;

        $dislikes = $item->dislikes;
        $dislikes[] = Auth::id();

        $item->dislikes = $dislikes;
        $item->save();

        return Redirect::to(route('category_index', ['nickname' => $nickname, 'category_name_slug' => $category_name_slug]))
            ->with('msg-success', "Item marcado como DISLIKE com sucesso!");
    }
    function undislike($nickname, $category_name_slug, $item_name_slug)
    {
        // nome da categoria que vai ser modificada um item
        $cat = Category::where('name_slug', $category_name_slug)->where('user_nickname', $nickname)->first();
        if (!$cat) {
            # code...
            return Redirect::to(route('user_index', ['nickname' => $nickname]))
                ->with('msg-warning', "categoria não encontrada!");
        }

        // informações sobre aquele item
        $cat = Category::where('name_slug', $category_name_slug)->where('user_nickname', $nickname)->first();
        $item = Item::where('name_slug', $item_name_slug)->where('category_id', $cat->id)->first();

        $dislikes = $item->dislikes;

        $key = array_search(Auth::id(), $dislikes);
        unset($dislikes[$key]);

        $dislikes = array_values($dislikes);

        $item->dislikes = $dislikes;
        $item->save();

        return Redirect::to(route('category_index', ['nickname' => $nickname, 'category_name_slug' => $category_name_slug]))
            ->with('msg-success', "Item desmarcado como LIKE com sucesso!");
    }


    function add_comment_0(Request $request, $nickname, $category_name_slug, $item_name_slug)
    {

        // nome da categoria que vai ser modificada um item
        $cat = Category::where('name_slug', $category_name_slug)->where('user_nickname', $nickname)->first();
        if (!$cat) {
            # code...
            return Redirect::to(route('user_index', ['nickname' => $nickname]))
                ->with('msg-warning', "categoria não encontrada!");
        }

        // informações sobre aquele item
        $cat = Category::where('name_slug', $category_name_slug)->where('user_nickname', $nickname)->first();
        $item = Item::where('name_slug', $item_name_slug)->where('category_id', $cat->id)->first();

        //validação dos campos
        $request->validate([
            'text' => 'required|string'
        ], [
            'text.max' => 'O conteúdo deve ser um texto'
        ]);

        // comentários
        $comment = new Comment();

        $comment->text = $request->text; //texto do comentário
        $comment->id_commenter = Auth::id(); //id do elemento que está comentando
        $comment->id_creator = $cat->user_id; // id do dono do item
        $comment->id_item = $item->id; // id do item
        $comment->comment_level = 0; // nivel 0 = comentário base
        $comment->likes = [];
        $comment->dislikes = [];


        $comment->save();

        return Redirect::to(route('item_index', ['nickname' => $nickname, 'category_name_slug' => $category_name_slug, 'item_name_slug' =>  $request->item_name_slug]))
            ->with('msg-success', "comentário adicionado com sucesso!");
    }

    function add_comment_1(Request $request, $nickname, $category_name_slug, $item_name_slug)
    {

        // nome da categoria que vai ser modificada um item
        $cat = Category::where('name_slug', $category_name_slug)->where('user_nickname', $nickname)->first();
        if (!$cat) {
            # code...
            return Redirect::to(route('user_index', ['nickname' => $nickname]))
                ->with('msg-warning', "categoria não encontrada!");
        }

        // informações sobre aquele item
        $cat = Category::where('name_slug', $category_name_slug)->where('user_nickname', $nickname)->first();
        $item = Item::where('name_slug', $item_name_slug)->where('category_id', $cat->id)->first();

        //validação dos campos
        $request->validate([
            'text' => 'required|string'
        ], [
            'text.max' => 'O conteúdo deve ser um texto'
        ]);

        // comentários
        $comment = new Comment();

        $comment->text = $request->text; //texto do comentário
        $comment->id_commenter = Auth::id(); //id do elemento que está comentando
        $comment->id_creator = $cat->user_id; // id do dono do item
        $comment->id_item = $item->id; // id do item
        $comment->response_to = $request->response_to; // respondendo ao comentario tal
        $comment->comment_level = 1; // nivel 0 = comentário base
        $comment->likes = [];
        $comment->dislikes = [];


        $comment->save();

        return Redirect::to(route('item_index', ['nickname' => $nickname, 'category_name_slug' => $category_name_slug, 'item_name_slug' =>  $request->item_name_slug]))
            ->with('msg-success', "comentário adicionado com sucesso!");
    }

    function add_comment_2(Request $request, $nickname, $category_name_slug, $item_name_slug)
    {

        // nome da categoria que vai ser modificada um item
        $cat = Category::where('name_slug', $category_name_slug)->where('user_nickname', $nickname)->first();
        if (!$cat) {
            # code...
            return Redirect::to(route('user_index', ['nickname' => $nickname]))
                ->with('msg-warning', "categoria não encontrada!");
        }

        // informações sobre aquele item
        $cat = Category::where('name_slug', $category_name_slug)->where('user_nickname', $nickname)->first();
        $item = Item::where('name_slug', $item_name_slug)->where('category_id', $cat->id)->first();

        //validação dos campos
        $request->validate([
            'text' => 'required|string'
        ], [
            'text.max' => 'O conteúdo deve ser um texto'
        ]);

        // comentários
        $comment = new Comment();

        $comment->text = $request->text; //texto do comentário
        $comment->id_commenter = Auth::id(); //id do elemento que está comentando
        $comment->id_creator = $cat->user_id; // id do dono do item
        $comment->id_item = $item->id; // id do item
        $comment->response_to = $request->response_to; // respondendo ao comentario tal
        $comment->comment_level = 2; // nivel 0 = comentário base
        $comment->likes = [];
        $comment->dislikes = [];


        $comment->save();

        return Redirect::to(route('item_index', ['nickname' => $nickname, 'category_name_slug' => $category_name_slug, 'item_name_slug' =>  $request->item_name_slug]))
            ->with('msg-success', "comentário adicionado com sucesso!");
    }



    function update(Request $request, $nickname, $category_name_slug)
    {
        //  protected $fillable = ['name', 'description', 'image', 'category_id'];]

        $request->validate([
            'name' => 'required|string|max:50',
            'description' => 'required|string|max:255',
            'image' => 'nullable|image|mimes:png,jpg,svg,jpeg,gif|max:2048'
        ], [
            'name.max' => 'Tamanho máximo de 50 caracteres excedido',
            'name.string' => 'O conteúdo deve ser um texto',
            'description.max' => 'Tamanho máximo de 255 caracteres excedido',
            'description.string' => 'O conteúdo deve ser um texto',
            'image.required' => 'Você precisa enviar uma imagem',
            'image.image' => 'O conteúdo deve ser uma imagem',
            'image.mimes' => 'São aceitos somente os formatos jpeg, jpg, png, gif e svg',
            'image.max' => 'O tamanho máximo permitido é 2MB',
        ]);

        // verificando se já existe uma category com esse slug
        $cat = Category::where('name_slug', $category_name_slug)->where('user_nickname', $nickname)->first();


        $item = Item::where('name_slug', $request->item_name_slug)->where('category_id', $cat->id)->first();

        if ($item->name != $request->name) {
            // verificando se já existe uma category com esse slug
            $verify = Item::where('name_slug', str($request->name)->slug())->where('category_id', $cat->id)->first();;
            if ($verify) {
                return Redirect::to(route('category_index', ['nickname' => $nickname, 'category_name_slug' => $category_name_slug]))
                    ->with('msg-warning', 'Já existe um item com esse nome!');
            }
        }

        $item->name = $request->name ?? $item->name;
        $item->name_slug = str($request->name)->slug() ?? $item->name_slug;
        $item->description = $request->description ?? $item->description;


        // validando a imagem

        if ($request->remove_image) {
            $item->image = null;
        } elseif ($request->hasFile('image') && $request->file('image')->isValid()) {
            $image = $request->file('image');
            $extension = $image->getClientOriginalExtension();
            $data = strtotime('now');
            $path_image = md5($image->getClientOriginalName()) . '_' . $data . '.' . $extension;
            $image->move(public_path('images/' . $nickname . '/categories/' . $request->id . '/items'), $path_image);
            $item->image = $path_image ?? $item->image;
        }

        $item->save();


        return Redirect::to(route('category_index', ['nickname' => $nickname, 'category_name_slug' => $category_name_slug]))
            ->with('msg-success', "Item editado com sucesso!");
    }
    function destroy(Request $request, $nickname, $category_name_slug)
    {
        $cat = Category::where('name_slug', $category_name_slug)->where('user_nickname', $nickname)->first();
        $item = Item::where('name_slug', $request->item_name_slug)->where('category_id', $cat->id)->first();

        $item->delete();

        return Redirect::to(route('category_index', ['nickname' => $nickname, 'category_name_slug' => $category_name_slug]))
            ->with('msg-success', "Item excluído com sucesso!");
    }
    function editor($nickname, $category_name_slug, $item_name_slug)
    {
        // titulo do item
        $cat = Category::where('name_slug', $category_name_slug)->where('user_nickname', $nickname)->first();
        $item = Item::where('name_slug', $item_name_slug)->where('category_id', $cat->id)->first();

        $title = $item->name;

        // todos os contents daquele item
        $db_url = $item->contents()->get();
        // id da categoria (theme)
        $id = $item->category_id;
        //id do item escolhido
        $item_name_slug = $item->name_slug;

        return view('modulos.vejaeditor', [
            'title' => $title,
            'db_url' => $db_url,
            'id' => $id,
            'item_name_slug' => $item_name_slug,
            'nickname' => $nickname,
            'category_name_slug' => $category_name_slug
        ]);
    }
}
