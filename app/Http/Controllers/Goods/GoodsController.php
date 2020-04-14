<?php

namespace App\Http\Controllers\Goods;

use App\Http\Controllers\Controller;
use App\Http\Queries\Goods\GoodsQuery;
use App\Http\Resources\Goods\GoodsResource;
use App\Models\Goods\Goods;
use Illuminate\Http\Request;

class GoodsController extends Controller
{
    public function index(GoodsQuery $query,Request $request)
    {
        if ($request->get('category_id') == 2){
            if ($request->get('sell')){
                $query = $query->where('start_time','>=',date('Y-m-d H:i:s',time()))->where('end_time','<=',date('Y-m-d H:i:s',time()));
            }else{
                $query = $query->where('start_time','<=',date('Y-m-d H:i:s',time()));
            }
        }
        $list = $query->orderByDesc('start_time')->paginate();
        return GoodsResource::collection($list);
    }

    public function show($id)
    {
        return new GoodsResource(Goods::find($id));
    }
}
