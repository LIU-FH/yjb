<?php

namespace App\Models\User;

use Illuminate\Database\Eloquent\Model;

class Withdraw extends Model
{
    protected $table = 'withdraw';

    protected $fillable = [
        'user_id',
        'type',
        'amount',
        'name',
        'tel',
        'bank_card',
        'bank_address',
        'status',
        'remark',
    ];
}
