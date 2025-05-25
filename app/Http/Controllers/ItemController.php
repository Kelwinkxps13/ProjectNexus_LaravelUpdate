<?php

namespace App\Http\Controllers;

use App\Models\Category;
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

        return view('modulos.veja', [
            'item' => $item,
            'db_url' => $db_url,
            'id' => $id,
            'item_name_slug' => $item_name_slug,
            'nickname' => $nickname,
            'category_name_slug' => $category_name_slug
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
            'image' => 'nullable|image|mimes:png,jpg,svg,jpeg,gif'
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

        $likes = $item->likes;
        $likes[] = Auth::user()->nickname;

        $item->likes = $likes;
        $item->save();

        return Redirect::to(route('category_index', ['nickname' => $nickname, 'category_name_slug' => $category_name_slug]))
            ->with('msg-success', "Item curtido com sucesso!");
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

        $key = array_search(Auth::user()->nickname, $likes);
        unset($likes[$key]);

        $likes = array_values($likes);

        $item->likes = $likes;
        $item->save();

        return Redirect::to(route('category_index', ['nickname' => $nickname, 'category_name_slug' => $category_name_slug]))
            ->with('msg-success', "Item descurtido com sucesso!");
    }

    function update(Request $request, $nickname, $category_name_slug)
    {
        //  protected $fillable = ['name', 'description', 'image', 'category_id'];]

        $request->validate([
            'name' => 'required|string|max:50',
            'description' => 'required|string|max:255',
            'image' => 'nullable|image|mimes:png,jpg,svg,jpeg,gif'
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
