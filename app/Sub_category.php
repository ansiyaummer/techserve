<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class Sub_category extends Model
{
  protected $fillable = [
      'category_id',
      'name',
      'status'
  ];

  public function category()
   {
       return $this->hasMany('App\Comment');
   }
}
