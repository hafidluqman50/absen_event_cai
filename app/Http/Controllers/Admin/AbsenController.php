<?php

namespace App\Http\Controllers\Admin;

use Illuminate\Http\Request;
use App\Http\Controllers\Controller;
use App\Model\AbsenModel;

class AbsenController extends Controller
{
    public function index($id) {
    	$title = 'Absen';
    	$page = 'absen';
    	$absen = DB::table('absen')
    				->join('peserta','absen.id_peserta','=','peserta.id_peserta')
    				->select('absen.*','peserta.*')
    				->where('id_kegiatan',$id)
    				->get();
    	return view('Admin.absen.main',compact('absen','title','page','id'));
    }

    public function form($id) {
    	$title = 'Form Absen';
    	$page = 'absen';
    	return view('Admin.absen.main',compact('title','page','id'));
    }

    public function save(Request $request) {
    	//
    }
}
