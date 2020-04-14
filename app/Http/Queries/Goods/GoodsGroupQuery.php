<?php


namespace App\Http\Queries\Goods;

use App\Models\Goods\Goods;
use App\Models\Goods\GoodsGroup;
use Spatie\QueryBuilder\QueryBuilder;

class GoodsGroupQuery extends QueryBuilder
{
    public function __construct()
    {
        parent::__construct(GoodsGroup::query());
        $this->allowedFields(['id', 'title', 'img', 'price', 'discount', 'tags', 'stock', 'sku', 'details', 'click_count', 'buy_count', 'created_at', 'updated_at'])
            ->allowedFilters(['title', 'category_id'])
            ->allowedSorts(['created_at', 'updated_at']);
    }
}
