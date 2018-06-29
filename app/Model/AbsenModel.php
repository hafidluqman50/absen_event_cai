<?php

namespace App\Model;

use Illuminate\Database\Eloquent\Model;
use DB;

class AbsenModel extends Model
{
    protected $table = 'absen';
    protected $primaryKey = 'id_absen';
    protected $guarded = [];

    public function absenHadirAll($id_kegiatan,$id_jadwal) {
    	return DB::table('absen')
    				->join('users','absen.id_users','=','users.id_users')
                    ->join('kegiatan_detail','absen.id_detail','=','kegiatan_detail.id_detail')
                    ->join('anggota','kegiatan_detail.id_anggota','=','anggota.id_anggota')
                    ->join('kelompok','anggota.id_kelompok','=','kelompok.id_kelompok')
                    ->where('id_kegiatan',$id_kegiatan)
                    ->where('id_jadwal',$id_jadwal)
                    ->get();
    }

    public function absenTidakHadirAll($id_kegiatan,$id_jadwal) {
    	return DB::table('absen')
    				->rightJoin('users','absen.id_users','=','users.id_users')
                    ->rightJoin('kegiatan_detail','absen.id_detail','=','kegiatan_detail.id_detail')
                    ->rightJoin('anggota','kegiatan_detail.id_anggota','=','anggota.id_anggota')
                    ->rightJoin('kelompok','anggota.id_kelompok','=','kelompok.id_kelompok')
                    ->where('id_kegiatan',$id_kegiatan)
                    ->where('id_jadwal',$id_jadwal)
                    ->where('waktu_absen',NULL)
                    ->get();
    }
}
