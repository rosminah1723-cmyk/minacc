<?php

namespace App\Http\Controllers;

use App\Models\Item;
use Illuminate\Http\Request;    

class ItemController extends Controller{

    public function index(){
        return response()->json(Item::with('category')->get());
    }

    public function store(Request $request){
        $item = Item::create($request->all());
        return response()->json($item, 201);
    }

    public function show($id){
        $item = Item::with('category')->findOrFail($id);
        return response()->json($item);
    }

    public function update(Request $request, $id){
        $item = Item::findOrFail($id);
        $data = json_decode($request->getContent(), true) ?? $request->all();
        $item->update($data);
        return response()->json($item);
    }

    public function destroy($id){
        Item::destroy($id);
        return response()->json(null, 204);
    }
}