<?php

use Illuminate\Support\Facades\Schema;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Database\Migrations\Migration;

class CreateRecipesTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('recipes', function (Blueprint $table) {
            $table->id();
            $table->string('recipe_name');
            $table->string('recipe_code')->unique();
            $table->unsignedBigInteger('product_id');
            $table->date('recipe_date');
            $table->string('created_by')->nullable();
            $table->string('modified_by')->nullable();
            $table->foreign('product_id')->references('id')->on('products');
            $table->enum('status',['1','2'])->default('1')->comment = "1=Active, 2=Inactive";
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
        Schema::dropIfExists('recipes');
    }
}
