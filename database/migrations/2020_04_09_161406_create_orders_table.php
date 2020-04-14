<?php

use Illuminate\Support\Facades\Schema;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Database\Migrations\Migration;

class CreateOrdersTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('orders', function (Blueprint $table) {
            $table->increments('id');
            $table->string('order_no')->comment('订单编号');
            $table->integer('user_id')->comment('用户ID');
            $table->integer('coun')->comment('商品数量');
            $table->decimal('amount_total')->comment('商品总价');
            $table->decimal('amount')->comment('实付金额');
            $table->decimal('balance')->comment('余额支付金额');
            $table->decimal('wx_balance')->comment('微信支付金额');
            $table->decimal('discount')->comment('折扣金额');
            $table->string('address_name')->comment('姓名');
            $table->string('address_tel')->comment('手机号');
            $table->string('address_details')->comment('地址');
            $table->tinyInteger('status')->comment('订单状态 0未付款,1已付款,2已发货,3已签收,-1退货申请,-2退货中,-3已退货,-4取消交易');
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
        Schema::dropIfExists('orders');
    }
}
