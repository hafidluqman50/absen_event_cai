<?php

namespace App\Http\Controllers\Guest;

use Illuminate\Http\Request;
use App\Http\Controllers\Controller;
use App\Model\AnggotaModel as Anggota;
use App\Model\KelompokModel as Kelompok;
use App\Model\KegiatanModel as Kegiatan;
use App\Model\KegiatanDetailModel as KegiatanDetail;
use DB;
use Auth;

class AnggotaController extends Controller
{
    public function index() {
        $title = 'Anggota';
        $page = 'anggota';
        $anggota = Anggota::all();
        return view('Guest.anggota.main',compact('title','page','anggota'));
    }
}
