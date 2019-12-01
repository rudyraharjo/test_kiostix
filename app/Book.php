<?php

namespace App;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\SoftDeletes;

class Book extends Model
{

    use SoftDeletes;

    protected $table = "books";
    
    protected $dates = ['deleted_at'];

    protected $fillable = [
        'id_categorybook', 'name', 'author', 'pic', 'description'
    ];

    public function category()
	{
		return $this->hasOne('App\BookCategory', 'id');
    }
}
