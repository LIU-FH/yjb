<?php

namespace App\Http\Controllers\Order;

use App\Http\Controllers\Controller;
use App\Http\Queries\Order\OrderQuery;
use App\Http\Resources\Order\OrderResource;
use App\Models\Goods\Goods;
use App\Models\Goods\GoodsCart;
use App\Models\Goods\GoodsGroup;
use App\Models\Order\Order;
use App\Models\Order\OrderDetails;
use App\Models\User\Address;
use App\Traits\RequestTrait;
use EasyWeChat\Factory;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Log;
use Symfony\Component\ErrorHandler\Exception\FlattenException;

class OrderController extends Controller
{
    public function index(Request $request)
    {
        $query = new Order();
        $query = $query->where('user_id', $request->user()->id);
        if ($request->get('status') > -1) {
            $query = $query->where('status', $request->get('status'));
        }
        $list = $query->paginate();
        foreach ($list as $item) {
            $item->details;
        }
        return OrderResource::collection($list);
    }

    public function show($id, Request $request)
    {
        $order = Order::where('user_id', $request->user()->id)->where('id', $id)->first();
        $order->details;
        return new OrderResource($order);
    }

    public function ready(Request $request)
    {
        $data = Order::createOrder($this->user, $request->all());
        $address = Address::getDefaultAddress($this->user->id);
        return response(array_merge($data, $address), 200);
    }

    public function store(Request $request)
    {
        $params = $request->all();
        $data = Order::createOrder($request->user(), $params['params'], $params['balance']);
        $data['address_name'] = $params['address_name'];
        $data['address_tel'] = $params['address_tel'];
        $data['address_details'] = $params['address_details'];
        $data['remark'] = empty($params['remark']) ? '' : $params['remark'];
        DB::beginTransaction();
        $order = new Order();
        $unifyRes = [];
        try {
            $order->fill($data);
            if (!$order->save()) {
                abort(500);
            }
            if (isset($params['params']['cart'])) {
                if (!GoodsCart::whereIn('id', explode(',', $params['params']['cart']))->delete()) {
                    abort(500);
                }
            }
            $details = array_map(function ($item) use ($order) {
                $item['order_id'] = $order->id;
                return $item;
            }, $data['details']);
            if (!OrderDetails::insert($details)) {
                abort(500);
            }
            $app = Factory::payment(config('wechat'));
            $unifyRes = $app->order->unify([
                'body' => $data['details'][0]['title'],
                'out_trade_no' => $order->order_no,
                'total_fee' => $order->wx_balance,
                'trade_type' => 'JSAPI',
                'openid' => $this->user['openid'],
            ]);
            if ($unifyRes['return_msg'] != 'OK') {
                abort(5070);
            }
            DB::commit();
        } catch (\Exception $exception) {
            DB::rollBack();
            $fe = FlattenException::create($exception);
            Log::error($exception->getMessage());
            Log::error($fe->getStatusCode());
            abort($fe->getStatusCode());
        }
        return response([
            'order_id' => $order->id,
            'timeStamp' => time(),
            'nonce_str' => $unifyRes['nonce_str'],
            'prepay_id' => $unifyRes['prepay_id'],
            'sign' => $unifyRes['sign'],
        ], 200);
    }

    public function orderPay(Request $request)
    {
        $params = $request->all();
        $order = Order::where('user_id', $request->user()->id)->where('id', $params['order_id'])->first();
        $order->details;
        $app = Factory::payment(config('wechat'));
        $unifyRes = $app->order->unify([
            'body' => $order->details[0]['title'],
            'out_trade_no' => $order->order_no,
            'total_fee' => $order->wx_balance,
            'trade_type' => 'JSAPI',
            'openid' => $this->user['openid'],
        ]);
        if ($unifyRes['return_msg'] != 'OK') {
            abort(5070);
        }
        return response([
            'order_id' => $order->id,
            'timeStamp' => time(),
            'nonce_str' => $unifyRes['nonce_str'],
            'prepay_id' => $unifyRes['prepay_id'],
            'sign' => $unifyRes['sign'],
        ], 200);
    }

    public function update(Request $request)
    {
        $params = $request->all();
        $order = Order::where('user_id', $request->user()->id)->where('id', $params['id'])->first();
        $order->details;
        $status = $params['status'];
        if ($order->status == 0 && $status == -7) {
            $order->status = -7;
        } else if ($order->status == 1 && $status == -1) {
            $order->status = -1;
        } else if (($order->status == 2 || $order->status == 3) && $status == -4) {
            $order->status = -4;
        }
        if (!$order->save()) {
            abort(500);
        }
        return new OrderResource($order);
    }
}
