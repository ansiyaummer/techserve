<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class Technician extends Model
{
  protected $fillable = [
      'phone1',
      'phone2',
      'address',
      'user_id'
  ];
}
