<?php

namespace App\Http\Controllers\User;

use App\Http\Controllers\Controller;
use App\Http\Resources\User\WalletResource;
use App\Models\User\Wallet;

class WalletController extends Controller
{
    public function index()
    {
        return new WalletResource(Wallet::find($this->user['id']));
    }
}
