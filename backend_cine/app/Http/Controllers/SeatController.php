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
                'status' => 'available',
                'row' => $seat['row'],
                'column' => $seat['column'],
                'vip' => 'false',
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

  
}
