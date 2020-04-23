<?php

namespace App\Http\Controllers\Goods;

use App\Http\Controllers\Controller;
use App\Http\Queries\Goods\GoodsQuery;
use App\Http\Resources\Goods\GoodsResource;
use App\Models\Goods\Goods;
use App\Models\Order\Order;
use App\Models\Order\OrderDetails;
use Illuminate\Http\Request;

class GoodsController extends Controller
{
    public function index(Request $request)
    {
        $query = new Goods();
        if ($request->input('category_id')) {
            $query = $query->where('category_id', $request->input('category_id'));
        }
        if ($request->input('category_id') == 2) {
            if ($request->input('sell')) {
                $query = $query->where('start_time', '>=', date('Y-m-d H:i:s', time()))->where('end_time', '<=', date('Y-m-d H:i:s', time()));
            } else {
                $query = $query->where('start_time', '<=', date('Y-m-d H:i:s', time()));
            }
        }
        $query =  $query->select('id','title','img','price','discount','tags','click_count','buy_count','status','start_time','end_time','send_time','category_id');
        $list = $query->orderByDesc('start_time')->paginate();
        if ($request->input('buy_user')) {
            foreach ($list as $item) {
                $item->buy_user = OrderDetails::getBuyUser($item->id, $request->input('buy_user'));
            }
        }
        return GoodsResource::collection($list);
    }

    public function show($id)
    {
        Goods::where('id', $id)->increment('click_count');
        return new GoodsResource(Goods::find($id));
    }
}
