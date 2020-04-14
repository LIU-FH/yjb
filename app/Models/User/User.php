<?php

namespace App\Models\User;

use Illuminate\Database\Eloquent\Model;

class User extends Model
{
    public static $EnumStatus = [0 => '正常', 1 => '禁止登录'];
    public static $EnumGender = [0 => '男', 1 => '女', 2 => '未知'];

    public function wallet()
    {
        return $this->hasOne('App\Models\User\Wallet');
    }
}
