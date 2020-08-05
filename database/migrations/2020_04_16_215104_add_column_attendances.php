<?php

use Illuminate\Support\Facades\Schema;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Database\Migrations\Migration;

class AddColumnAttendances extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
      Schema::table('attendances', function (Blueprint $table) {
      $table->string('punch_in',100)->nullable();
      $table->string('punch_out',100)->nullable();
      $table->string('day',100);
      $table->string('month',100);
      $table->string('year',100);
      $table->string('punch',10)->nullable();
    
    });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        //
    }
}
