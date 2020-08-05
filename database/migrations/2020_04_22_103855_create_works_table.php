<?php

use Illuminate\Support\Facades\Schema;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Database\Migrations\Migration;

class CreateWorksTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('works', function (Blueprint $table) {
            $table->increments('id');
            $table->string('customer_name',255);
            $table->string('phone',255);
            $table->string('email',255);
            $table->integer('contract_type');
            $table->integer('category');
            $table->integer('sub_category');
            $table->mediumText('address');
            $table->string('expected_time');
            $table->string('problem',255);
            $table->mediumText('description');
            $table->string('amount');
            $table->integer('job_type');
            $table->integer('technician_id');
            $table->integer('priority');
            $table->string('area');
            $table->string('town');
            $table->string('zone');
            $table->integer('city');
            $table->integer('state');
            $table->mediumText('instruction');
            $table->integer('status');
            $table->string('asistant_time');
            $table->integer('vendor_job');
            $table->string('accessories_amount');
            $table->integer('charges');
            $table->integer('accessories_charge');
            $table->string('technicnian_instruction');
            $table->string('technician_charge',255);
            $table->string('technician_amount',255);
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
        Schema::dropIfExists('works');
    }
}
