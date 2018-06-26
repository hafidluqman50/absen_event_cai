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
    	$absen = DB::table('absen')
                    ->join('jadwal','absen.id_jadwal','=','jadwal.id_jadwal')
                    ->join('kegiatan_detail','absen.id_detail','=','kegiatan_detail.id_detail')
    				->join('anggota','kegiatan_detail.id_anggota','=','anggota.id_anggota')
    				->join('kelompok','anggota.id_kelompok','=','kelompok.id_kelompok')
    				->join('users','absen.id_users','=','users.id_users')
    				->select('anggota.*','kelompok.nama_kelompok','kegiatan_detail.*','users.name','absen.*','jadwal.*')
    				->where('kegiatan_detail.id_kegiatan',$id)
                    ->where('absen.id_jadwal',$id_jadwal)
    				->get();
    	return view('Guest.absen.main',compact('absen','title','page','id','jadwal','id_jadwal'));
    }
}
