<?php

use Illuminate\Support\Facades\Schema;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Database\Migrations\Migration;

class CreateGoodsTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('goods', function (Blueprint $table) {
            $table->increments('id');
            $table->string('title')->comment('商品名称');
            $table->string('img')->comment('展示图');
            $table->string('price')->comment('价格');
            $table->float('discount')->comment('折扣');
            $table->string('tags')->comment('标签')->nullable();
            $table->integer('stock')->comment('商品库存');
            $table->text('sku')->comment('商品sku')->nullable();
            $table->integer('click_count')->comment('查看次数');
            $table->integer('buy_count')->comment('购买次数');
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
        Schema::dropIfExists('goods');
    }
}
