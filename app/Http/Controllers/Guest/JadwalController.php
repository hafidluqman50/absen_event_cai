<?php

namespace App\Http\Controllers\Guest;

use Illuminate\Http\Request;
use App\Http\Controllers\Controller;
use App\Model\JadwalModel as Jadwal;
use App\Model\KegiatanModel as Kegiatan;
class JadwalController extends Controller
{
    public function index($id) {
    	$title = 'Jadwal';
    	$page = 'kegiatan';
    	$kegiatan = Kegiatan::where('id_kegiatan',$id)->firstOrFail();
    	$jadwal = Jadwal::where('id_kegiatan',$id)->get();
    	return view('Guest.jadwal.main',compact('title','page','kegiatan','jadwal','id'));
    }
}
