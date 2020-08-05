<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class Accessories extends Model
{
  protected $fillable = [
      'name',
      'price'
  ];
}
