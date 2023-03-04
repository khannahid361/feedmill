<?php

use Illuminate\Support\Facades\Schema;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Database\Migrations\Migration;

class CreateSalesmenProductCommissionsTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('salesmen_product_commissions', function (Blueprint $table) {
            $table->id();
            $table->string('name')->nullable();
            $table->bigInteger('product_id')->nullable();
            $table->bigInteger('product_price')->nullable();
            $table->bigInteger('quantity')->nullable();
            $table->bigInteger('commission_percent')->nullable();
            $table->bigInteger('commission_amount')->nullable();
            $table->string('created_by')->nullable();
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
        Schema::dropIfExists('salesmen_product_commissions');
    }
}
