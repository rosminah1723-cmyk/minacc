<?php

namespace App\Http\Middleware;

use Closure;
use Illuminate\Http\Request;
use Symfony\Component\HttpFoundation\Response;

class RoleMiddleware
{
    public function handle(Request $request, Closure $next, string $role): Response
    {
        // Mengambil data user yang sedang login via token Sanctum
        $user = $request->user();

        // Memeriksa apakah user ada dan memiliki role yang sesuai dengan parameter (menggunakan !==)
        if (!$user || $user->role !== $role) {
            return response()->json([
                'status'  => 'error',
                'data'    => null,
                'message' => 'Unauthorized. Role ' . $role . ' required.'
            ], 403);
        }

        return $next($request);
    }
}