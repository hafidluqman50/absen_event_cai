<?php

namespace App\Model;

use Illuminate\Database\Eloquent\Model;

class JadwalModel extends Model
{
    protected $table = 'jadwal';
    protected $primaryKey = 'id_jadwal';
    protected $guarded = [];

    public function kegiatan() {
    	return $this->belongsTo('App\Model\KegiatanModel','id_kegiatan');
    }
}
