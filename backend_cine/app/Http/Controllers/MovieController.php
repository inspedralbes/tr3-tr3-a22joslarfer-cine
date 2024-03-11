<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Models\Movie;

class MovieController extends Controller
{
    //
    public function store(Request $request)
    {
        $validatedData = $request->validate([
            'title' => 'required|string',
            'year' => 'required|integer',
            'rating' => 'required|numeric',
            'poster' => 'required|string',
            'synopsis' => 'required|string',
            'genre_id' => 'required|integer',
        ]);

        $movie = Movie::create($validatedData);

        return response()->json($movie, 201);
    }

    public function index()
    {
        return Movie::all();
    }

    public function show($id)
    {
        return Movie::find($id);
    }

    public function update(Request $request, $id)
    {
        $movie = Movie::findOrFail($id);
        $movie->update($request->all());

        return response()->json($movie, 200);
    }

    public function delete(Request $request, $id)
    {
        $movie = Movie::findOrFail($id);
        $movie->delete();

        return response()->json(null, 204);
    }

    // get json and insert into db

    public function insert(Request $request)
    {
        $movies = $request->json()->all();

        foreach ($movies as $movie) {
            Movie::create([
                'title' => $movie['title'],
                'year' => $movie['year'],
                'rating' => $movie['rating'],
                'poster' => $movie['poster'],
                'synopsis' => $movie['synopsis'],
                'genre_id' => $movie['genre_id'],
            ]);
        }

        return response()->json(null, 204);
    }

    
}
