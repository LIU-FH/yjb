<?php


namespace App\Http\Controllers\Pay;

use App\Models\Order\Order;
use EasyWeChat\Factory;
use App\Http\Controllers\Controller;
use Illuminate\Http\Request;

class WxPayController extends Controller
{
    public function pay(Request $request)
    {
        $params = $request->all();
        if (isset($params['id']) && $params['id']){
            $order = Order::find($params['id']);
            if ($order->status = 1){
                abort(5011);
            }
        }else {
            $order = new Order();
            $order->user_id = $request->user()->id;
            $order->order_no = date('YmdHis' . $request->user()->id);
            $order->coun = 1;
            $order->amount_total = 0.01;
            $order->amount = 0.01;
            $order->balance = 0;
            $order->wx_balance = 0.01;
            $order->discount = 0;
            $order->address_name = '123';
            $order->address_tel = '123';
            $order->address_details = '123';
            $order->status = 0;
            $order->save();
        }
        $app = Factory::payment(config('wechat'));
        $result = $app->order->unify([
            'body' => '充值测试商品',
            'out_trade_no' => $order->order_no,
            'total_fee' => $order->wx_balance,
            'trade_type' => 'JSAPI',
            'openid' => $this->user['openid'],
        ]);
        if ($request['return_msg'] != 'OK') {
            abort(5010);
        }
        return response($result, 200);
    }

    public function notify()
    {
        $app = Factory::payment(config('wechat'));
        return $app->handlePaidNotify(function ($message, $fail) {
            $order = Order::where('order_no', $message['out_trade_no'])->first();
            if (!$order || $order->status == 1) {
                return true;
            }
            if ($message['return_code'] === 'SUCCESS') {
                if ($this->check($order->order_no)) {
                    $order->status = 1;
                } else {
                    return $fail('通信失败，请稍后再通知我');
                }
            } else {
                return $fail('通信失败，请稍后再通知我');
            }
            $order->save();
            return true;
        });
    }

    public function check($order_no)
    {
        $app = Factory::payment(config('wechat'));
        $res = $app->order->queryByOutTradeNumber($order_no);
        return $res['return_code'] === 'SUCCESS';
    }
}
