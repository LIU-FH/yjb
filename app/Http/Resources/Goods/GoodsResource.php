<?php


namespace App\Http\Resources\Goods;


use App\Http\Resources\BaseResource;
use App\Models\Goods\Goods;

class GoodsResource extends BaseResource
{
    public function toArray($request)
    {
        $item = parent::toArray($request);
        $sell_status = 0;
        if ($item['stock'] <= $item['buy_count']) {
            $sell_status = 1;
        }
        if ($item['start_time'] && $item['start_time'] > time()) {
            $sell_status = 2;
        } else if ($item['start_time'] && $item['start_time'] > time()) {
            $sell_status = 3;
        }
        $item['sell_status'] = $sell_status;
        $item['sell_status_name'] = Goods::$EnumSellStatus[$sell_status];
        return $item;
    }
}
