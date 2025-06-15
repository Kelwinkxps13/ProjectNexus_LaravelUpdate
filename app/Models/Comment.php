<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Comment extends Model
{
    use HasFactory;

    protected $fillable = [
        'text',
        'id_commenter',
        'id_creator',
        'id_item',
        'response_to',
        'comment_level'
    ];
    protected $casts = [
        'likes' => 'array',
        'dislikes' => 'array'
    ];
}
