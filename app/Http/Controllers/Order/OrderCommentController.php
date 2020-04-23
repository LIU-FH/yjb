<?php

namespace App\Http\Controllers\Order;

use App\Http\Controllers\Controller;
use App\Http\Queries\Order\OrderCommentQuery;
use App\Http\Requests\Order\OrderCommentRequest;
use App\Http\Resources\Order\OrderCommentResource;
use App\Models\Order\OrderComment;

class OrderCommentController extends Controller
{
    public function index(OrderCommentQuery $query)
    {
        $list = $query->paginate();
        return OrderCommentResource::collection($list);
    }

    public function show($id)
    {
        return new OrderCommentResource(OrderComment::find($id));
    }

    public function store(OrderCommentRequest $request, OrderComment $obj)
    {
        $all = $request->all();
        $all['imgs'] = is_array($all['imgs']) ? implode(',', $all['imgs']) : $all['imgs'];
        $obj->fill($all);
        $obj->user_id = $request->user()->id;
        $obj->save();
        return response(null, 200);
    }
}
