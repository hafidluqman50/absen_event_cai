<?php

namespace App\Http\Controllers\Guest;

use Illuminate\Http\Request;
use App\Http\Controllers\Controller;
use App\Model\AbsenModel as Absen;
use App\Model\KegiatanModel as Kegiatan;
use App\Model\KegiatanDetailModel as KegiatanDetail;
use DB;
use Auth;

class AbsenController extends Controller
{
    public function index($id) {
    	$title = 'Absen';
    	$page = 'kegiatan';
    	$kegiatan = Kegiatan::where('id_kegiatan',$id)->firstOrFail();
    	$absen = DB::table('absen')
    				->join('kegiatan_detail','absen.id_detail','=','kegiatan_detail.id_detail')
    				->join('anggota','kegiatan_detail.id_anggota','=','anggota.id_anggota')
    				->join('kelompok','kegiatan_detail.id_kelompok','=','kelompok.id_kelompok')
    				->join('users','absen.id_users','=','users.id_users')
    				->select('kegiatan_detail.ket','anggota.*','kelompok.nama_kelompok','kegiatan_detail.code_barcode','users.name','absen.*')
    				->where('id_kegiatan',$id)
    				->get();
    	return view('Guest.absen.main',compact('absen','title','page','id','kegiatan'));
    }
}
