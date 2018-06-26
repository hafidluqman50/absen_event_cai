<?php
namespace App\Http\Controllers\Guest;

use Illuminate\Http\Request;
use App\Http\Controllers\Controller;
use App\Model\KegiatanModel as Kegiatan;
use App\Model\AnggotaModel as Anggota;
use App\Model\KelompokModel as Kelompok;
use App\Model\KegiatanDetailModel as KegiatanDetail;
use CodeItNow\BarcodeBundle\Utils\BarcodeGenerator;
use DB;
use Auth;

class KegiatanController extends Controller
{
    public function index() {
        $title = 'Kegiatan';
        $page = 'kegiatan';
        $kegiatan = Kegiatan::all();
        return view('Guest.kegiatan.main',compact('kegiatan','title','page'));
    }

    public function peserta($id) {
        $title = 'Peserta';
        $page = 'kegiatan';
        $kegiatan = Kegiatan::where('id_kegiatan',$id)->firstOrFail();
        $peserta = DB::table('kegiatan_detail')
                    ->join('anggota','kegiatan_detail.id_anggota','=','anggota.id_anggota')
                    ->join('kelompok','anggota.id_kelompok','=','kelompok.id_kelompok')
                    ->join('users','kegiatan_detail.id_users','=','users.id_users')
                    ->where('id_kegiatan',$id)
                    ->get();
        return view('Guest.kegiatan.peserta',compact('title','page','peserta','kegiatan','id'));
    }
}
