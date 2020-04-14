<?php


namespace App\Http\Requests\User;

use App\Http\Requests\BaseRequest;

class WithdrawRequest extends BaseRequest
{
    public function rules()
    {
        switch ($this->method()) {
            case 'POST':
                return [
                    'type' => ['required', 'int'],
                    'amount' => ['required', 'int'],
                ];
                break;
        }
    }

    public function attributes()
    {
        return [
            'type' => '类型',
            'amount' => '金额',
        ];
    }
}
