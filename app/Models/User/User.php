<?php

namespace App\Models\User;

use Illuminate\Foundation\Auth\User as Authenticatable;
use Illuminate\Notifications\Notifiable;
use Laravel\Sanctum\HasApiTokens;

class User extends Authenticatable
{
    use Notifiable, HasApiTokens;

    protected $fillable = [
        'openid',
        'unionid',
        'parent_id',
        'nickname',
        'avatarurl',
        'gender',
        'phone',
        'is_super',
        'status',
        'qr_code',
        'session_key',
        'keyword',
        'last_login_time',
    ];

    public static $EnumStatus = [0 => '正常', 1 => '禁止登录'];
    public static $EnumGender = [0 => '男', 1 => '女', 2 => '未知'];

    public function wallet()
    {
        return $this->hasOne('App\Models\User\Wallet');
    }
}
