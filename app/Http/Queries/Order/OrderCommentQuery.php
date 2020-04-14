<?php


namespace App\Http\Queries\Order;

use App\Models\Order\OrderComment;
use Spatie\QueryBuilder\QueryBuilder;

class OrderCommentQuery extends QueryBuilder
{
    public function __construct()
    {
        parent::__construct(OrderComment::query());
        $this->allowedFields(['id', 'title', 'img', 'price', 'discount', 'tags', 'stock', 'sku', 'details', 'click_count', 'buy_count', 'created_at', 'updated_at'])
            ->allowedFilters(['title', 'category_id'])
            ->allowedSorts(['created_at', 'updated_at']);
    }
}
