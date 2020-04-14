<?php

namespace App\Models\User;

use Illuminate\Database\Eloquent\Model;

class WalletRecord extends Model
{
    protected $table = 'wallet_record';

    protected $fillable = [
        'user_id',
        'be_user_id',
        'type',
        'amount',
        'type_id',
        'change',
        'desc',
        'remark',
        'expand_data',
    ];

    protected $RecordType = [
        1 => [
            'change' => -1,
            'desc' => '购买商品',
        ],
        10 => [
            'change' => -1,
            'desc' => '提现',
        ],
        11 => [
            'change' => -1,
            'desc' => '提现冻结',
        ],
        12 => [
            'change' => -1,
            'desc' => '提现解冻',
        ],
    ];

    public function be_user()
    {
        return $this->hasOne('App\Models\User\User', 'id', 'be_user_id');
    }

    public static function addRecord($user_id, $type_id, $amount, $be_user_id = 0, $expand_data = null)
    {
        $obj = new WalletRecord();
        $obj->user_id = $user_id;
        $obj->be_user_id = $be_user_id;
        $obj->type_id = $type_id;
        $obj->amount = $amount;
        $obj->change = $amount;
        $obj->desc = $amount;
        if ($expand_data){
            $obj->expand_data = json_encode($expand_data);
        }
        return $obj->save();
    }
}
