<?php

namespace App\Http\Controllers\API;

use App\Http\Controllers\Controller;

class ResponseBaseController extends Controller
{
    public function sendSuccess($result, $message, $code = 200)
    {
        $response = [
            'success' => TRUE,
            'result' => $result,
            'message' => $message,
        ];

        return response()->json($response, $code);
    }

    public function sendError($error, $errorMessages = [], $code = 200)
    {
        $response = [
            'success' => FALSE,
            'message' => $error,
        ];

        if (!empty($errorMessages)) {
            $response['result'] = $errorMessages;
        }

        return response()->json($response, $code);
    }
}
