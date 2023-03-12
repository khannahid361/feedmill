<?php

use Illuminate\Support\Facades\Schema;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Database\Migrations\Migration;

class CreateLabourLeaveAppsTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('labour_leave_apps', function (Blueprint $table) {
            $table->id();
            $table->bigInteger('created_by');
            $table->bigInteger('leave_category');
            $table->bigInteger('labour_id');
            $table->date('start_date');
            $table->date('end_date');
            $table->text('purpose');
            $table->date('date');
            $table->tinyInteger('status')->default('1')->comment('1 = Active 2 = Inactive');
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
        Schema::dropIfExists('labour_leave_apps');
    }
}
