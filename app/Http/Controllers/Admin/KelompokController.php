<?php

namespace App\Http\Controllers\Admin;

use Illuminate\Http\Request;
use App\Http\Controllers\Controller;
use App\Model\KelompokModel as Kelompok;

class KelompokController extends Controller
{
    public function index() {
    	$title = 'Kelompok';
    	$page = 'kelompok';
    	$kelompok = Kelompok::all();
    	return view('Admin.kelompok.main',compact('kelompok','title','page'));
    }

    public function tambah() {
    	$title = 'Form Kelompok';
    	$page = 'kelompok';
    	return view('Admin.kelompok.form-kelompok',compact('title','page'));
    }

    public function edit($id) {
    	$title = 'Form Kelompok';
    	$page = 'kelompok';
    	$row = Kelompok::where('id_kelompok',$id)->firstOrFail();
    	return view('Admin.kelompok.form-kelompok',compact('row','title','page'));
    }

    public function delete($id) {
    	Kelompok::where('id_kelompok',$id)->delete();
    	return redirect('/admin/kelompok')->with('message','Berhasil Hapus Kelompok');
    }

    public function save(Request $request) {
    	$nama_kelompok = $request->nama_kelompok;
    	$lokasi_kelompok = $request->lokasi_kelompok;
    	$id_kelompok = $request->id_kelompok;
    	$array = [
    		'nama_kelompok' => $nama_kelompok,
    		'lokasi_kelompok' => $lokasi_kelompok
    	];
    	if ($id_kelompok == '') {
    		Kelompok::create($array);
    		$message = 'Berhasil Input Kelompok';
    	}
    	else {
    		Kelompok::where('id_kelompok',$id_kelompok)->update($array);
    		$message = 'Berhasil Update Kelompok';
    	}
    	return redirect('/admin/kelompok')->with('message',$message);
    }
}
