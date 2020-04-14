<?php

namespace App\Models\Goods;

use Illuminate\Database\Eloquent\Model;

class GoodsGroup extends Model
{
    protected $table = 'goods_group';

    public static $EnumStatus = [0 => '未上架', 1 => '上架中'];

    /**
     * 获取有戏商品
     * @param $goods_id
     * @return mixed
     */
    public static function getEffectiveGoods($goods_group_id)
    {
        $obj = GoodsGroup::find($goods_group_id);
        if (!$obj) {
            abort(5030);
        }
        if (date('Ymd', time()) < date('Ymd', $obj->start_date)) {
            abort(5032);
        } else if (date('Ymd', time()) < date('Ymd', $obj->end_date)) {
            abort(5033);
        }
        if (date('His', time()) < date('His', $obj->start_time) || date('His', time()) > date('His', $obj->end_time)){
            abort(5032);
        }
        return Goods::getEffectiveGoods($obj->goods_id);
    }
}
