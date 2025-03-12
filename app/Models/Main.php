<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\SoftDeletes;

class Main extends Model
{
    use HasFactory;
    use SoftDeletes;

    protected $fillable = [
        'name',
        'subtitle',
        'description',
        'user_id',
        'user_nickname'
    ];

    public function user(){
        return $this->belongsTo(Category::class);
    }

}
