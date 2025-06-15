<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\SoftDeletes;

class Item extends Model
{
    use HasFactory, SoftDeletes;

    protected $fillable = ['name', 'description', 'image', 'category_id', 'name_slug', 'views', 'likes', 'dislikes'];
    protected $casts = [
    'views' => 'views',
    'likes' => 'array',
    'dislikes' => 'array',
];

    public function category()
    {
        return $this->belongsTo(Category::class);
    }

    public function contents()
    {
        return $this->hasMany(Content::class);
    }
}