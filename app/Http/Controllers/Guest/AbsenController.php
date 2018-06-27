<?php

namespace App\Http\Controllers\Guest;

use Illuminate\Http\Request;
use App\Http\Controllers\Controller;
use App\Model\AbsenModel as Absen;
use App\Model\KegiatanModel as Kegiatan;
use App\Model\KegiatanDetailModel as KegiatanDetail;
use App\Model\JadwalModel as Jadwal;
use DB;
use Auth;

class AbsenController extends Controller
{
    public function index($id,$id_jadwal) {
    	$title = 'Absen';
    	$page = 'kegiatan';
    	$jadwal = Jadwal::with('kegiatan')->where('id_kegiatan',$id)->where('id_jadwal',$id_jadwal)->firstOrFail();
    	return view('Guest.absen.main',compact('title','page','id','jadwal','id_jadwal'));
    }
}
