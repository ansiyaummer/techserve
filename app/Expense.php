<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class Expense extends Model
{
  protected $fillable = [
      'expense_type',
      'name',
      'status',
      'price',
      'user_id',
      'photo'

  ];

  
}
