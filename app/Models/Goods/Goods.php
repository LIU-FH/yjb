<?php

namespace App\Models\Goods;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Support\Facades\Log;

class Goods extends Model
{

    public static $EnumCategory = [
        0 => '默认',
        1 => '9选',
        2 => '团购',
        3 => '悦家帮',
        4 => '普惠专享',
        5 => '帮主专享',
        6 => '升级专享',
    ];

    public static $EnumSellStatus = [
        0 => '售卖中',
        1 => '售罄',
        2 => '未开始',
        3 => '已结束',
    ];

    public static $EnumStatus = [0 => '未上架', 1 => '上架中'];

    public function getTagsAttribute($value)
    {
        return $value ? explode(',', $value) : [];
    }

    public function getSellStatus()
    {
        $status = 0;
        if ($this->stock <= $this->buy_count) {
            $status = 1;
        }
        if ($this->start_time && $this->start_time > time()) {
            $status = 2;
        } else if ($this->start_time && $this->start_time > time()) {
            $status = 3;
        }
        $status_name = Goods::$EnumSellStatus[$status];
        return compact('status', 'status_name');
    }

    /**
     * 获取有戏商品
     * @param $goods_id
     * @return mixed
     */
    public static function getEffectiveGoods($goods_id)
    {
        $goods = Goods::find($goods_id);
        if (!$goods) {
            abort(5020);
        }
        if ($goods->status != 1) {
            abort(5021);
        }
        return $goods;
    }
}
