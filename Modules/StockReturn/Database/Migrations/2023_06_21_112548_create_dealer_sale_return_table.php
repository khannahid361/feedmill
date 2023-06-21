<?php

use Illuminate\Support\Facades\Schema;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Database\Migrations\Migration;

class CreateDealerSaleReturnTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('dealer_sale_return', function (Blueprint $table) {
            $table->id();
            $table->string('return_no')->unique();
            $table->string('memo_no');
            $table->unsignedBigInteger('warehouse_id');
            $table->foreign('warehouse_id')->references('id')->on('warehouses');
            $table->unsignedBigInteger('dealer_id')->nullable();
            $table->foreign('dealer_id')->references('id')->on('dealers');
            $table->double('total_price');
            $table->double('total_deduction')->nullable();
            $table->double('tax_rate')->nullable();
            $table->double('total_tax')->nullable();
            $table->double('grand_total');
            $table->double('deducted_sr_commission')->nullable();
            $table->text('reason')->nullable();
            $table->date('date');
            $table->date('return_date');
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
        Schema::dropIfExists('dealer_sale_return');
    }
}
