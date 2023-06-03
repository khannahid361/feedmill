<?php

use Illuminate\Support\Facades\Schema;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Database\Migrations\Migration;

class CreateMonthlyTargetTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('monthly_target', function (Blueprint $table) {
            $table->id();
            $table->bigInteger('dealer_id');
            $table->bigInteger('product_id');
            $table->integer('qty');
            $table->integer('acheived_qty')->default('0');
            $table->double('commission_amount',10,2);
            $table->double('paid_amount',10,2);
            $table->double('due_amount',10,2);
            $table->tinyInteger('is_paid')->default('0')->comment='0=not paid, 1=paid';
            $table->string('year');
            $table->string('month');
            $table->enum('status',['1','2'])->default('1')->comment = "1=Active, 2=Inactive";
            $table->string('created_by')->nullable();
            $table->string('modified_by')->nullable();
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
        Schema::dropIfExists('monthly_target');
    }
}
