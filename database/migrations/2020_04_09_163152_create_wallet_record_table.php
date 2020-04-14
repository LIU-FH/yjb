<?php

use Illuminate\Support\Facades\Schema;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Database\Migrations\Migration;

class CreateWalletRecordTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('wallet_record', function (Blueprint $table) {
            $table->increments('id');
            $table->string('user_id')->comment('用户ID');
            $table->string('wallet_id')->comment('钱包ID');
            $table->string('amount')->comment('金额');
            $table->string('type_id')->comment('类型');
            $table->string('change')->comment('金额变动：-1：扣钱，1：加钱');
            $table->string('desc')->comment('说明');
            $table->string('remark')->comment('备注');
            $table->string('expand_data')->comment('扩展数据');
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
        Schema::dropIfExists('wallet_record');
    }
}
