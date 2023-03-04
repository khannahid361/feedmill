<?php

use Illuminate\Support\Facades\Schema;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Database\Migrations\Migration;

class CreateASMMonthlyTargetsTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('a_s_m_monthly_targets', function (Blueprint $table) {
            $table->id();
            $table->string('mtcode')->unique();
            $table->unsignedBigInteger('asm_id');
            $table->foreign('asm_id')->references('id')->on('a_s_ms')->onDelete('cascade');
            $table->double('target_value');
            $table->double('achieved_value')->nullable();
            $table->date('start_date')->index('start_date');
            $table->date('end_date')->index('end_date');
            $table->date('closing_date');
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
        Schema::dropIfExists('a_s_m_monthly_targets');
    }
}
