<?php

namespace App\Http\Controllers\User;

use App\Http\Controllers\Controller;
use App\Http\Resources\User\WalletResource;
use App\Models\User\Wallet;
use Illuminate\Http\Request;

class WalletController extends Controller
{
    public function index(Request $request)
    {
        return new WalletResource($request->user()->wallet);
    }
}
