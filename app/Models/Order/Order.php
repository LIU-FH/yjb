<?php

namespace App\Models\Order;

use App\Models\Goods\Goods;
use App\Models\Goods\GoodsCart;
use App\Models\Goods\GoodsGroup;
use App\Models\User\User;
use App\Models\User\Wallet;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Support\Facades\Log;

class Order extends Model
{

    protected $fillable = [
        'order_no',
        'user_id',
        'count',
        'amount_total',
        'amount',
        'balance',
        'wx_balance',
        'discount',
        'discount_amount',
        'address_name',
        'address_tel',
        'address_details',
        'remark',
        'status',
    ];

    public static $EnumStatus = [
        0 => '未付款',
        1 => '已付款',
        2 => '已发货',
        3 => '已签收',
        4 => '已完成',
        -1 => '退款申请',
        -2 => '退款中',
        -3 => '已退款',
        -4 => '退货申请',
        -5 => '退货中',
        -6 => '已退货',
        -7 => '已取消'
    ];

    public function details()
    {
        return $this->hasMany('App\Models\Order\OrderDetails');
    }

    public function comments()
    {
        return $this->hasMany('App\Models\Order\OrderComment');
    }

    public function user(){
        return $this->hasOne('App\Models\User\User', 'id', 'user_id');
    }

    /**
     * 创建商品订单
     * @param $user
     * @param $params
     * @param int $balance
     * @return mixed
     */
    public static function createOrder($user_id, $params, $balance = 0)
    {
        $goodsList = [];
        if (!empty($params['goods'])) {
            $goods = Goods::getEffectiveGoods($params['goods']);
            $goodsList[] = [
                "goods_id" => $goods->id,
                "title" => $goods->title,
                "img" => $goods->img,
                "price" => $goods->price,
                "count" => 1,
            ];
        }
        if (!empty($params['cart'])) {
            $cart = GoodsCart::find(explode(',',$params['cart']));
            foreach ($cart as $k=>$v){
                $cartGoods = $v->goods;
                $goodsList[] = [
                    "goods_id" => $cartGoods->id,
                    "img" => $cartGoods->img,
                    "title" => $cartGoods->title,
                    "price" => $cartGoods->price,
                    "count" => $v->num,
                ];
            }
        }
        if (count($goodsList) == 0){
            abort(5041);
        }
        $user = User::find($user_id);
        $amount_total = $discount = $discount_amount = 0;
        foreach ($goodsList as $key => $item) {
            $goodsList[$key]['user_id'] = $user->id;
            $amount_total += $item['price'];
        }
        if ($balance && $user->wallet->balance < $balance) {
            abort(5016);
        }
        if ($user->is_super) {//帮主折扣
            $discount = 0.1;
            $discount_amount = $amount_total * $discount;
        }
        $data['user_id'] = $user->id;
        $data['wallet_balance'] = $user->wallet->balance;
        $data['order_no'] = date('YmdHis' . $user->id);
        $data['count'] = 1;
        $data['amount_total'] = $amount_total;
        $data['amount'] = $amount_total - $discount_amount;
        $data['balance'] = $balance;
        $data['wx_balance'] = $data['amount'] - $balance;
        $data['discount'] = $discount;
        $data['discount_amount'] = $discount_amount;
        $data['address_name'] = '';
        $data['address_tel'] = '';
        $data['address_details'] = '';
        $data['details'] = $goodsList;
        return $data;
    }
}
