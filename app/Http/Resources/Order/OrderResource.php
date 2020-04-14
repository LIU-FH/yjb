<?php


namespace App\Http\Resources\Order;


use App\Http\Resources\BaseResource;
use App\Models\Order\Order;

class OrderResource extends BaseResource
{
    public function toArray($request)
    {
        $data = parent::toArray($request);
        $data['status_text'] = Order::$EnumStatus[$data['status']];
        return $data;
    }
}
