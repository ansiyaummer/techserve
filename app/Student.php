<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class Student extends Model
{
    //
    //
    protected $fillable = ['full_name','father_name','email','dob','address','user_id'];

    public function user()
    {
        return $this->belongsTo('App\User');
    }
}
