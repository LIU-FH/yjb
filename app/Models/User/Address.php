<?php

namespace App\Models\User;

use Illuminate\Database\Eloquent\Model;

class Address extends Model
{
    protected $table = 'address';

    protected $fillable = [
        'user_id',
        'name',
        'tel',
        'city',
        'details',
        'default',
    ];

    public static function getDefaultAddress($user_id)
    {
        $obj = self::where('default', 1)->where('user_id', $user_id)->first();
        return [
            "address_name" => $obj ? $obj->name : '',
            "address_tel" => $obj ? $obj->tel : '',
            "address_details" => $obj ? $obj->city . '，' . $obj->details : ''
        ];
    }
}
