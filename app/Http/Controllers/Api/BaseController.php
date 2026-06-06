<?php

namespace App\Http\Controllers\Api;

use App\Http\Controllers\Controller;
use Illuminate\Http\JsonResponse;

class BaseController extends Controller 
{
    /**
     * Response Sukses Standar
     */
    protected function success($data = null, $message = null, $code = 200): JsonResponse 
    {
        return response()->json([
            'success' => true,
            'message' => $message,
            'data'    => $data,
        ], $code);
    }

    /**
     * Response Error Standar
     */
    protected function error($message = null, $code = 400): JsonResponse 
    {
        return response()->json([
            'success' => false,
            'message' => $message,
        ], $code);
    }
}