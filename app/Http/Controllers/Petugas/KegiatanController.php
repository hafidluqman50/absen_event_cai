<?php

namespace App\Http\Controllers\Petugas;

use Illuminate\Http\Request;
use App\Http\Controllers\Controller;
use App\Model\KegiatanModel as Kegiatan;
use App\Model\AnggotaModel as Anggota;
use App\Model\KelompokModel as Kelompok;
use App\Model\KegiatanDetailModel as KegiatanDetail;
use CodeItNow\BarcodeBundle\Utils\BarcodeGenerator;
use DB;

class KegiatanController extends Controller
{
    public function index() {
    	$title = 'Kegiatan';
    	$page = 'kegiatan';
    	$kegiatan = Kegiatan::all();
    	return view('Petugas.kegiatan.main',compact('kegiatan','title','page'));
    }

    public function tambah() {
    	$title = 'Form Kegiatan';
    	$page = 'kegiatan';
    	return view('Petugas.kegiatan.form-kegiatan',compact('title','page'));
    }

    public function edit($id) {
    	$title = 'Form Kegiatan';
    	$page = 'kegiatan';
    	$row = Kegiatan::where('id_kegiatan',$id)->firstOrFail();
    	return view('Petugas.kegiatan.form-kegiatan',compact('row','title','page'));
    }

    public function delete($id) {
    	Kegiatan::where('id_kegiatan',$id)->delete();
    	return redirect('/petugas/kegiatan')->with('message','Berhasil Hapus Kegiatan');
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
		return redirect('/petugas/kegiatan')->with('message',$message);
    }

    public function peserta($id) {
    	$title = 'Peserta';
    	$page = 'kegiatan';
    	$kegiatan = Kegiatan::where('id_kegiatan',$id)->firstOrFail();
    	$peserta = DB::table('kegiatan_detail')
    				->join('anggota','kegiatan_detail.id_anggota','=','anggota.id_anggota')
    				->join('kelompok','kegiatan_detail.id_kelompok','=','kelompok.id_kelompok')
    				->join('users','kegiatan_detail.id_users','=','users.id_users')
    				->where('id_kegiatan',$id)
    				->get();
    	return view('Petugas.kegiatan.peserta',compact('title','page','peserta','kegiatan','id'));
    }

    public function tambahPeserta($id) {
    	$title = 'Peserta';
    	$page = 'kegiatan';
    	$peserta = Anggota::all();
    	$kelompok = Kelompok::all();
    	return view('Petugas.kegiatan.form-peserta-kegiatan',compact('title','page','peserta','kelompok','id'));
    }

    public function editPeserta($id,$id_detail) {
    	$title = 'Anggota';
    	$page = 'kegiatan';
    	$kelompok = Kelompok::all();
    	$peserta = Anggota::all();
    	$row = KegiatanDetail::where('id_detail',$id_detail)->firstOrFail();
    	return view('Petugas.kegiatan.form-peserta-kegiatan',compact('title','page','kelompok','id','row','peserta'));
    }

    public function deletePeserta($id,$id_detail) {
    	KegiatanDetail::where('id_kegiatan',$id)->where('id_detail',$id_detail)->delete();
    	return redirect('/petugas/kegiatan'.$id.'/peserta')->with('message','Berhasil Hapus Anggota');
    }

    public function savePeserta(Request $request) {
        $code = 294153315;
        $peserta     = $request->peserta;
        $kelompok    = $request->kelompok;
        $keterangan  = $request->keterangan;
        $id_kegiatan = $request->id_kegiatan;
        $id_detail   = $request->id_detail;
        $number = KegiatanDetail::where('id_kegiatan',$id_kegiatan)->count();
        if ($number <= 9999) {
            $number++;
            $str = str_pad($number,4,'0000',STR_PAD_LEFT);
        }
        $barcode = $request->code != '' ? $request->code : $code.$str;
        $array = [
            'code_barcode' => $barcode,
            'id_anggota' => $peserta,
            'id_kelompok' => $kelompok,
            'id_kegiatan' => $id_kegiatan,
            'id_users' => Auth::id(),
            'ket' => strtolower($keterangan)
        ];
        if ($id_detail == '') {
            KegiatanDetail::create($array);
            $message = 'Berhasil Input Peserta';
        }
        else {
            KegiatanDetail::where('id_detail',$id_detail)->update($array);
            $message = 'Berhasil Update Peserta';
        }
        return redirect('/petugas/kegiatan/'.$id_kegiatan.'/peserta')->with('message',$message);
    }

    public function cetakBet($id,$id_detail) {
        $get = DB::table('kegiatan_detail')
                ->join('anggota','kegiatan_detail.id_anggota','=','anggota.id_anggota')
                ->select('anggota.*','kegiatan_detail.code_barcode')
                ->where('id_kegiatan',$id)
                ->where('id_detail',$id_detail)
                ->first();

        $barcode = new BarcodeGenerator();
        $barcode->setText($get->code_barcode);
        $barcode->setType(BarcodeGenerator::Code128);
        $barcode->setScale(2);
        $barcode->setThickness(25);
        $barcode->setFontSize(10);
        $code = $barcode->generate();
        return view('bet',compact('get','code'));
    }

    public function cetak($id) {
    	echo "<h1>Coming Soon Hehe :) </h1>";
    }
}
