<?php

use Illuminate\Support\Facades\Schema;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Database\Migrations\Migration;

class CreateYearlyTargetTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('yearly_target', function (Blueprint $table) {
            $table->id();
            $table->bigInteger('dealer_id');
            $table->bigInteger('product_id');
            $table->integer('qty');
            $table->double('commission_amount',10,2);
            $table->string('year');
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
        Schema::dropIfExists('yearly_target');
    }
}
