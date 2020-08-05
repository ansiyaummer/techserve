<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class Equipment_status extends Model
{
  protected $fillable = [
      'name',
      'equipment_id',
      'avl_qty'
  ];
}
