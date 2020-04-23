<?php


namespace App\Http\Resources\Goods;


use App\Http\Resources\BaseResource;
use App\Models\Goods\Goods;

class GoodsResource extends BaseResource
{
    public function toArray($request)
    {
        return parent::toArray($request);
    }
}
