<?php

use Illuminate\Support\Facades\Schema;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Database\Migrations\Migration;

class CreateLeavesTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('leaves', function (Blueprint $table) {
          $table->bigIncrements('id');
          $table->integer('user_id');
          $table->enum('leave_type', ['1', '2','3']);
          $table->date('leave_date');
          $table->tinyInteger('status')->default(1);
        //  $table->enum('status', ['1', '2','3']);
          $table->text('description');
          $table->timestamps();
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::dropIfExists('leaves');
    }
}
