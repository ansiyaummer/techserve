<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class Attendance extends Model
{
  protected $fillable = [
      'date',
      'user_id',
      'photo',
      'status',
      'punch_in',
      'punch_out',
      'day',
      'month',
      'year',
      'punch'


  ];
}
