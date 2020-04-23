<?php

namespace App\Models\Order;

use Illuminate\Database\Eloquent\Model;

class OrderDetails extends Model
{
    protected $table = 'order_details';

    protected $fillable = [
        'order_id',
        'goods_id',
        'user_id',
        'title',
        'img',
        'price',
        'count',
        'property',
        'extend_data',
    ];

    public function user(){
        return $this->hasOne('App\Models\User\User', 'id', 'user_id');
    }

    public static function getBuyUser($goods_id, $num){
        $order = OrderDetails::where('goods_id',$goods_id)->limit($num)->get();
        $user = [];
        foreach ($order as $item){
            $user[] = $item->user;
        }
        return $user;
    }
}
