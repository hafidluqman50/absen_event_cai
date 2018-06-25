<?php

namespace App\Http\Controllers\Admin;

use Illuminate\Http\Request;
use App\Http\Controllers\Controller;
use App\Model\AnggotaModel as Anggota;
use App\Model\KelompokModel as Kelompok;
use App\Model\KegiatanModel as Kegiatan;
use App\Model\KegiatanDetailModel as KegiatanDetail;
use DB;
use Auth;

class AnggotaController extends Controller
{
    public function index() {
        $title = 'Anggota';
        $page = 'anggota';
        $anggota = Anggota::all();
        return view('Admin.anggota.main',compact('title','page','anggota'));
    }

    public function tambah() {
        $title = 'Form Anggota';
        $page = 'anggota';
        return view('Admin.anggota.form-anggota',compact('title','page'));
    }

    public function edit($id) {
        $title = 'Form Anggota';
        $page = 'anggota';
        $row = Anggota::where('id_anggota',$id)->firstOrFail();
        return view('Admin.anggota.form-anggota',compact('title','page','row'));
    }

    public function delete($id) {
        Anggota::where('id_anggota',$id)->delete();
        return redirect('/admin/anggota')->with('message','Berhasil Hapus Anggota');
    }

    public function save(Request $request) {
        $nama           = strtoupper($request->nama_anggota);
        $jenis_kelamin  = $request->jenis_kelamin;
        $tgl            = strtoupper($request->tgl_lahir);
        $tempat_lahir   = strtoupper($request->tempat_lahir);
        $no_telepon     = $request->no_telepon != '' ? $request->no_telepon : '-';
        $alamat         = strtoupper($request->alamat);
        $desa           = strtoupper($request->desa);
        $email          = $request->email != '' ? $request->email : '-';
        $ket            = strtoupper($request->ket);
        $ukuran         = strtoupper($request->ukuran);
        $dapukan        = strtoupper($request->dapukan);
        $status_peserta = strtoupper($request->status);
        $id_anggota     = $request->id_anggota;
        $array = [
            'nama_anggota'   => $nama,
            'jenis_kelamin'  => $jenis_kelamin,
            'tgl_lahir'      => $tgl,
            'tempat_lahir'   => $tempat_lahir,
            'no_telepon'     => $no_telepon,
            'alamat'         => $alamat,
            'desa'           => $desa,
            'email'          => $email,
            'ket_peserta'    => $ket,
            'ukuran_baju'    => $ukuran,
            'dapukan'        => $dapukan,
            'status_peserta' => $status_peserta,
            'id_users'       => Auth::id()
        ];
        if ($id_anggota == '') {
            Anggota::create($array);
            $message = 'Berhasil Input Anggota';
        }
        else {
            Anggota::where('id_anggota',$id_anggota)->update($array);
            $message = 'Berhasil Update Anggota';
        }
        return redirect('/admin/anggota')->with('message',$message);

    }
}
