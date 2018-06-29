<?php

namespace App\Model;

use Illuminate\Database\Eloquent\Model;
use DB;

class AbsenModel extends Model
{
    protected $table = 'absen';
    protected $primaryKey = 'id_absen';
    protected $guarded = [];

    public function absenHadir($id_kegiatan,$id_jadwal,$ket) {
    	return DB::table('absen')
    				->join('users','absen.id_users','=','users.id_users')
                    ->join('kegiatan_detail','absen.id_detail','=','kegiatan_detail.id_detail')
                    ->join('anggota','kegiatan_detail.id_anggota','=','anggota.id_anggota')
                    ->join('kelompok','anggota.id_kelompok','=','kelompok.id_kelompok')
                    ->where('id_kegiatan',$id_kegiatan)
                    ->where('id_jadwal',$id_jadwal)
                    ->where('ket',$ket)
                    ->get();
    }

    public function absenTidakHadir($id_kegiatan,$id_jadwal,$ket) {
    	return DB::table('kegiatan_detail')
    				->join('anggota','kegiatan_detail.id_anggota','=','anggota.id_anggota')
    				->join('kelompok','anggota.id_kelompok','=','kelompok.id_kelompok')
    				->where('ket',$ket)
    				->whereNotExists(function($query) use($id_kegiatan,$id_jadwal){
    					$query->select('*')
    						  ->from('absen')
    					      ->where('id_kegiatan',$id_kegiatan)
    					      ->where('id_jadwal',$id_jadwal)
    					      ->whereRaw('kegiatan_detail.id_detail = absen.id_detail');
    				})->get();
    }
}
