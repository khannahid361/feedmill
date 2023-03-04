<?php

use Illuminate\Support\Facades\Schema;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Database\Migrations\Migration;

class CreateSalesTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('sales', function (Blueprint $table) {
            $table->id();
            $table->string('memo_no')->nullable();
            $table->unsignedBigInteger('salesmen_id')->nullable();
            $table->foreign('salesmen_id')->references('id')->on('salesmen');
            $table->bigInteger('area_id')->nullable();
            $table->unsignedBigInteger('customer_id')->nullable();
            $table->foreign('customer_id')->references('id')->on('customers');
            $table->date('sale_date');
            $table->string('document')->nullable();
            $table->string('item')->nullable();
            $table->string('total_qty')->nullable();
            $table->string('total_free_qty')->nullable();
            $table->string('total_tax')->nullable();
            $table->string('total_price')->nullable();
            $table->string('total_commission')->nullable();
            $table->string('order_tax')->nullable();
            $table->string('order_tax_rate')->nullable();
            $table->string('order_discount')->nullable();
            $table->string('shipping_cost')->nullable();
            $table->string('labor_cost')->nullable();
            $table->string('previous_due')->nullable();
            $table->string('net_total')->nullable();
            $table->string('paid_amount')->nullable();
            $table->string('grand_total')->nullable();
            $table->string('due_amount')->nullable();
            $table->enum('payment_status',['1','2','3'])->comment="1=Paid,2=Partial,3=Due";
            $table->enum('payment_method',['1','2','3'])->nullable()->comment="1=Cash,2=Bank Deposit,3=Mobile";
            $table->string('reference_no')->nullable();
            $table->unsignedBigInteger('account_id')->nullable();
            $table->foreign('account_id')->references('id')->on('chart_of_accounts');
            $table->text('note')->nullable();
            $table->enum('status',['1','2','3'])->nullable()->comment="1=Pending,2=Approved,3=Reject";
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
        Schema::dropIfExists('sales');
    }
}
