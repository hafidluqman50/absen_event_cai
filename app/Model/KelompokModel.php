<?php

namespace App\Model;

use Illuminate\Database\Eloquent\Model;
use DB;

class KelompokModel extends Model
{
    protected $table = 'kelompok';
    protected $primaryKey = 'id_kelompok';
    protected $guarded = [];

    public static function getIdKelompok($nama_kelompok) {
    	// return DB::table('kelompok')->where('nama_kelompok',$nama_kelompok)->first()->id_kelompok;
    }
}
