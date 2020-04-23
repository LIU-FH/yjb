<?php

namespace App\Http\Controllers\User;

use App\Http\Controllers\Controller;
use App\Http\Resources\User\UserResource;
use App\Models\Goods\GoodsCart;
use App\Models\Order\Order;
use App\Models\User\User;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Cache;

class UserController extends Controller
{
    public function info(Request $request)
    {
        return new UserResource(User::find($request->user()->id));
    }

    public function orderCount(Request $request)
    {
        $uid = $request->user()->id;
        $count['status_0'] = Order::where('status', 0)->where('user_id', $uid)->count();
        $count['status_1'] = Order::where('status', 1)->where('user_id', $uid)->count();
        $count['status_2'] = Order::where('status', 2)->where('user_id', $uid)->count();
        $count['status_3'] = Order::where('status', 3)->where('user_id', $uid)->count();
        return response($count, 200);
    }

    public function cartCount(Request $request)
    {
        $count = GoodsCart::where('user_id', $request->user()->id)->count();
        return response($count, 200);
    }

    public function bindPhone(Request $request)
    {
        $key = 'phone-code-' . $request->user()->id;
        if (Cache::get($key) != $request->get('code')) {
            abort(5009);
        }
        $user = User::find($request->user()->id);
        $user->phone = $request->get('phone');
        $user->save();
        return new UserResource($user);
    }

    public function bindParent(Request $request)
    {
        $user = User::find($request->user()->id);
        if (!$user->parent_id) {
            $parent = User::where('keyword', $request->get('keyword'))->first();
            if ($parent) {
                $user->parent_id = $parent->id;
                $user->save();
            }
        }
        return new UserResource($user);
    }
}
