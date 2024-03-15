<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Models\Checkout;

class CheckoutController extends Controller
{
    //

    public function index()
    {
        return Checkout::all();
    }

    public function showBasedOnUser($id)
    {
        return Checkout::where('user_id', $id)->get();
    }

    public function store(Request $request)
    {
    

        $checkout = Checkout::create([
            'movie_id' => $request->movie_id,
            'user_id' => $request->user_id,
            'seat_id' => $request->seat_id,
            'date' => $request->date,
            'total' => $request->total,
            'seat_unit_price' => $request->unit_seat_price,
        ]);


        return response()->json($checkout, 201);
    }

    
    


}
