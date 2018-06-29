<?php

namespace App\Http\Controllers\Admin;

use Illuminate\Http\Request;
use App\Http\Controllers\Controller;
use App\Model\JadwalModel as Jadwal;
use App\Model\KegiatanModel as Kegiatan;
use DB;
use PDF;
use Excel;

class JadwalController extends Controller
{
    public function index($id) {
    	$title = 'Jadwal';
    	$page = 'kegiatan';
    	$kegiatan = Kegiatan::where('id_kegiatan',$id)->firstOrFail();
    	return view('Admin.jadwal.main',compact('title','page','kegiatan','id'));
    }

    public function tambah($id) {
    	$title = 'Form Jadwal';
    	$page = 'kegiatan';
    	return view('Admin.jadwal.form-jadwal',compact('title','page','id'));
    }

    public function edit($id,$id_jadwal) {
    	$title = 'Form Jadwal';
    	$page = 'kegiatan';
    	$row = Jadwal::where('id_kegiatan',$id)->where('id_jadwal',$id_jadwal)->firstOrFail();
    	return view('Admin.jadwal.form-jadwal',compact('title','page','row','id'));
    }

    public function delete($id,$id_jadwal) {
    	Jadwal::where('id_kegiatan',$id)->where('id_jadwal',$id_jadwal)->delete();
    	return redirect('/admin/kegiatan/'.$id.'/jadwal')->with('message','Berhasil Delete Jadwal');
    }

    public function save(Request $request) {
        $jadwal      = $request->jadwal;
        $keterangan  = $request->keterangan;
        $id_jadwal   = $request->id_jadwal;
        $id_kegiatan = $request->id_kegiatan;
		$array = ['nama_jadwal' => $jadwal,'id_kegiatan'=>$id_kegiatan,'keterangan' => $keterangan];
		if ($id_jadwal == '') {
			Jadwal::create($array);
			$message = 'Berhasil Input Jadwal';
		}
		else {
			Jadwal::where('id_kegiatan',$id_kegiatan)->where('id_jadwal',$id_jadwal)->update($array);
			$message = 'Berhasil Update Jadwal';
		}
		return redirect('/admin/kegiatan/'.$id_kegiatan.'/jadwal')->with('message',$message);
    }

    public function cetakLaporan($id,$id_jadwal) {
        $kegiatan = DB::table('jadwal')->join('kegiatan','jadwal.id_kegiatan','=','kegiatan.id_kegiatan')->where('id_kegiatan',$id)->where('id_jadwal',$id_jadwal)->firstOrFail();
        Excel::create('Laporan Kegiatan '.$kegiatan->nama_kegiatan.' '.explodeDate($kegiatan->tanggal_kegiatan).' '.$kegiatan->nama_jadwal,function($excel){
            $excel->sheet('Laporan',function($sheet){
                // $sheet->setCellValue('A1','No.');
                // $sheet->setCellValue('B1','');
            });
            $excel->sheet('Daftar Peserta',function($sheet){

            });
        })->download('xlsx');
        $data = '';
        PDF::loadView('laporan',$data)->download('Laporan Kegiatan '.$kegiatan->nama_kegiatan.' '.explodeDate($kegiatan->tanggal_kegiatan).'.pdf');
        // echo "<h1>Coming Soon Hehe :) </h1>";
    }

    public function cetakLaporanAll($id) {
        $kegiatan = Kegiatan::where('id_kegiatan',$id)->firstOrFail();
        Excel::create('Laporan Kegiatan '.$kegiatan->nama_kegiatan.' '.explodeDate($kegiatan->tanggal_kegiatan),function($excel){
            $excel->sheet('Laporan',function($sheet){
                // $sheet->setCellValue('A1','No.');
                // $sheet->setCellValue('B1','');
            });
            $excel->sheet('Daftar Peserta',function($sheet){

            });
        })->download('xlsx');
        $data = '';
        PDF::loadView('laporan',$data)->download('Laporan Kegiatan '.$kegiatan->nama_kegiatan.' '.explodeDate($kegiatan->tanggal_kegiatan).'.pdf');
    	// echo "<h1>Coming Soon Hehe :) </h1>";
    }
}
