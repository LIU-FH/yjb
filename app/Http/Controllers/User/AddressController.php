<?php

namespace App\Http\Controllers\User;

use App\Http\Controllers\Controller;
use App\Http\Requests\User\AddressRequest;
use App\Http\Resources\User\AddressResource;
use App\Models\User\Address;

class AddressController extends Controller
{
    public function index()
    {
        $query = new Address();
        $list = $query->where('user_id', $this->user['id'])->orderBy('default','desc')->paginate();
        return AddressResource::collection($list);
    }

    public function store(AddressRequest $request, Address $obj)
    {
        $all = $request->all();
        if ($all['default']) {
            Address::where('user_id', $this->user['id'])->update(['default' => 0]);
        }
        $obj->fill($all);
        $obj->user_id = $this->user['id'];
        $obj->save();
        return new AddressResource($obj);
    }

    public function update($id, AddressRequest $request)
    {
        $all = $request->all();
        if ($all['default']) {
            Address::where('user_id', $this->user['id'])->update(['default' => 0]);
        }
        $articles = Address::find($id);
        $articles->update($all);
        return new AddressResource($articles);
    }

    public function destroy($id)
    {
        $note = Address::find($id);
        $note->delete();
        return response(null, 200);
    }
}
