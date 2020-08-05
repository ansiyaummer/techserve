<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class Category extends Model
{
  protected $fillable = [
      'name',
      'status'
  ];

  public function Subcategory()
   {
       return $this->belongsTo('App\Category');
   }
}
