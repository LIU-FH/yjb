<?php

namespace App\Http\Controllers\Goods;


use App\Http\Controllers\Controller;
use App\Http\Resources\Goods\GoodsResource;
use App\Models\Goods\GoodsCart;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Log;

class GoodsCartController extends Controller
{
    public function index(Request $request)
    {
        $list = GoodsCart::where('user_id', $request->user()->id)->paginate();
        foreach ($list as $item) {
            $item->goods->sell_status  = $item->goods->getSellStatus();
        }
        return response($list, 200);
    }

    public function store(Request $request, GoodsCart $obj)
    {
        $all = $request->all();
        $obj->fill($all);
        $obj->user_id = $request->user()->id;
        $obj->save();
        return response(null, 200);
    }

    public function update($id, Request $request)
    {
        $obj = GoodsCart::find($id);
        $obj->update($request->all());
        return response(null, 200);
    }

    public function destroy($id)
    {
        $obj = GoodsCart::find($id);
        $obj->delete();
        return response(null, 200);
    }
}
