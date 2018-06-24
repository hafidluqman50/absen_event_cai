<?php

namespace App\Http\Controllers\Admin;

use Illuminate\Http\Request;
use App\Http\Controllers\Controller;
use App\Model\KegiatanModel as Kegiatan;

class KegiatanController extends Controller
{
    public function index() {
    	$title = 'Kegiatan';
    	$page = 'kegiatan';
    	$kegiatan = Kegiatan::all();
    	return view('Admin.kegiatan.main',compact('kegiatan','title','page'));
    }

    public function tambah() {
    	$title = 'Form Kegiatan';
    	$page = 'kegiatan';
    	return view('Admin.kegiatan.form-kegiatan',compact('title','page'));
    }

    public function edit($id) {
    	$title = 'Form Kegiatan';
    	$page = 'kegiatan';
    	$row = Kegiatan::where('id_kegiatan',$id)->firstOrFail();
    	return view('Admin.kegiatan.form-kegiatan',compact('row','title','page'));
    }

    public function delete($id) {
    	Kegiatan::where('id_kegiatan',$id)->delete();
    	return redirect('/admin/kegiatan')->with('message','Berhasil Hapus Kegiatan');
    }

    public function save(Request $request) {
    	$nama_kegiatan = $request->nama_kegiatan;
    	$tanggal_kegiatan = $request->tanggal_kegiatan;
    	$lokasi_kegiatan = $request->lokasi_kegiatan;
    	$id_kegiatan = $request->id_kegiatan;
    	$array = [
    		'nama_kegiatan' => $nama_kegiatan,
    		'tanggal_kegiatan' => $tanggal_kegiatan,
    		'lokasi_kegiatan' => $lokasi_kegiatan
    	];
    	if ($id_kegiatan == '') {
    		Kegiatan::create($array);
    		$message = 'Berhasil Input Kegiatan';
    	}
    	else {
    		Kegiatan::where('id_kegiatan',$id_kegiatan)->update($array);
    		$message = 'Berhasil Update Kegiatan';
    	}
		return redirect('/admin/kegiatan')->with('message',$message);
    }

    public function peserta($id) {
    	$title = 'Peserta';
    	$page = 'kegiatan';
    	$kegiatan = Kegiatan::where('id_kegiatan',$id)->firstOrFail();
    	$peserta = DB::table('kegiatan_detail')
    				->join('peserta','kegiatan_detail.id_peserta','=','peserta.id_peserta')
    				->join('kelompok','kegiatan_detail.id_kelompok','=','kelompok.id_kelompok')
    				->where('id_kegiatan',$id)
    				->get();
    	return view('Admin.kegiatan.peserta',compact('title','page','peserta','kegiatan','id'));
    }

    public function tambahPeserta($id) {
    	$title = 'Peserta';
    	$page = 'kegiatan';
    	$peserta = Peserta::all();
    	$kelompok = Kelompok::all();
    	return view('Admin.kegiatan.form-kegiatan-peserta',compact('title','page','peserta','kelompok','id'));
    }

    public function editPeserta($id,$id_peserta) {
    	$title = 'Peserta';
    	$page = 'kegiatan';
    	$kelompok = Kelompok::all();
    	$row = Peserta::where('id_peserta',$id_peserta)->firstOrFail();
    	return view('Admin.kegiatan.form-kegiatan-peserta',compact('title','page','kelompok','id','row'));
    }

    public function deletePeserta($id,$id_peserta) {
    	Peserta::where('id_kegiatan',$id)->where('id_peserta',$id_peserta)->delete();
    	return redirect('/admin/kegiatan'.$id.'/peserta')->with('message','Berhasil Hapus Peserta');
    }

    public function savePeserta(Request $request) {
    	$barcode = '';
    	$peserta = $request->peserta;
    	$kelompok = $request->kelompok;
    }
}
