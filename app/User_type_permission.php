<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class User_type_permission extends Model
{
  protected $fillable = [
      'user_type',
      'permission'
  ];
}
