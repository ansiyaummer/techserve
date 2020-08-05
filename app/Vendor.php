<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class Vendor extends Model
{
  protected $fillable = [
      'name',
      'person',
      'street1',
      'street2',
      'city',
      'zip',
      'email1',
      'email2',
      'phone1',
      'phone2',
      'about',
      'status',
      'state'
  ];
}
