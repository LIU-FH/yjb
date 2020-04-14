<?php


namespace App\Http\Controllers;


use App\Http\Resources\User\UserResource;
use App\Models\User\User;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Storage;

class AuthController extends Controller
{
    public function login(Request $request)
    {
        $params = $request->all();
        if (!$obj = User::where('openid', $params['openId'])->first()) {
            $obj = new User();
        }
        $obj->openid = $params['openId'];
        $obj->unionid = $params['unionId'];
        $obj->parent_id = $params['openId'];
        $obj->nickname = $params['nickName'];
        $obj->avatarurl = $params['avatarUrl'];
        $obj->gender = $params['gender'];
        $obj->last_login_time = $params['openId'];
        if ($obj->save()) {
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
