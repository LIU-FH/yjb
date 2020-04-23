<?php


namespace App\Http\Controllers;


use App\Http\Resources\User\UserResource;
use App\Models\User\User;
use App\Models\User\Wallet;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Cache;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Storage;
use EasyWeChat\Factory;
use Illuminate\Support\Facades\Log;

class AuthController extends Controller
{
    public function wxLogin(Request $request)
    {
        $openid = $unionid = $session_key = '111';
        if (!empty($request->input('code'))) {
            $wxAuth = [];
            try {
                $app = Factory::miniProgram(config('wechat'));
                $wxAuth = $app->auth->session($request->input('code'));
                $openid = $wxAuth['openId'];
                $unionid = $wxAuth['unionId'];
                $session_key = $wxAuth['session_key'];
            } catch (\Exception $e) {
                Log::error("wx-auth", $wxAuth);
                abort(5003);
            }
        }
        if (!$user = User::where('openid', $openid)->first()) {
            $user = new User();
            $params['keyword'] = uniqid();
        }
        $params['openid'] = $openid;
        $params['unionid'] = $unionid;
        $params['session_key'] = $session_key;
        $params['nickname'] = $request->input('userInfo')['nickName'];
        $params['avatarurl'] = $request->input('userInfo')['avatarUrl'];
        $params['gender'] = $request->input('userInfo')['gender'];
        return $this->doLogin($user, $params);
    }

    public function phoneLogin(Request $request)
    {
        $key = 'phone-code-' . $request->input('phone');
        if (Cache::get($key) != $request->input('code')) {
            abort(5009);
        }
        if (!$user = User::where('phone', $request->input('phone'))->first()) {
            $user = new User();
            $params['keyword'] = uniqid();
            $params['nickname'] = "悦会员-" . rand(1000, 10000);
            $params['avatarurl'] = 'https://img-cdn-qiniu.dcloud.net.cn/uniapp/doc/github.svg';
            $params['gender'] = 2;
        }
        return $this->doLogin($user, $params);
    }

    public function doLogin($user, $params)
    {
        DB::beginTransaction();
        try {
            $params['last_login_time'] = date("Y-m-d H:i:s", time());
            $user->fill($params);
            if (!$user->save()) {
                abort(5001);
            }
            if (!$user->wallet) {
                if (!$user->wallet()->save(new Wallet())) {
                    abort(5001);
                }
            }
            DB::commit();
        } catch (\Exception $exception) {
            DB::rollBack();
            abort(5001);
        }
        $token = $user->createToken($user->id);
        return response([
            'token' => $token->plainTextToken,
            'userInfo' => new UserResource($user)
        ], 200);
    }
}
