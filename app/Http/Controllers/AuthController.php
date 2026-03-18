<?php

namespace App\Http\Controllers;

use App\Models\User;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Log;
use Tymon\JWTAuth\Facades\JWTAuth;
use Illuminate\Validation\ValidationException;

class AuthController extends Controller
{
    public function __construct()
    {
        // Middleware JWT do pacote, exceto login
        $this->middleware('jwt.auth', ['except' => ['login']]);
    }

    /**
     * Login
     */
    public function login(Request $request)
    {
        try {
            $credentials = $request->validate([
                'email' => 'required|email',
                'password' => 'required|string',
            ]);

            // Tenta gerar token
            if (! $token = JWTAuth::attempt($credentials)) {
                return $this->errorResponse('Invalid credentials', 400);
            }

            $user = JWTAuth::user();

            return $this->successResponse([
                'access_token' => $token,
                'token_type' => 'bearer',
                'expires_in' => JWTAuth::factory()->getTTL() * 60,
                'user' => $this->userPayload($user),
            ], 'Login successful');

        } catch (ValidationException $e) {

            return $this->errorResponse('Validation error', 422, $e->errors());

        } catch (\Throwable $e) {

            Log::error('Login failed', [
                'error' => $e->getMessage(),
                'email' => $request->email ?? null,
            ]);

            return $this->errorResponse('Internal server error ' . $e->getMessage(), 500);
        }
    }

    /**
     * Logout
     */
    public function logout()
    {
        try {
            JWTAuth::parseToken()->invalidate();

            return $this->successResponse(null, 'Logout successful');

        } catch (\Throwable $e) {
            Log::error('Logout failed', [
                'error' => $e->getMessage(),
            ]);

            return $this->errorResponse('Failed to logout', 500);
        }
    }

    /**
     * Refresh token
     */
    public function refresh()
    {
        try {
            $newToken = JWTAuth::parseToken()->refresh();

            return $this->successResponse([
                'access_token' => $newToken,
                'token_type' => 'bearer',
                'expires_in' => JWTAuth::factory()->getTTL() * 60,
            ], 'Token refreshed');

        } catch (\Throwable $e) {
            Log::error('Token refresh failed', [
                'error' => $e->getMessage(),
            ]);

            return $this->errorResponse('Failed to refresh token', 401);
        }
    }

    /**
     * Authenticated user
     */
    public function me()
    {
        try {
            $user = JWTAuth::parseToken()->authenticate();

            if (! $user) {
                return $this->errorResponse('Unauthorized', 401);
            }

            return $this->successResponse(
                $this->userPayload($user),
                'Authenticated user'
            );

        } catch (\Throwable $e) {
            Log::error('Fetch user failed', [
                'error' => $e->getMessage(),
            ]);

            return $this->errorResponse('Unauthorized', 401);
        }
    }

    /*
    |--------------------------------------------------------------------------
    | Helpers
    |--------------------------------------------------------------------------
    */

    private function successResponse($data = null, string $message = 'Success', int $status = 200)
    {
        return response()->json([
            'success' => true,
            'message' => $message,
            'data' => $data,
        ], $status);
    }

    private function errorResponse(string $message, int $status, $errors = null)
    {
        return response()->json([
            'success' => false,
            'message' => $message,
            'errors' => $errors,
        ], $status);
    }

    private function userPayload(User $user)
    {
        return [
            'id' => $user->id,
            'name' => $user->name,
            'email' => $user->email,
            'role' => $user->role,
            'created_at' => $user->created_at,
        ];
    }
}
