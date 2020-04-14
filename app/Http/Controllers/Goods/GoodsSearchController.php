<?php

namespace App\Http\Controllers\Goods;


use App\Http\Controllers\Controller;
use App\Http\Queries\Goods\GoodsSearchQuery;
use App\Http\Requests\Goods\GoodsSearchRequest;
use App\Http\Resources\Goods\GoodsGroupResource;
use App\Models\Goods\GoodsSearch;

class GoodsSearchController extends Controller
{
    public function index(GoodsSearchQuery $query)
    {
        $list = $query->paginate();
        return GoodsGroupResource::collection($list);
    }

    public function store(GoodsSearchRequest $request, GoodsSearch $obj)
    {
        $all = $request->all();
        $all['imgs'] = is_array($all['imgs']) ? implode(',', $all['imgs']) : $all['imgs'];
        $obj->fill($all);
        $obj->user_id = $this->user['id'];
        $obj->save();
        return response(null, 200);
    }
}
