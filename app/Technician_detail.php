<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class Technician_detail extends Model
{
  protected $fillable = [
      'technician_id',
      'skill',
      'status'
  ];
}
