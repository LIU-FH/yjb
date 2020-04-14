<?php


namespace App\Http\Requests\User;

use App\Http\Requests\BaseRequest;

class AddressRequest extends BaseRequest
{
    public function rules()
    {
        switch ($this->method()) {
            case 'POST':
                return [
                    'name' => ['required', 'string'],
                    'tel' => ['required', 'string', 'max:100'],
                    'city' => ['required', 'string'],
                    'details' => ['required', 'string'],
                ];
                break;
            case 'PATCH':
                return [
                    'name' => ['required'],
                    'tel' => ['required'],
                    'city' => ['required'],
                    'details' => ['required'],
                ];
                break;
        }
    }

    public function attributes()
    {
        return [
            'name' => '姓名',
            'tel' => '手机号',
            'city' => '城市',
            'details' => '详细地址',
        ];
    }
}
