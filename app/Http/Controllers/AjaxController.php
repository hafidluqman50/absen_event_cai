<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Model\AnggotaModel as Anggota;
use DB;
class AjaxController extends Controller
{
    public function getAnggota(Request $request,$id) {
    	if ($request->ajax()) {
	    	$anggota = Anggota::where('id_kelompok',$id);
	    	if ($anggota->count() == 0) {
		    	$var =  '<option selected="selected" disabled="disabled">=== Pilih Peserta ===</option>';
	    		return response()->json(['message'=>'No Rows','anggota'=>$var],200);
	    	}
	    	else {
		    	$var[] =  '<option selected="selected" disabled="disabled">=== Pilih Peserta ===</option>';
		    	foreach ($anggota->get() as $key => $value) {
		    		$var[] = '<option value="'.$value->id_anggota.'"> Nama : '.$value->nama_anggota.' Tanggal Lahir : '.explodeDate($value->tgl_lahir).'</option>';
		    	}
		    	return response()->json(['message'=>'Success','anggota'=>$var],200);
	    	}
    	}
    	else {
    		dd('Maaf Request Tidak Berbentuk Ajax');
    	}
    }
}
