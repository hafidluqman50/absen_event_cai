<?php

namespace App\Http\Controllers\Admin;

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
    	return view('Admin.absen.main',compact('absen','title','page','id','kegiatan'));
    }

    public function form($id) {
    	$title = 'Form Absen';
    	$page = 'kegiatan';
    	return view('Admin.absen.form-absen',compact('title','page','id'));
    }

    public function delete($id,$id_absen) {
    	Absen::where('id_absen',$id_absen)->delete();
    	return redirect('/admin/kegiatan/'.$id.'/absen')->with('message','Berhasil Hapus Absen');
    }

    public function save(Request $request) {
    	$barcode = $request->barcode;
    	$keterangan = $request->keterangan;
    	$id_kegiatan = $request->id_kegiatan;
    	$get = KegiatanDetail::where('code_barcode',$barcode)->firstOrFail();
    	$array = [
    		'id_detail' => $get->id_detail,
    		'waktu_absen' => date('Y-m-d H:i:s'),
    		'keterangan' => strtolower($keterangan),
    		'id_users' => Auth::id()
    	];
    	Absen::create($array);
    	return redirect('/admin/kegiatan/'.$id_kegiatan.'/absen')->with('message','Berhasil Input Absen');
    }
}
