<?php

namespace App\Http\Controllers\Petugas;

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
    	return view('Petugas.absen.main',compact('absen','title','page','id','jadwal','id_jadwal'));
    }

    public function form($id,$id_jadwal) {
    	$title = 'Form Absen';
    	$page = 'kegiatan';
    	return view('Petugas.absen.form-absen',compact('title','page','id','id_jadwal'));
    }

    public function delete($id,$id_jadwal,$id_absen) {
    	Absen::where('id_jadwal',$id_jadwal)->where('id_absen',$id_absen)->delete();
    	return redirect('/petugas/kegiatan/'.$id.'/jadwal/'.$id_jadwal.'/absen')->with('message','Berhasil Hapus Absen');
    }

    public function save(Request $request) {
        $barcode     = $request->barcode;
        $id_kegiatan = $request->id_kegiatan;
        $id_jadwal   = $request->id_jadwal;
        $kegiatanDetail = KegiatanDetail::where('id_kegiatan',$id_kegiatan)->where('code_barcode',$barcode);
        if ($kegiatanDetail->count() == 0) {
            return redirect('/petugas/kegiatan/'.$id_kegiatan.'/jadwal/'.$id_jadwal.'/absen')->with('log','Maaf Peserta Belum Terdaftar Pada Kegiatan');
        }
        else {
            $get = $kegiatanDetail->firstOrFail();
            $count = Absen::where('id_detail',$get->id_detail)->where('id_jadwal',$id_jadwal)->count();
            if ($count != 0) {
                return redirect('/petugas/kegiatan/'.$id_kegiatan.'/jadwal/'.$id_jadwal.'/absen')->with('log','Maaf Peserta Sudah Ter input');
            }
            else {
                $array = [
                    'id_detail'   => $get->id_detail,
                    'waktu_absen' => date('Y-m-d H:i:s'),
                    'id_jadwal'   => $id_jadwal,
                    'id_users'    => Auth::id()
                ];
                Absen::create($array);
                return redirect('/petugas/kegiatan/'.$id_kegiatan.'/jadwal/'.$id_jadwal.'/absen')->with('message','Berhasil Input Absen');
            }
        }
    }
}
