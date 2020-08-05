<?php

use Illuminate\Support\Facades\Schema;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Database\Migrations\Migration;

class CreateVendorJobsTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('vendor_jobs', function (Blueprint $table) {
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
            $table->string('bill_number');

            $table->string('bill_date');
            $table->string('reseller');
            $table->string('reseller_other');
            $table->string('other_reseller');
            $table->integer('product_id');
            $table->string('spec',255);
            $table->string('serial_num',255);
            $table->integer('status');
            $table->string('asistant_time');
            $table->integer('accessories');
            $table->integer('charges');

            $table->tinyInteger('convert_status')->default(1);
            $table->integer('created_by');
            $table->integer('job_id');
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
        Schema::dropIfExists('vendor_jobs');
    }
}
