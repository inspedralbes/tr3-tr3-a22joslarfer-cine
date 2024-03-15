<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Models\Checkout;
use Illuminate\Support\Facades\Log;
use Illuminate\Support\Facades\DB;

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
        try {
            DB::beginTransaction();

            foreach ($request->all() as $seat) {
                Checkout::create([
                    'movie_id' => (int)$seat['movie_id'],
                    'user_id' => $seat['user_id'],
                    'seat_id' => $seat['seat_id'],
                    'date' => $seat['date'],
                    'total' => $seat['total'],
                    'unit_seat_price' => $seat['unit_seat_price'],
                ]);
            }

            DB::commit();

            return response()->json(['message' => 'Purchase successful'], 201);
        } catch (\Illuminate\Database\QueryException $e) {
            DB::rollBack();

            // Log the error for investigation
            Log::error('Database error occurred while storing the checkout: ' . $e->getMessage());

            return response()->json(['error' => 'Database error occurred while storing the checkout.'], 500);
        } catch (\Exception $e) {
            DB::rollBack();

            // Log the error for investigation
            Log::error('An unexpected error occurred while storing the checkout: ' . $e->getMessage());

            return response()->json(['error' => 'An unexpected error occurred while storing the checkout.'], 500);
        }
    }
}
