<?php

use Illuminate\Support\Facades\Schema;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Database\Migrations\Migration;

class CreateDealerDeliveryProductsTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('dealer_delivery_products', function (Blueprint $table) {
            $table->id();
            $table->unsignedBigInteger('dealer_delivery_id')->nullable();
            $table->foreign('dealer_delivery_id')->references('id')->on('dealer_deliveries');
            $table->unsignedBigInteger('product_id')->nullable();
            $table->foreign('product_id')->references('id')->on('products');
            $table->string('stock_qty')->nullable();
            $table->string('delivered_qty')->nullable();
            $table->string('delivery_qty')->nullable();
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
        Schema::dropIfExists('dealer_delivery_products');
    }
}
