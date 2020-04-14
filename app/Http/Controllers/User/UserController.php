<?php

namespace App\Http\Controllers\User;

use App\Http\Controllers\Controller;
use App\Http\Resources\User\UserResource;
use App\Models\Order\Order;
use App\Models\User\User;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Cache;

class UserController extends Controller
{
    public function info()
    {
        return new UserResource(User::find($this->user['id']));
    }

    public function orderCount()
    {
        $id = $this->user['id'];
        $count['status_0'] = Order::where('status', 0)->where('user_id', $id)->count();
        $count['status_1'] = Order::where('status', 1)->where('user_id', $id)->count();
        $count['status_2'] = Order::where('status', 2)->where('user_id', $id)->count();
        $count['status_3'] = Order::where('status', 3)->where('user_id', $id)->count();
        return response($count, 200);
    }

    public function cartCount()
    {
        $id = $this->user['id'];
        $count = rand(0, 100);
        return response($count, 200);
    }

    public function getPhoneCode()
    {
        $key = 'phone-code-' . $this->user['id'];
        if (Cache::has($key)) {
            abort(5007);
        }
        $code = rand(100000, 999999);
        Cache::put($key, 000000, 60);
        return response(null, 200);
    }

    public function bindPhone(Request $request)
    {
        $key = 'phone-code-' . $this->user['id'];
        if (Cache::get($key) != $request->get('code')) {
            abort(5009);
        }
        $user = User::find($this->user['id']);
        $user->phone = $request->get('phone');
        $user->save();
        return new UserResource($user);
    }

    public function bindParent(Request $request)
    {
        $user = User::find($this->user['id']);
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
