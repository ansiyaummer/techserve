<?php

use Illuminate\Support\Facades\Schema;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Database\Migrations\Migration;

class CreateVendorsTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('vendors', function (Blueprint $table) {
          $table->bigIncrements('id');
          $table->string('name');
          $table->string('person');
          $table->string('street1');
          $table->string('street2');
          $table->string('city');
          $table->string('zip');
    

          $table->string('email1');
          $table->string('email2');
          $table->string('phone1');
          $table->string('phone2');
          $table->text('description');
          $table->timestamps();
          $table->tinyInteger('status')->default(1);;
          $table->string('state');
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::dropIfExists('vendors');
    }
}
