<?php

namespace App\Http\Requests\Goods;

use App\Http\Requests\BaseRequest;


class GoodsSearchRequest extends BaseRequest
{
    public function rules()
    {
        switch ($this->method()) {
            case 'POST':
                return [
                    'type' => ['required', 'int'],
                    'name' => ['required', 'string'],
                    'price' => ['required', 'string'],
                    'num' => ['required', 'string',],
                ];
                break;
        }
    }

    public function attributes()
    {
        return [
            'type' => '产品类型',
            'name' => '产品名称',
            'price' => '期望价格',
            'num' => '期望数量',
        ];
    }
}
