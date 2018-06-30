<?php

namespace App\Http\Controllers\Admin;

use Illuminate\Http\Request;
use App\Http\Controllers\Controller;
use App\Model\JadwalModel as Jadwal;
use App\Model\KegiatanModel as Kegiatan;
use App\Model\AbsenModel as Absen;
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
        $hari        = days(date('Y-m-d'));
        $id_jadwal   = $request->id_jadwal;
        $id_kegiatan = $request->id_kegiatan;
		$array = ['nama_jadwal' => $jadwal,'hari'=>$hari,'id_kegiatan'=>$id_kegiatan,'keterangan' => $keterangan];
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

    public function cetakLaporanExcel($id,$id_jadwal) {
        $kegiatan = DB::table('jadwal')->join('kegiatan','jadwal.id_kegiatan','=','kegiatan.id_kegiatan')->where('id_kegiatan',$id)->where('id_jadwal',$id_jadwal)->firstOrFail();
        Excel::create('Laporan Kegiatan '.$kegiatan->nama_kegiatan.' '.explodeDate($kegiatan->tanggal_kegiatan).' '.$kegiatan->nama_jadwal,function($excel){
            $excel->sheet('Laporan',function($sheet){
                // $sheet->setCellValue('A1','No.');
                // $sheet->setCellValue('B1','');
            });
            $excel->sheet('Daftar Peserta',function($sheet){

            });
        })->download('xlsx');
    }

    public function cetakLaporanExcelAll($id,$ket) {
        $kegiatan = Kegiatan::where('id_kegiatan',$id)->firstOrFail();
        $jadwal   = Jadwal::where('id_kegiatan',$id)->get();
        $absen    = new Absen;
        Excel::create('Laporan Kegiatan '.$kegiatan->nama_kegiatan.'-'.explodeDate($kegiatan->tanggal_kegiatan).'-Semua-'.ucwords($ket),function($excel)use($kegiatan,$jadwal,$absen,$ket){
            $excel->sheet('Laporan',function($sheet)use($kegiatan,$jadwal,$absen,$ket){
                $sheet->setCellValue('A1','Laporan Kegiatan '.$kegiatan->nama_kegiatan.' '.explodeDate($kegiatan->tanggal_kegiatan));
                $sheet->mergeCells('A1:G1');
                $counterJadwal = 3;
                $counterKet = $counterJadwal+2;
                $counterTable = $counterKet+1;
                $counterRows = $counterTable+1;
                $counterJumlah = $counterRows+1;
                foreach ($jadwal as $value) {
                    $sheet->setCellValue('A'.$counterJadwal,$value->nama_jadwal.' Hari '.$value->hari);
                    $sheet->mergeCells('A'.$counterJadwal.':G'.$counterJadwal);
                    $hadir = $absen->absenHadir($value->id_kegiatan,$value->id_jadwal,$ket);
                    // dd($hadir);
                    // $tidak_hadir = $absen->absenTidakHadir($value->id_kegiatan,$value->id_jadwal,$ket);
                    // $sheet->setCellValue('A'.$counterKet,'Hadir');
                    // $sheet->mergeCells('A'.$counterKet.':G'.$counterKet);
                    // $sheet->setCellValue('A'.$counterTable,'No.');
                    // $sheet->setCellValue('B'.$counterTable,'Peserta');
                    // $sheet->setCellValue('C'.$counterTable,'Nama Anggota');
                    // $sheet->setCellValue('D'.$counterTable,'Nama Kelompok');
                    // $sheet->setCellValue('E'.$counterTable,'Jabatan');
                    // $sheet->setCellValue('F'.$counterTable,'Waktu Absen');
                    // $sheet->setCellValue('G'.$counterTable,'Input By');
                    foreach ($hadir as $key => $data) {
                        $sheet->setCellValue('A'.$counterRows,$key+1);
                        $sheet->setCellValue('B'.$counterRows,$data->ket_peserta);
                        $sheet->setCellValue('C'.$counterRows,$data->nama_anggota);
                        $sheet->setCellValue('D'.$counterRows,$data->nama_kelompok);
                        $sheet->setCellValue('E'.$counterRows,ucwords($data->ket));
                        $sheet->setCellValue('F'.$counterRows,$data->waktu_absen);
                        $sheet->setCellValue('G'.$counterRows,$data->name);
                        $counterJadwal = $counterJumlah+1;
                        $counterKet = $counterJadwal+1;
                        $counterTable = $counterKet+1;
                        $counterRows = $counterTable-1;
                        $counterJumlah = $counterRows+1;
                    }

                    // $sheet->setCellValue('A'.$counterJumlah,'Jumlah Hadir');
                    // $sheet->mergeCells('A'.$counterJumlah.':F'.$counterJumlah);
                    // $sheet->setCellValue('G'.$counterJumlah,count($hadir));

                    // $sheet->mergeCells('A'.$counterKet.':G'.$counterKet);
                    // $sheet->setCellValue('A'.$counterTable,'No.');
                    // $sheet->setCellValue('B'.$counterTable,'Peserta');
                    // $sheet->setCellValue('C'.$counterTable,'Nama Anggota');
                    // $sheet->setCellValue('D'.$counterTable,'Nama Kelompok');
                    // $sheet->setCellValue('E'.$counterTable,'Jabatan');
                    // $sheet->setCellValue('F'.$counterTable,'Waktu Absen');
                    // $sheet->setCellValue('G'.$counterTable,'Input By');
                    // $sheet->setCellValue('A'.$counterKet,'Tidak Hadir');

                    // foreach ($tidak_hadir as $num => $val) {
                    //     $sheet->setCellValue('A'.$counterRows,$num+1);
                    //     $sheet->setCellValue('B'.$counterRows,$val->ket_peserta);
                    //     $sheet->setCellValue('C'.$counterRows,$val->nama_anggota);
                    //     $sheet->setCellValue('D'.$counterRows,$val->nama_kelompok);
                    //     $sheet->setCellValue('E'.$counterRows,ucwords($val->ket));
                    //     $sheet->setCellValue('F'.$counterRows,'-');
                    //     $sheet->setCellValue('G'.$counterRows,'-');
                    // }
                    // $counterJadwal = $counterJumlah+3;
                    // $counterKet = $counterJadwal+2;
                    // $counterTable = $counterKet+1;
                    // $counterRows = $counterTable+1;
                    // $counterJumlah = $counterRows+1;
                    // $sheet->setCellValue('A'.$counterJumlah,'Jumlah Tidak Hadir');
                    // $sheet->mergeCells('A'.$counterJumlah.':F'.$counterJumlah);
                    // $sheet->setCellValue('G'.$counterJumlah,count($hadir));
                    // $sheet->setCellValue('B')
                }
                // $sheet->setCellValue('B1','Peserta');
                // $sheet->setCellValue('C1','Nama Anggota');
                // $sheet->setCellValue('D1','Nama Kelompok');
                // $sheet->setCellValue('E1','Jabatan');
                // $sheet->setCellValue('F1','Waktu Hadir');
                // $sheet->setCellValue('G1','Input By');
            });
            $excel->sheet('Daftar Peserta',function($sheet){

            });
        })->download('xlsx');
    }

    public function cetakLaporanPdfAll($id,$ket) {
        $kegiatan = Kegiatan::where('id_kegiatan',$id)->firstOrFail();
        $jadwal   = Jadwal::where('id_kegiatan',$id)->get();
        $absen    = new Absen;
        $pdf = PDF::loadView('laporan-all',compact('kegiatan','jadwal','absen','ket'))->setPaper('letter','landscape');
        return $pdf->download('Laporan Kegiatan '.$kegiatan->nama_kegiatan.'-'.explodeDate($kegiatan->tanggal_kegiatan).'-Semua-'.ucwords($ket).'.pdf');
    }

    public function coba($id,$ket) {
        $kegiatan = Kegiatan::where('id_kegiatan',$id)->firstOrFail();
        $jadwal   = Jadwal::where('id_kegiatan',$id)->get();
        $absen    = new Absen;
        return view('laporan-all',compact('kegiatan','jadwal','absen','ket'));
    }

    public function cobai($id,$id_jadwal,$ket) {
        $kegiatan = Kegiatan::where('id_kegiatan',$id)->firstOrFail();
        $jadwal = Jadwal::where('id_kegiatan',$id)->where('id_jadwal',$id_jadwal)->firstOrFail();
        $absen = new Absen;
        return view('laporan',compact('kegiatan','jadwal','ket','absen'));
    }

    public function cetakLaporanPdf($id,$id_jadwal,$ket) {
        $kegiatan = Kegiatan::where('id_kegiatan',$id)->firstOrFail();
        $jadwal = Jadwal::where('id_kegiatan',$id)->where('id_jadwal',$id_jadwal)->firstOrFail();
        $absen = new Absen;
        $pdf = PDF::loadView('laporan',compact('kegiatan','jadwal','absen','ket'))->setPaper('letter','landscape');
        return $pdf->download('Laporan Kegiatan '.$kegiatan->nama_kegiatan.'-'.explodeDate($kegiatan->tanggal_kegiatan).'-'.$jadwal->nama_jadwal.'-'.ucwords($ket).'.pdf');
        // echo "<h1>Coming Soon Hehe :) </h1>";
    }
}
