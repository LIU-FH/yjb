<?php

namespace App\Models\Order;

use Illuminate\Database\Eloquent\Model;

class OrderDetails extends Model
{
    protected $table = 'order_details';

    protected $fillable = [
        'order_id',
        'goods_id',
        'title',
        'img',
        'price',
        'count',
        'property',
        'extend_data',
    ];
}
