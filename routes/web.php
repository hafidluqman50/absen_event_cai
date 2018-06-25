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

// Route::get('/dashboard', function () {
//     return view('dashboard');
// });
Route::get('/sip', 'AuthController@user');
Route::get('/', ['as' => 'login-page', 'uses' => 'AuthController@index'])->middleware('isAuth');
Route::get('/login', ['as' => 'login-page', 'uses' => 'AuthController@index'])->middleware('isAuth');
Route::post('/login/auth', ['as' => 'login-post', 'uses' => 'AuthController@login']);
Route::get('/logout', ['as' => 'logout', 'uses' => 'AuthController@logout']);

// ROUTE ADMIN //
Route::group(['prefix' => 'admin', 'middleware' => 'isAdmin'], function () {
    // PAGE //
    Route::get('/dashboard', ['as' => 'dashboard-admin-page', 'uses' => 'Admin\DashboardController@index']);
    Route::get('/kegiatan', ['as' => 'kegiatan-admin-page', 'uses' => 'Admin\KegiatanController@index']);
    Route::get('/kegiatan/{id}/peserta', ['as' => 'peserta-admin-page', 'uses' => 'Admin\KegiatanController@peserta']);
    Route::get('/kegiatan/{id}/absen', ['as' => 'absen-admin-page', 'uses' => 'Admin\AbsenController@index']);
    Route::get('/anggota', ['as' => 'anggota-admin-page', 'uses' => 'Admin\AnggotaController@index']);
    Route::get('/users', ['as' => 'users-admin-page', 'uses' => 'Admin\UsersController@index']);
    Route::get('/kelompok', ['as' => 'kelompok-admin-page', 'uses' => 'Admin\KelompokController@index']);
    Route::get('/profile', ['as' => 'change-profile-page', 'uses' => 'Admin\DashboardController@profile']);
    Route::get('/bet', function () {
        return view('bet');
    });
    // END PAGE //

    // ACTION //
    Route::get('/kegiatan/tambah', ['as' => 'kegiatan-tambah-admin', 'uses' => 'Admin\KegiatanController@tambah']);
    Route::get('/kegiatan/{id}/edit', ['as' => 'kegiatan-edit-admin', 'uses' => 'Admin\KegiatanController@edit']);
    Route::get('/kegiatan/{id}/delete', ['as' => 'kegiatan-delete-admin', 'uses' => 'Admin\KegiatanController@delete']);
    Route::get('/kegiatan/{id}/peserta/tambah', ['as' => 'peserta-tambah-admin', 'uses' => 'Admin\KegiatanController@tambahPeserta']);
    Route::get('/kegiatan/{id}/peserta/{id_detail}/edit', ['as' => 'peserta-tambah-admin', 'uses' => 'Admin\KegiatanController@editPeserta']);
    Route::get('/kegiatan/{id}/peserta/{id_detail}/delete', ['as' => 'peserta-tambah-admin', 'uses' => 'Admin\KegiatanController@deletePeserta']);
    Route::get('/kegiatan/{id}/peserta/{id_detail}/cetak-bet', ['as' => 'cetak-bet-admin', 'uses' => 'Admin\KegiatanController@cetakBet']);
    Route::get('/kegiatan/{id}/absen/tambah', ['as' => 'absen-tambah-admin', 'uses' => 'Admin\AbsenController@form']);
    // Route::get('/kegiatan/{id}/absen/edit',['as'=>'absen-tambah-admin','uses'=>'Admin\PesertaController@edit']);
    Route::get('/kegiatan/{id}/absen/{id_absen}/delete', ['as' => 'absen-tambah-admin', 'uses' => 'Admin\AbsenController@delete']);
    Route::get('/kegiatan/{id}/cetak', ['as' => 'cetak-kegiatan-admin', 'uses' => 'Admin\KegiatanController@cetak']);
    Route::get('/kelompok/tambah', ['as' => 'kelompok-tambah-admin', 'uses' => 'Admin\KelompokController@tambah']);
    Route::get('/kelompok/{id}/edit', ['as' => 'kelompok-edit-admin', 'uses' => 'Admin\KelompokController@edit']);
    Route::get('/kelompok/{id}/delete', ['as' => 'kelompok-edit-admin', 'uses' => 'Admin\KelompokController@delete']);
    // Route::
    Route::get('/anggota/tambah', ['as' => 'anggota-tambah-admin', 'uses' => 'Admin\AnggotaController@tambah']);
    Route::get('/anggota/{id}/edit', ['as' => 'anggota-edit-admin', 'uses' => 'Admin\AnggotaController@edit']);
    Route::get('/anggota/{id}/delete', ['as' => 'anggota-delete-admin', 'uses' => 'Admin\AnggotaController@delete']);
    Route::get('/users/tambah', ['as' => 'tambah-user-admin', 'uses' => 'Admin\UsersController@tambah']);
    Route::get('/users/{id}/edit', ['as' => 'edit-user-admin', 'uses' => 'Admin\UsersController@edit']);
    Route::get('/users/{id}/delete', ['as' => 'delete-user-admin', 'uses' => 'Admin\UsersController@delete']);
    Route::get('/users/{id}/status-users', ['as' => 'status-user-admin', 'uses' => 'Admin\UsersController@statusAkun']);
    // END ACTION //

    // PROSES //
    Route::post('/kegiatan/save', ['as' => 'kegiatan-post-admin', 'uses' => 'Admin\KegiatanController@save']);
    Route::post('/kegiatan/peserta/save', ['as' => 'kegiatan-peserta-post-admin', 'uses' => 'Admin\KegiatanController@savePeserta']);
    // Route::post('/peserta/save',['as'=>'peserta-post-admin','uses'=>'Admin\PesertaController@save']);
    Route::post('/anggota/save', ['as' => 'anggota-post-admin', 'uses' => 'Admin\AnggotaController@save']);
    Route::post('/absen/save', ['as' => 'absen-post-admin', 'uses' => 'Admin\AbsenController@save']);
    Route::post('/kelompok/save', ['as' => 'kelompok-post-admin', 'uses' => 'Admin\KelompokController@save']);
    Route::post('/users/save', ['as' => 'users-post-admin', 'uses' => 'Admin\UsersController@save']);
    Route::post('/profile/save', ['as' => 'profile-save-admin', 'uses' => 'Admin\DashboardController@save']);
    // END PROSES //
});
// END ROUTE ADMIN //

// ROUTE PETUGAS //
Route::group(['prefix' => 'petugas', 'middleware' => 'isPetugas'], function () {
    Route::get('/dashboard', ['as' => 'dashboard-petugas-page', 'uses' => 'Petugas\DashboardController@index']);
    Route::get('/kegiatan', ['as' => 'kegiatan-petugas-page', 'uses' => 'Petugas\KegiatanController@index']);
    Route::get('/kegiatan/{id}/peserta', ['as' => 'peserta-petugas-page', 'uses' => 'Petugas\KegiatanController@peserta']);
    Route::get('/kegiatan/{id}/absen', ['as' => 'absen-petugas-page', 'uses' => 'Petugas\AbsenController@index']);
    Route::get('/anggota', ['as' => 'anggota-petugas-page', 'uses' => 'Petugas\AnggotaController@index']);
    Route::get('/profile', ['as' => 'change-profile-page', 'uses' => 'Petugas\DashboardController@profile']);
    // END PAGE //

    // ACTION //
    Route::get('/kegiatan/tambah', ['as' => 'kegiatan-tambah-petugas', 'uses' => 'Petugas\KegiatanController@tambah']);
    Route::get('/kegiatan/{id}/edit', ['as' => 'kegiatan-edit-petugas', 'uses' => 'Petugas\KegiatanController@edit']);
    Route::get('/kegiatan/{id}/delete', ['as' => 'kegiatan-delete-petugas', 'uses' => 'Petugas\KegiatanController@delete']);
    Route::get('/kegiatan/{id}/peserta/tambah', ['as' => 'peserta-tambah-petugas', 'uses' => 'Petugas\KegiatanController@tambahPeserta']);
    Route::get('/kegiatan/{id}/peserta/{id_detail}/edit', ['as' => 'peserta-tambah-petugas', 'uses' => 'Petugas\KegiatanController@editPeserta']);
    Route::get('/kegiatan/{id}/peserta/{id_detail}/delete', ['as' => 'peserta-tambah-petugas', 'uses' => 'Petugas\KegiatanController@deletePeserta']);
    Route::get('/kegiatan/{id}/peserta/{id_detail}/cetak-bet', ['as' => 'cetak-bet-petugas', 'uses' => 'Petugas\KegiatanController@cetakBet']);
    Route::get('/kegiatan/{id}/absen/tambah', ['as' => 'absen-tambah-petugas', 'uses' => 'Petugas\AbsenController@form']);
    // Route::get('/kegiatan/{id}/absen/edit',['as'=>'absen-tambah-petugas','uses'=>'Petugas\PesertaController@edit']);
    Route::get('/kegiatan/{id}/absen/{id_absen}/delete', ['as' => 'absen-tambah-petugas', 'uses' => 'Petugas\AbsenController@delete']);
    Route::get('/kegiatan/{id}/cetak', ['as' => 'cetak-kegiatan-petugas', 'uses' => 'Petugas\KegiatanController@cetak']);
    Route::get('/anggota/tambah', ['as' => 'anggota-tambah-petugas', 'uses' => 'Petugas\AnggotaController@tambah']);
    Route::get('/anggota/{id}/edit', ['as' => 'anggota-edit-petugas', 'uses' => 'Petugas\AnggotaController@edit']);
    Route::get('/anggota/{id}/delete', ['as' => 'anggota-delete-petugas', 'uses' => 'Petugas\AnggotaController@delete']);
    // END ACTION //

    // PROSES //
    Route::post('/kegiatan/save', ['as' => 'kegiatan-post-petugas', 'uses' => 'Petugas\KegiatanController@save']);
    Route::post('/kegiatan/peserta/save', ['as' => 'kegiatan-peserta-post-petugas', 'uses' => 'Petugas\KegiatanController@savePeserta']);
    // Route::post('/peserta/save',['as'=>'peserta-post-petugas','uses'=>'Petugas\PesertaController@save']);
    Route::post('/anggota/save', ['as' => 'anggota-post-petugas', 'uses' => 'Petugas\AnggotaController@save']);
    Route::post('/absen/save', ['as' => 'absen-post-petugas', 'uses' => 'Petugas\AbsenController@save']);
    Route::post('/profile/save', ['as' => 'profile-save-petugas', 'uses' => 'Petugas\DashboardController@save']);
    // END PROSES //
});
// END ROUTE PETUGAS //

Route::group(['prefix' => 'guest', 'middleware' => 'isGuest'], function () {
    Route::get('/dashboard', ['as' => 'dashboard-petugas-page', 'uses' => 'Guest\DashboardController@index']);
    Route::get('/kegiatan', ['as' => 'kegiatan-petugas-page', 'uses' => 'Guest\KegiatanController@index']);
    Route::get('/kegiatan/{id}/peserta', ['as' => 'peserta-petugas-page', 'uses' => 'Guest\KegiatanController@peserta']);
    Route::get('/kegiatan/{id}/absen', ['as' => 'absen-petugas-page', 'uses' => 'Guest\AbsenController@index']);
    Route::get('/anggota', ['as' => 'anggota-petugas-page', 'uses' => 'Guest\AnggotaController@index']);
    Route::get('/profile', ['as' => 'change-profile-page', 'uses' => 'Guest\DashboardController@profile']);
    // END PAGE //

    // PROSES //
    Route::post('/profile/save', ['as' => 'profile-save-petugas', 'uses' => 'Guest\DashboardController@save']);
    // END PROSES //
});

// Route::resource('kelompok', 'KelompokController');
// Route::resource('kegiatan', 'KegiatanController');
// Route::resource('laporan', 'LaporanController');
// Route::resource('user', 'UserController');
