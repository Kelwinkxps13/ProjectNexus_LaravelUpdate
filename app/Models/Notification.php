<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class Notification extends Model
{
    protected $fillable = [
        'user_id',
        'name',
        'text',
        'status',
        'responser_id',
        'route',
        'theme_name'
    ];

    public function user(){
        return $this->belongsTo(User::class);
    }
}
