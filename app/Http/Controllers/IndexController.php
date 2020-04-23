<?php


namespace App\Http\Controllers;


use Illuminate\Http\Request;
use Illuminate\Support\Facades\Cache;
use Illuminate\Support\Facades\Storage;

class IndexController extends Controller
{
    public function upload(Request $request)
    {
        $url = Storage::putFile('public/upload/' . date("Ymd"), $request->file('file'));
        return response(str_replace('public/', '', $url), 200);
    }

    public function phoneCode(Request $request)
    {
        $keyCycle = 'phone-code-' . $request->input('phone') . '-cycle';
        if (Cache::has($keyCycle)) {
            abort(5007);
        }
        $key = 'phone-code-' . $request->input('phone');
        $code = rand(100000, 999999);
        Cache::put($key, 000000, 180);
        Cache::put($keyCycle, 1, 60);
        return response(null, 200);
    }

}
