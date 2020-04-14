<?php

namespace App\Http\Controllers\User;

use App\Http\Controllers\Controller;
use App\Http\Resources\User\WalletRecordResource;
use App\Models\User\WalletRecord;

class WalletRecordController extends Controller
{
    public function index()
    {
        $query = new WalletRecord();
        $list = $query->where('user_id',$this->user['id'])->paginate();
        foreach ($list as $item){
            $item->be_user;
        }
        return WalletRecordResource::collection($list);
    }

    public function show($id)
    {
        return new WalletRecordResource(WalletRecord::find($id));
    }
}
