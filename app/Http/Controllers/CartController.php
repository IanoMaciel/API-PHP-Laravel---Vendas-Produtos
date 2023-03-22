<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Models\Order;
//use App\Models\Product;

class CartController extends Controller
{
    public function checkout(Request $request)
    {
        $items = $request->input('items');
   
        $order = new Order;
        $order->items = json_encode($items);;
        $order->save();
       
        return response()->json(['message' => 'Pedido gravado']);
    }
}


