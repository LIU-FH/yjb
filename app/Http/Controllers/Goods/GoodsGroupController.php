<?php

namespace App\Http\Controllers\Goods;

use App\Http\Controllers\Controller;
use App\Http\Queries\Goods\GoodsGroupQuery;
use App\Http\Resources\Goods\GoodsGroupResource;

class GoodsGroupController extends Controller
{
    public function index(GoodsGroupQuery $query)
    {
        $list = $query->paginate();
        return GoodsGroupResource::collection($list);
    }

    public function show($id)
    {
        return new GoodsGroupResource(GoodsGroupQuery::find($id));
    }
}
