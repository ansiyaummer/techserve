<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class Leave extends Model
{
  protected $fillable = [
      'user_id',
      'leave_type',
      'leave_date',
      'status',
      'description',
      'leave_stage'

  ];
}
