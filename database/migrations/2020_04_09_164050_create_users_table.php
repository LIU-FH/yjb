<?php

use Illuminate\Support\Facades\Schema;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Database\Migrations\Migration;

class CreateUsersTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('users', function (Blueprint $table) {
            $table->increments('id');
            $table->string('openid')->comment('openid');
            $table->string('unionid')->comment('unionid');
            $table->integer('parent_id');
            $table->string('nickname')->comment('用户昵称');
            $table->string('avatarurl')->comment('用户头像');
            $table->string('gender')->comment('性别：0：男；1：女；2：未知');
            $table->string('phone')->comment('手机号');
            $table->timestamp('last_login_time')->comment('最后登录时间');
            $table->tinyInteger('status')->comment('状态：0：正常；1：禁止登录');
            $table->string('qr_code')->comment('专属二维码');
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
        Schema::dropIfExists('users');
    }
}
