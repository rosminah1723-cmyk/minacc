<?php

use Illuminate\Support\Facades\Route;

Route::post('register', [App\Http\Controllers\AuthController::class, 'register']);
Route::post('login', [App\Http\Controllers\AuthController::class, 'login']);

Route::middleware('auth:sanctum')->group(function () {
    Route::apiResource('categories', App\Http\Controllers\CategoryController::class)
         ->except(['destroy']);
    Route::delete('categories/{category}', [App\Http\Controllers\CategoryController::class, 'destroy'])
         ->middleware('role:admin');

    Route::apiResource('items', App\Http\Controllers\ItemController::class)
         ->except(['destroy']);
    Route::delete('items/{item}', [App\Http\Controllers\ItemController::class, 'destroy'])
         ->middleware('role:admin');
});