<?php


namespace App\Http\Controllers\User;


use App\Http\Controllers\Controller;
use EasyWeChat\Factory;
use Illuminate\Http\Request;

class WeChatController extends Controller
{
    public function ercode(Request $request)
    {
        $scene = json_encode([
            'path' => $request->path,
            'uid' => $request->user()->id,
        ]);
        $dir = '/ercode/';
        $filename = md5($scene) . '.png';
        if (file_exists($dir . $filename)) {
            return response($dir . $filename, 200);
        }
        $app = Factory::miniProgram(config('wechat'));
        $response = $app->app_code->getUnlimit($scene);
        if ($response instanceof \EasyWeChat\Kernel\Http\StreamResponse) {
            $response->saveAs($dir, $filename);
        }
        return response($dir . $filename, 200);
    }
}
