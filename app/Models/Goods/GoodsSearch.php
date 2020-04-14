<?php

namespace App\Models\Goods;

use Illuminate\Database\Eloquent\Model;

class GoodsSearch extends Model
{
    protected $table = 'goods_search';

    protected $fillable = [
        'user_id',
        'type',
        'name',
        'price',
        'num',
        'imgs',
        'more',
        'status',
    ];

    public static $EnumStatus = [0 => '未处理', 1 => '已处理'];

    public function getImgsAttribute($value)
    {
        return $value ? explode(',', $value) : [];
    }

    public function setImgsAttribute($value)
    {
        $this->attributes['imgs'] = is_array($value) ? implode(',', $value) : $value;
    }

    public function user(){
        return $this->hasOne('App\Models\User\User', 'id', 'user_id');
    }
}
