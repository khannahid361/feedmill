<?php

use Illuminate\Support\Facades\Schema;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Database\Migrations\Migration;

class CreateAllowanceDeductionsTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('allowance_deductions', function (Blueprint $table) {
            $table->id();
            $table->string('head');
            $table->enum('department',['1','2'])->comment('1 = Employee, 2 = Labor');
            $table->enum('type',['1','2'])-> comment('1 = allowance, 2 = Deduction');
            $table->enum('status',['1','2'])-> comment('1 = Active, 2 = Deleted');
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
        Schema::dropIfExists('allowance_deductions');
    }
}
