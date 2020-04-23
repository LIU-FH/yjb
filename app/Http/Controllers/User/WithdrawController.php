<?php

namespace App\Http\Controllers\User;

use App\Http\Controllers\Controller;
use App\Http\Requests\User\WithdrawRequest;
use App\Models\User\WalletRecord;
use App\Models\User\Withdraw;

class WithdrawController extends Controller
{
    public function store(WithdrawRequest $request, Withdraw $obj)
    {
        $all = $request->all();
        $obj->fill($all);
        $obj->user_id = $request->user()->id;
        $obj->save();
        WalletRecord::addRecord($this->user['id'], 10, $all['amount']);
        return response(null, 200);
    }
}
