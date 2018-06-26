<?php

namespace App\Http\Controllers\Admin;

use Illuminate\Http\Request;
use App\Http\Controllers\Controller;
use App\Model\KelompokModel as Kelompok;
use App\Model\AnggotaModel as Anggota;
use Excel;

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
		$nama_kelompok   = strtoupper($request->nama_kelompok);
		$lokasi_kelompok = strtoupper($request->lokasi_kelompok);
		$id_kelompok     = $request->id_kelompok;
        $get             = Kelompok::where('nama_kelompok',$nama_kelompok)->count();
        if ($get != 0) {
            return redirect('/admin/kelompok')->with('log','Maaf Kelompok Sudah Ada');
        }
        else {
            $array = [
                'nama_kelompok'   => $nama_kelompok,
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

    public function importForm() {
        $title = 'Import';
        $page = 'kelompok';
        return view('Admin.kelompok.import',compact('title','page'));
    }

    public function importExcel(Request $request) {
        $file = $request->excel;
        $fileName = uniqid().'_'.$file->getClientOriginalName();
        $file->move(storage_path('file/'),$fileName);
        if (!empty($file)) {
            Excel::selectSheetsByIndex(0,1)->filter('chunk')->load(storage_path('/file/'.$fileName))->chunk(1000000,function($xlsx){
            foreach ($xlsx[0] as $key => $value) {
                $var[] = [
                    'nama_kelompok'   => strtoupper($value->nama_kelompok),
                    'lokasi_kelompok' => strtoupper($value->lokasi_kelompok),
                    'created_at'      => date('Y-m-d H:i:s'),
                    'updated_at'      => date('Y-m-d H:i:s')
                ];
            }
            Kelompok::insert($var);
            foreach ($xlsx[1] as $num => $val) {
                $unix_date = ($val->tanggal_lahir - 25569) * 86400;
                $date = gmdate('Y-m-d',$unix_date);
                $id_kelompok = Kelompok::where('nama_kelompok',$val->kelompok)->firstOrFail()->id_kelompok;
                $var2[] = [
                    'nama_anggota'   => strtoupper($val->nama_lengkap_peserta),
                    'id_kelompok'    => $id_kelompok,
                    'tgl_lahir'      => $date,
                    'tempat_lahir'   => strtoupper($val->tempat_lahir),
                    'desa'           => strtoupper($val->desa),
                    'jenis_kelamin'  => strtoupper($val->jenis_kelamin),
                    'no_telepon'     => $val->nomor_telepon,
                    'email'          => $val->email_peserta,
                    'alamat'         => strtoupper($val->alamat),
                    'ket_peserta'    => strtoupper($val->peserta),
                    'ukuran_baju'    => strtoupper($val->ukuran_baju),
                    'dapukan'        => strtoupper($val->dapukan_muda_mudi),
                    'status_peserta' => strtoupper($val->status),
                    'created_at'     => date('Y-m-d H:i:s'),
                    'updated_at'     => date('Y-m-d H:i:s'),
                ];
            }
            // dd($var2);
            Anggota::insert($var2);
            });
        }
        return redirect('/admin/kelompok')->with('message','Berhasil Import');
    }
}
