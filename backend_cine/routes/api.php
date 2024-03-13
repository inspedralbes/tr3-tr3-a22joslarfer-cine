<?php

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Route;

/*
|--------------------------------------------------------------------------
| API Routes
|--------------------------------------------------------------------------
|
| Here is where you can register API routes for your application. These
| routes are loaded by the RouteServiceProvider and all of them will
| be assigned to the "api" middleware group. Make something great!
|
*/

//rutas autenticadas
Route::group(['middleware' => 'jwt'], function () {
    Route::post('logout', [App\Http\Controllers\AuthController::class, 'logout']);
    Route::post('buyPurchasedSeats', [App\Http\Controllers\SeatController::class, 'buyPurchasedSeats']);
});
//rutas para usuarios
Route::post('register', [App\Http\Controllers\AuthController::class, 'register']);
Route::post('login', [App\Http\Controllers\AuthController::class, 'login']);


// rutas para movies
Route::post('movies', [App\Http\Controllers\MovieController::class, 'insert']);
Route::get('movies', [App\Http\Controllers\MovieController::class, 'index']);
Route::get('movies/{id}', [App\Http\Controllers\MovieController::class, 'show']);
Route::put('movies/{id}', [App\Http\Controllers\MovieController::class, 'update']);
Route::delete('movies/{id}', [App\Http\Controllers\MovieController::class, 'destroy']);
Route::get('estrenos', [App\Http\Controllers\MovieController::class, 'getEstrenos']);


// rutas para géneros
Route::post('genres', [App\Http\Controllers\GenreController::class, 'insert']);
Route::get('genres', [App\Http\Controllers\GenreController::class, 'index']);
Route::get('genres/{id}', [App\Http\Controllers\GenreController::class, 'show']);
Route::put('genres/{id}', [App\Http\Controllers\GenreController::class, 'update']);
Route::delete('genres/{id}', [App\Http\Controllers\GenreController::class, 'destroy']);


// rutas para asientos
Route::get('seats', [App\Http\Controllers\SeatController::class, 'index']);
Route::get('seats/{id}', [App\Http\Controllers\SeatController::class, 'show']);
Route::post('seats', [App\Http\Controllers\SeatController::class, 'insert']);

