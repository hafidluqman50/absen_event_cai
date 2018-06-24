<?php

/*
|--------------------------------------------------------------------------
| Web Routes
|--------------------------------------------------------------------------
|
| Here is where you can register web routes for your application. These
| routes are loaded by the RouteServiceProvider within a group which
| contains the "web" middleware group. Now create something great!
|
*/

// Route::get('/', function () {
//     return view('welcome');
// });

Route::get('/', function () {
    return view('login');
});

Route::get('/Dashboard', function () {
    return view('dashboard');
});

Route::resource('kelompok', 'KelompokController');
Route::resource('kegiatan', 'KegiatanController');
Route::resource('laporan', 'LaporanController');
Route::resource('user', 'UserController');
