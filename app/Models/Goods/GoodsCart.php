<?php

namespace App\Models\Goods;

use Illuminate\Database\Eloquent\Model;

class GoodsCart extends Model
{
    protected $table = 'goods_cart';

    protected $fillable = [
        'user_id',
        'goods_id',
        'num',
        'sku',
    ];

    public function goods()
    {
        return $this->hasOne('App\Models\Goods\Goods', 'id','goods_id');
    }
}
