<?php


namespace App\Http\Controllers;


use App\Http\Resources\User\UserResource;
use App\Models\User\User;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Storage;
use EasyWeChat\Factory;
use Illuminate\Support\Facades\Log;

class AuthController extends Controller
{
    public function login(Request $request)
    {
        $params = $request->all();
        $params['openId'] = '';
        $params['unionId'] = '';
        if(!empty($params['code'])){
            $app = Factory::miniProgram(config('wechat'));
            $res = $app->auth->session($params['code']);
            Log::info("wechat",$res);
            $params['openId'] = $res['openId'];
            $params['unionId'] = $res['unionId'];
        }
        if (!$obj = User::where('openid', $params['openId'])->first()) {
            $obj = new User();
            $obj->parent_id = 0;
            $obj->keyword = md5(md5(md5($params['openId'])));
        }
        $obj->openid = $params['openId'];
        $obj->unionid = $params['unionId'];
        $obj->nickname = $params['userInfo']['nickName'];
        $obj->avatarurl = $params['userInfo']['avatarUrl'];
        $obj->gender = $params['userInfo']['gender'];
        $obj->last_login_time = date("Y-m-d H:i:s",time());
        if (!$obj->save()) {
            abort(5001);
        }
        return new UserResource($obj);
    }

    public function upload(Request $request)
    {
        $url = Storage::putFile('public/upload/' . date("Ymd"), $request->file('file'));
        return response(str_replace('public/', '', $url), 200);
    }
}
