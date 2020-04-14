<?php

use Illuminate\Support\Facades\Schema;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Database\Migrations\Migration;

class CreateWithdrawTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('withdraw', function (Blueprint $table) {
            $table->increments('id');
            $table->integer('user_id')->comment('用户ID');
            $table->integer('wallet_id')->comment('钱包ID');
            $table->tinyInteger('type')->comment('类型：1：微信：2：银行卡');
            $table->string('name')->comment('姓名');
            $table->string('tel')->comment('手机号');
            $table->string('bank_card')->comment('卡号');
            $table->string('bank_address')->comment('开户行');
            $table->tinyInteger('status')->comment('状态：-1：退回；0：申请中：1：已同意（提现中）；2：提现成功；');
            $table->string('remark')->comment('备注');
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
        Schema::dropIfExists('withdraw');
    }
}
