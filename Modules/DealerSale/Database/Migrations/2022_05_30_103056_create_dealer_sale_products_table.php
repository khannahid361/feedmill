<?php

use Illuminate\Support\Facades\Schema;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Database\Migrations\Migration;

class CreateDealerSaleProductsTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('dealer_sale_products', function (Blueprint $table) {
            $table->id();
            $table->unsignedBigInteger('dealer_sale_id');
            $table->foreign('dealer_sale_id')->references('id')->on('dealer_sales');
            $table->unsignedBigInteger('product_id');
            $table->foreign('product_id')->references('id')->on('products');
            $table->double('qty');
            $table->double('free_qty');
            $table->double('delivered_qty');
            $table->unsignedBigInteger('sale_unit_id')->nullable();
            $table->foreign('sale_unit_id')->references('id')->on('units');
            $table->double('net_unit_price');
            $table->double('discount');
            $table->double('tax_rate');
            $table->double('tax');
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
        Schema::dropIfExists('dealer_sale_products');
    }
}
