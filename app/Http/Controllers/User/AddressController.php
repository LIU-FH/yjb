<?php

namespace App\Http\Controllers\User;

use App\Http\Controllers\Controller;
use App\Http\Requests\User\AddressRequest;
use App\Http\Resources\User\AddressResource;
use App\Models\User\Address;
use Illuminate\Http\Request;

class AddressController extends Controller
{
    public function index(Request $request)
    {
        $query = new Address();
        $list = $query->where('user_id', $request->user()->id)->orderBy('default','desc')->paginate();
        return AddressResource::collection($list);
    }

    public function store(AddressRequest $request, Address $obj)
    {
        $all = $request->all();
        if ($all['default']) {
            Address::where('user_id', $request->user()->id)->update(['default' => 0]);
        }
        $obj->fill($all);
        $obj->user_id = $request->user()->id;
        $obj->save();
        return new AddressResource($obj);
    }

    public function update($id, AddressRequest $request)
    {
        $all = $request->all();
        if ($all['default']) {
            Address::where('user_id', $request->user()->id)->update(['default' => 0]);
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
