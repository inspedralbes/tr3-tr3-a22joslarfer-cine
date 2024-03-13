<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Models\Seat;

class SeatController extends Controller
{
    //

    public function index()
    {
        return Seat::all();
    }

    public function insert(Request $request)
    {
        $seats = $request->json()->all();

        foreach ($seats as $seat) {
            Seat::create([
                'movie_id' => $seat['movie_id'],
                'status' => $seat['status'],
                'row' => $seat['row'],
                'column' => $seat['column'],
            ]);
        }
        // return response with message if positive
        return response()->json(['message' => 'seats inserted'], 201);
    }

    // find all seats for a movie

    public function show($id)
    {
        return Seat::where('movie_id', $id)->get();
    }

    public function buyPurchasedSeats(Request $request)
    {
        $seats = $request->json()->all();

        foreach ($seats as $seat) {
            Seat::where('id', $seat['id'])->update([
                'status' => 'unavailable',
            ]);
        }
        // return response with message if positive
        return response()->json(['message' => 'seats updated'], 201);
    }
}
