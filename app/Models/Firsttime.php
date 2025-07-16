<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Firsttime extends Model
{
    use HasFactory;

    protected $fillable = [
        'user_id',
        'editor',
        'generic',
        'index',
        'indexcreator',
        'main',
        'veja',
        'vejaeditor',
        'base_create',
        'base_edit',
        'block_create',
        'block_edit',
        'generic_create',
        'generic_edit'
    ];

    public function user(){
        return $this->belongsTo(User::class);
    }
}
