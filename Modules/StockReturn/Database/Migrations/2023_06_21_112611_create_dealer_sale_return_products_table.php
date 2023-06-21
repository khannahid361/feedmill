<?php

use Illuminate\Support\Facades\Schema;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Database\Migrations\Migration;

class CreateDealerSaleReturnProductsTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('dealer_sale_return_products', function (Blueprint $table) {
            $table->id();
            $table->unsignedBigInteger('dealer_sale_return_id');
            $table->foreign('dealer_sale_return_id')->references('id')->on('dealer_sale_return');
            $table->string('memo_no');
            $table->unsignedBigInteger('product_id');
            $table->foreign('product_id')->references('id')->on('products');
            $table->double('return_qty');
            $table->unsignedBigInteger('unit_id')->nullable();
            $table->foreign('unit_id')->references('id')->on('units');
            $table->double('product_rate');
            $table->double('deduction_rate')->nullable();
            $table->double('deduction_amount')->nullable();
            $table->double('total');
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
        Schema::dropIfExists('dealer_sale_return_products');
    }
}
