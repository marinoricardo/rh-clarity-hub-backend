<?php

use App\Http\Controllers\AttendanceController;
use App\Http\Controllers\AuthController;
use App\Http\Controllers\CommonController;
use App\Http\Controllers\FundoAlocadoController;
use App\Http\Controllers\RemovedWorkerController;
use App\Http\Controllers\UserController;
use App\Http\Controllers\WorkerController;
use App\Http\Controllers\WorkerPerformanceController;
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


Route::prefix('auth')->middleware('api')->group(function () {
    Route::post('login', [AuthController::class, 'login']);
    Route::post('logout', [AuthController::class, 'logout']);
    Route::post('refresh', [AuthController::class, 'refresh']);
    Route::post('me', [AuthController::class, 'me']);
});

// Route::post('/users', [UserController::class, 'store']);
Route::apiResource('users', UserController::class);



Route::prefix('workers')->middleware('api')->group(function () {
    Route::get('', [WorkerController::class, 'index']);
    Route::get('/show/{id}', [WorkerController::class, 'show']);
    Route::get('/pending', [WorkerController::class, 'pendingWorkers']);
    Route::post('', [WorkerController::class, 'store']);

    Route::put('/{workerId}/update', [WorkerController::class, 'update']);
    Route::post('/approve/{id}', [WorkerController::class, 'approve']);

    Route::post('/{workerId}/company-data', [WorkerController::class, 'storeCompanyData']);
    Route::post('/{workerId}/documents', [WorkerController::class, 'uploadWorkerDocuments']);
});

Route::prefix('attendances')->middleware('api')->group(function () {
    Route::get('', [AttendanceController::class, 'index']);
    Route::get('/{id}', [AttendanceController::class, 'show']);
    Route::post('', [AttendanceController::class, 'store']);
    Route::put('/{id}', [AttendanceController::class, 'update']);
    Route::delete('/{id}', [AttendanceController::class, 'destroy']);
});



Route::middleware('api')->group(function () {
    Route::apiResource('worker-performances', WorkerPerformanceController::class);

    // Recontratar (rehire) based on performance statuses
    Route::post('worker-performances/recontratar', [WorkerPerformanceController::class, 'recontratar']);

    Route::apiResource('fundos-alocados', FundoAlocadoController::class);

});

Route::middleware('api')->get('/common', [CommonController::class, 'index']);

Route::middleware('api')->prefix('removed-workers')->group(function () {
    Route::get('/', [RemovedWorkerController::class, 'index']);
    Route::post('/', [RemovedWorkerController::class, 'store']);
    Route::get('/{id}', [RemovedWorkerController::class, 'show']);
    Route::put('/{id}', [RemovedWorkerController::class, 'update']);
    Route::delete('/{id}', [RemovedWorkerController::class, 'destroy']);
});
