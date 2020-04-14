<?php

use Illuminate\Support\Facades\Schema;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Database\Migrations\Migration;

class CreateGoodsSearchTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('goods_search', function (Blueprint $table) {
            $table->increments('id');
            $table->string('user_id')->comment('用户ID');
            $table->string('type')->comment('产品类型');
            $table->string('name')->comment('产品名称');
            $table->string('price')->comment('价格');
            $table->string('num')->comment('数量');
            $table->text('imgs')->comment('图片');
            $table->tinyInteger('status')->comment('状态：0：查找中；1：已回复');
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
        Schema::dropIfExists('goods_search');
    }
}
