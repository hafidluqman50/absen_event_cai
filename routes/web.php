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

Route::get('/', function () {
    return view('welcome');
});
Route::get('/barcode', function () {
    return view('barcode');
});

// Route::get('/dashboard', function () {
//     return view('dashboard');
// });
// Route::get('/sip', 'AuthController@user');
// Route::get('/betpeserta', function () {
//     return view('betpeserta');
// });
Route::get('/yes/{id}/{ket}', 'Admin\JadwalController@coba');
Route::get('/', ['as' => 'login-page', 'uses' => 'AuthController@index'])->middleware('isAuth');
Route::get('/login', ['as' => 'login-page', 'uses' => 'AuthController@index'])->middleware('isAuth');
Route::post('/login/auth', ['as' => 'login-post', 'uses' => 'AuthController@login']);
Route::get('/logout', ['as' => 'logout', 'uses' => 'AuthController@logout']);
Route::get('/get-anggota/{id}', ['as' => 'get-ajax-anggota', 'uses' => 'AjaxController@getAnggota']);

Route::group(['prefix' => 'api', 'middleware' => 'CorsApi'], function () {
    Route::get('/absen-cai', 'ApiController@absen');
});

// Route::get('/absen-cai',function(){
//     return response()->json(['sip']);
// });
Route::get('/absen-cai', 'ApiController@absen');

Route::group(['prefix' => 'ajax', 'middleware' => 'ajax'], function () {
    Route::get('/kelompok', 'AjaxController@dataKelompok');
    Route::get('/anggota/{id}', 'AjaxController@dataAnggota');
    Route::get('/kegiatan', 'AjaxController@dataKegiatan');
    Route::get('/peserta/{id}', 'AjaxController@dataPeserta');
    Route::get('/jadwal/{id}', 'AjaxController@dataJadwal');
    Route::get('/absen/{id}/{id_jadwal}', 'AjaxController@dataAbsen');
    Route::get('/users', 'AjaxController@dataUsers');
});

// ROUTE ADMIN //
Route::group(['prefix' => 'admin', 'middleware' => 'isAdmin'], function () {
    // PAGE //
    Route::get('/my_id', 'Admin\DashboardController@tes');
    Route::get('/dashboard', ['as' => 'dashboard-admin-page', 'uses' => 'Admin\DashboardController@index']);

    Route::get('/kegiatan', ['as' => 'kegiatan-admin-page', 'uses' => 'Admin\KegiatanController@index']);
    Route::get('/kegiatan/{id}/peserta', ['as' => 'peserta-admin-page', 'uses' => 'Admin\KegiatanController@peserta']);
    Route::get('/kegiatan/{id}/jadwal', ['as' => 'jadwal-admin-page', 'uses' => 'Admin\JadwalController@index']);
    Route::get('/kegiatan/{id}/jadwal/{id_jadwal}/absen', ['as' => 'absen-admin-page', 'uses' => 'Admin\AbsenController@index']);

    Route::get('/users', ['as' => 'users-admin-page', 'uses' => 'Admin\UsersController@index']);

    Route::get('/kelompok', ['as' => 'kelompok-admin-page', 'uses' => 'Admin\KelompokController@index']);
    Route::get('/kelompok/{id}/anggota', ['as' => 'peserta-admin-page', 'uses' => 'Admin\AnggotaController@index']);

    Route::get('/profile', ['as' => 'change-profile-page', 'uses' => 'Admin\DashboardController@profile']);
    Route::get('/bet', function () {
        return view('bet');
    });
    // END PAGE //

    // ACTION //
    Route::get('/kegiatan/tambah', ['as' => 'kegiatan-tambah-admin', 'uses' => 'Admin\KegiatanController@tambah']);
    Route::get('/kegiatan/{id}/edit', ['as' => 'kegiatan-edit-admin', 'uses' => 'Admin\KegiatanController@edit']);
    Route::get('/kegiatan/{id}/delete', ['as' => 'kegiatan-delete-admin', 'uses' => 'Admin\KegiatanController@delete']);
    Route::get('/kegiatan/{id}/status-kegiatan', ['as' => 'kegiatan-status-admin', 'uses' => 'Admin\KegiatanController@statusKegiatan']);

    Route::get('/kegiatan/{id}/peserta/tambah', ['as' => 'peserta-tambah-admin', 'uses' => 'Admin\KegiatanController@tambahPeserta']);
    Route::get('/kegiatan/{id}/peserta/{id_detail}/edit', ['as' => 'peserta-tambah-admin', 'uses' => 'Admin\KegiatanController@editPeserta']);
    Route::get('/kegiatan/{id}/peserta/{id_detail}/delete', ['as' => 'peserta-tambah-admin', 'uses' => 'Admin\KegiatanController@deletePeserta']);
    Route::get('/kegiatan/{id}/peserta/{id_detail}/cetak-bet', ['as' => 'cetak-bet-admin', 'uses' => 'Admin\KegiatanController@cetakBet']);
    Route::get('/kegiatan/{id}/peserta/cetak-semua-bet', ['as' => 'cetak-bet-semua-admin', 'uses' => 'Admin\KegiatanController@cetakBetAll']);
    Route::get('/kegiatan/{id}/peserta/cetak-barcode',['as'=>'cetak-barcode-semua-admin','uses'=>'Admin\KegiatanController@cetakBarcode']);
    // Route::get('/kegiatan/{id}/peserta/{id_detail}/download-bet',['as' => 'download-bet-admin', 'uses' => 'Admin\KegiatanController@cetakBetPdf']);
    // Route::get('/kegiatan/{id}/peserta/download-semua-bet', ['as' => 'download-bet-semua-admin', 'uses' => 'Admin\KegiatanController@cetakBetPdfAll']);

    Route::get('/kegiatan/{id}/jadwal/tambah', ['as' => 'jadwal-tambah-admin', 'uses' => 'Admin\JadwalController@tambah']);
    Route::get('/kegiatan/{id}/jadwal/{id_jadwal}/edit', ['as' => 'jadwal-edit-admin', 'uses' => 'Admin\JadwalController@edit']);
    Route::get('/kegiatan/{id}/jadwal/{id_jadwal}/delete', ['as' => 'jadwal-delete-admin', 'uses' => 'Admin\JadwalController@delete']);
    Route::get('/kegiatan/{id}/jadwal/{id_jadwal}/{ket}/cetak-excel', ['as' => 'jadwal-cetak-admin', 'uses' => 'Admin\JadwalController@cetakLaporanExcel']);
    Route::get('/kegiatan/{id}/jadwal/{id_jadwal}/{ket}/download-pdf', ['as' => 'jadwal-cetak-admin', 'uses' => 'Admin\JadwalController@cetakLaporanPdf']);
    Route::get('/kegiatan/{id}/jadwal/{ket}/cetak-semua-excel', ['as' => 'cetak-kegiatan-admin', 'uses' => 'Admin\JadwalController@cetakLaporanExcelAll']);
    Route::get('/kegiatan/{id}/jadwal/{ket}/download-semua-pdf', ['as' => 'cetak-kegiatan-admin', 'uses' => 'Admin\JadwalController@cetakLaporanPdfAll']);
    Route::get('/kegiatan/{id}/jadwal/{id_jadwal}/absen/{id_absen}/delete', ['as' => 'absen-admin-page', 'uses' => 'Admin\AbsenController@delete']);

    Route::get('/kelompok/tambah', ['as' => 'kelompok-tambah-admin', 'uses' => 'Admin\KelompokController@tambah']);
    Route::get('/kelompok/{id}/edit', ['as' => 'kelompok-edit-admin', 'uses' => 'Admin\KelompokController@edit']);
    Route::get('/kelompok/{id}/delete', ['as' => 'kelompok-edit-admin', 'uses' => 'Admin\KelompokController@delete']);
    Route::get('/kelompok/{id}/anggota/tambah', ['as' => 'anggota-tambah-admin', 'uses' => 'Admin\AnggotaController@tambah']);
    Route::get('/kelompok/{id}/anggota/{id_anggota}/edit', ['as' => 'anggota-edit-admin', 'uses' => 'Admin\AnggotaController@edit']);
    Route::get('/kelompok/{id}/anggota/{id_anggota}/delete', ['as' => 'anggota-delete-admin', 'uses' => 'Admin\AnggotaController@delete']);
    Route::get('/import', ['as' => 'import-excel-admin', 'uses' => 'Admin\KelompokController@importForm']);
    Route::get('/contoh-import', ['as' => 'contoh-format-excel', 'uses' => 'Admin\KelompokController@contohFormat']);

    Route::get('/users/tambah', ['as' => 'tambah-user-admin', 'uses' => 'Admin\UsersController@tambah']);
    Route::get('/users/{id}/edit', ['as' => 'edit-user-admin', 'uses' => 'Admin\UsersController@edit']);
    Route::get('/users/{id}/delete', ['as' => 'delete-user-admin', 'uses' => 'Admin\UsersController@delete']);
    Route::get('/users/{id}/status-users', ['as' => 'status-user-admin', 'uses' => 'Admin\UsersController@statusAkun']);
    // END ACTION //

    // PROSES //
    Route::post('/kegiatan/save', ['as' => 'kegiatan-post-admin', 'uses' => 'Admin\KegiatanController@save']);
    Route::post('/kegiatan/peserta/save', ['as' => 'kegiatan-peserta-post-admin', 'uses' => 'Admin\KegiatanController@savePeserta']);
    Route::post('/anggota/save', ['as' => 'anggota-post-admin', 'uses' => 'Admin\AnggotaController@save']);
    Route::post('/absen/save', ['as' => 'absen-post-admin', 'uses' => 'Admin\AbsenController@save']);
    Route::post('/jadwal/save', ['as' => 'jadwal-post-admin', 'uses' => 'Admin\JadwalController@save']);
    Route::post('/kelompok/save', ['as' => 'kelompok-post-admin', 'uses' => 'Admin\KelompokController@save']);
    Route::post('/import/post', ['as' => 'import-post-admin', 'uses' => 'Admin\KelompokController@importExcel']);
    Route::post('/users/save', ['as' => 'users-post-admin', 'uses' => 'Admin\UsersController@save']);
    Route::post('/profile/save', ['as' => 'profile-save-admin', 'uses' => 'Admin\DashboardController@save']);
    // END PROSES //
});
// END ROUTE ADMIN //

// ROUTE PETUGAS //
Route::group(['prefix' => 'petugas', 'middleware' => 'isPetugas'], function () {
    // PAGE //
    Route::get('/dashboard', ['as' => 'dashboard-admin-page', 'uses' => 'Petugas\DashboardController@index']);
    Route::get('/kegiatan', ['as' => 'kegiatan-admin-page', 'uses' => 'Petugas\KegiatanController@index']);
    Route::get('/kegiatan/{id}/peserta', ['as' => 'peserta-admin-page', 'uses' => 'Petugas\KegiatanController@peserta']);
    Route::get('/kegiatan/{id}/jadwal', ['as' => 'jadwal-admin-page', 'uses' => 'Petugas\JadwalController@index']);
    Route::get('/kegiatan/{id}/jadwal/{id_jadwal}/absen', ['as' => 'absen-admin-page', 'uses' => 'Petugas\AbsenController@index']);
    Route::get('/profile', ['as' => 'change-profile-page', 'uses' => 'Petugas\DashboardController@profile']);
    Route::get('/bet', function () {
        return view('bet');
    });
    // END PAGE //

    // ACTION //
    Route::get('/kegiatan/tambah', ['as' => 'kegiatan-tambah-admin', 'uses' => 'Petugas\KegiatanController@tambah']);
    Route::get('/kegiatan/{id}/edit', ['as' => 'kegiatan-edit-admin', 'uses' => 'Petugas\KegiatanController@edit']);
    Route::get('/kegiatan/{id}/delete', ['as' => 'kegiatan-delete-admin', 'uses' => 'Petugas\KegiatanController@delete']);
    Route::get('/kegiatan/{id}/status-kegiatan', ['as' => 'kegiatan-status-petugas', 'uses' => 'Petugas\KegiatanController@statusKegiatan']);

    Route::get('/kegiatan/{id}/peserta/tambah', ['as' => 'peserta-tambah-admin', 'uses' => 'Petugas\KegiatanController@tambahPeserta']);
    Route::get('/kegiatan/{id}/peserta/{id_detail}/edit', ['as' => 'peserta-tambah-admin', 'uses' => 'Petugas\KegiatanController@editPeserta']);
    Route::get('/kegiatan/{id}/peserta/{id_detail}/delete', ['as' => 'peserta-tambah-admin', 'uses' => 'Petugas\KegiatanController@deletePeserta']);
    Route::get('/kegiatan/{id}/peserta/{id_detail}/cetak-bet', ['as' => 'cetak-bet-admin', 'uses' => 'Petugas\KegiatanController@cetakBet']);
    Route::get('/kegiatan/{id}/peserta/cetak-semua-bet', ['as' => 'cetak-bet-semua-admin', 'uses' => 'Petugas\KegiatanController@cetakBetAll']);
    Route::get('/kegiatan/{id}/peserta/cetak-barcode',['as'=>'cetak-barcode-semua-admin','uses'=>'Petugas\KegiatanController@cetakBarcode']);
    // Route::get('/kegiatan/{id}/peserta/{id_detail}/download-bet',['as' => 'download-bet-admin', 'uses' => 'Petugas\KegiatanController@cetakBetPdf']);
    // Route::get('/kegiatan/{id}/peserta/download-semua-bet', ['as' => 'download-bet-semua-admin', 'uses' => 'Admin\KegiatanController@cetakBetPdfAll']);

    Route::get('/kegiatan/{id}/jadwal/tambah', ['as' => 'jadwal-tambah-admin', 'uses' => 'Petugas\JadwalController@tambah']);
    Route::get('/kegiatan/{id}/jadwal/{id_jadwal}/edit', ['as' => 'jadwal-edit-admin', 'uses' => 'Petugas\JadwalController@edit']);
    Route::get('/kegiatan/{id}/jadwal/{id_jadwal}/delete', ['as' => 'jadwal-delete-admin', 'uses' => 'Petugas\JadwalController@delete']);
    Route::get('/kegiatan/{id}/jadwal/{id_jadwal}/{ket}/cetak-excel', ['as' => 'jadwal-cetak-admin', 'uses' => 'Petugas\JadwalController@cetakLaporanExcel']);
    Route::get('/kegiatan/{id}/jadwal/{id_jadwal}/{ket}/download-pdf', ['as' => 'jadwal-cetak-admin', 'uses' => 'Petugas\JadwalController@cetakLaporanPdf']);
    Route::get('/kegiatan/{id}/jadwal/{ket}/cetak-semua-excel', ['as' => 'cetak-kegiatan-admin', 'uses' => 'Petugas\JadwalController@cetakLaporanExcelAll']);
    Route::get('/kegiatan/{id}/jadwal/{ket}/download-semua-pdf', ['as' => 'cetak-kegiatan-admin', 'uses' => 'Petugas\JadwalController@cetakLaporanPdfAll']);
    Route::get('/kegiatan/{id}/jadwal/{id_jadwal}/absen/{id_absen}/delete', ['as' => 'absen-admin-page', 'uses' => 'Petugas\AbsenController@delete']);
    // END ACTION //

    // PROSES //
    Route::post('/kegiatan/save', ['as' => 'kegiatan-post-admin', 'uses' => 'Petugas\KegiatanController@save']);
    Route::post('/kegiatan/peserta/save', ['as' => 'kegiatan-peserta-post-admin', 'uses' => 'Petugas\KegiatanController@savePeserta']);
    Route::post('/absen/save', ['as' => 'absen-post-admin', 'uses' => 'Petugas\AbsenController@save']);
    Route::post('/jadwal/save', ['as' => 'jadwal-post-admin', 'uses' => 'Petugas\JadwalController@save']);
    Route::post('/profile/save', ['as' => 'profile-save-admin', 'uses' => 'Petugas\DashboardController@save']);
    // END PROSES //
});
// END ROUTE PETUGAS //

Route::group(['prefix' => 'guest', 'middleware' => 'isGuest'], function () {
    // PAGE //
    Route::get('/dashboard', ['as' => 'dashboard-admin-page', 'uses' => 'Guest\DashboardController@index']);
    Route::get('/kegiatan', ['as' => 'kegiatan-admin-page', 'uses' => 'Guest\KegiatanController@index']);
    Route::get('/kegiatan/{id}/peserta', ['as' => 'peserta-admin-page', 'uses' => 'Guest\KegiatanController@peserta']);
    Route::get('/kegiatan/{id}/jadwal', ['as' => 'jadwal-admin-page', 'uses' => 'Guest\JadwalController@index']);
    Route::get('/kegiatan/{id}/jadwal/{id_jadwal}/absen', ['as' => 'absen-admin-page', 'uses' => 'Guest\AbsenController@index']);
    Route::get('/profile', ['as' => 'change-profile-page', 'uses' => 'Guest\DashboardController@profile']);
    Route::get('/bet', function () {
        return view('bet');
    });
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
