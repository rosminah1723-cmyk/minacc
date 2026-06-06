<?php

use Illuminate\Support\Facades\Route;
use App\Http\Controllers\AuthController;
use App\Http\Controllers\CategoryController;
use App\Http\Controllers\ItemController;

// Membungkus semua route dengan prefix v1
Route::prefix('v1')->group(function() {
    
    // Route untuk Otentikasi (Bisa diakses tanpa login)
    Route::post('register', [AuthController::class, 'register']);
    Route::post('login', [AuthController::class, 'login']);

    // Route yang diproteksi (Harus login & membawa token Sanctum)
    Route::middleware('auth:sanctum')->group(function() {
        
        // Route Categories (Kecuali Destroy/Delete)
        Route::apiResource('categories', CategoryController::class)->except(['destroy']);
        // Route Destroy Categories khusus untuk Admin
        Route::delete('categories/{category}', [CategoryController::class, 'destroy'])->middleware('role:admin');

        // Route Items (Kecuali Destroy/Delete)
        Route::apiResource('items', ItemController::class)->except(['destroy']);
        // Route Destroy Items khusus untuk Admin
        Route::delete('items/{item}', [ItemController::class, 'destroy'])->middleware('role:admin');
    });
});