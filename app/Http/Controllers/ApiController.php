<?php

namespace App\Http\Controllers;
date_default_timezone_set('Asia/Singapore');

use Illuminate\Http\Request;
use App\Model\KegiatanModel as Kegiatan;
use DB;

class ApiController extends Controller
{
    public function absen() {
    	$get = Kegiatan::where('status_kegiatan','1');
    	if($get->count() == 1) {
        	$absens = DB::table('absen')
                        ->join('jadwal','absen.id_jadwal','=','jadwal.id_jadwal')
                        ->join('kegiatan_detail','absen.id_detail','=','kegiatan_detail.id_detail')
        				->join('anggota','kegiatan_detail.id_anggota','=','anggota.id_anggota')
        				->join('kelompok','anggota.id_kelompok','=','kelompok.id_kelompok')
        				->join('users','absen.id_users','=','users.id_users')
        				->select('anggota.*','kelompok.nama_kelompok','kegiatan_detail.*','users.name','absen.*','jadwal.*')
        				->where('kegiatan_detail.id_kegiatan',$get->firstOrFail()->id_kegiatan)
        				->orderBy('waktu_absen','DESC')
        				->get();
        	$kegiatan = [
        		'nama_kegiatan' => 'ABSENSI KEGIATAN '.$get->firstOrFail()->nama_kegiatan,
        		'tanggal_kegiatan' => explodeDate($get->firstOrFail()->tanggal_kegiatan)
        	];
        	foreach ($absens as $key => $value) {
        		$num = $key+1;
        		$text = '<tr><td>'.$num.'</td>'
        				.'<td>'.$value->nama_anggota.'</td>'
        				.'<td>'.$value->nama_kelompok.'</td>'
        				.'<td>'.$value->waktu_absen.'</td>'
        				.'<td>'.$value->nama_jadwal.' '.$value->hari.' - '.$value->keterangan.'</td>'
        				.'<td>'.$value->ket_peserta.'</td>'
        				.'<td><span class="badge badge-primary">'.$value->ket.'</span></td></tr>';
        		$absen[] = $text;
        	}
    	}
    	else {
    	    $kegiatan = [
    	            'nama_kegiatan' => 'Tidak Ada Kegiatan',
    	            'tanggal_kegiatan' => ''
    	        ];
    	    $absen = '<tr><td colspan="7" align="center"><b>Tidak Ada Data Absen</b></td></tr>';
    	}
    	return response()->json(['kegiatan'=>$kegiatan,'absen'=>$absen]);
    }
    
    // public function absen() {echo'sip';}
}
