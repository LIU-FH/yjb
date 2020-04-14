<?php

use Illuminate\Support\Facades\Schema;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Database\Migrations\Migration;

class CreateGoodsGroupTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('goods_group', function (Blueprint $table) {
            $table->increments('id');
            $table->integer('goods_id')->comment('商品ID');
            $table->string('start_date')->comment('开始日期');
            $table->string('end_date')->comment('结束日期');
            $table->string('start_time')->comment('开始时间');
            $table->string('end_time')->comment('结束时间');
            $table->tinyInteger('status')->comment('状态：0：未上架：1：上架中');
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
        Schema::dropIfExists('goods_group');
    }
}
