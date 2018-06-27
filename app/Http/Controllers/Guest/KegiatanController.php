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
        return view('Guest.kegiatan.main',compact('title','page'));
    }

    public function peserta($id) {
        $title = 'Peserta';
        $page = 'kegiatan';
        $kegiatan = Kegiatan::where('id_kegiatan',$id)->firstOrFail();
        return view('Guest.kegiatan.peserta',compact('title','page','kegiatan','id'));
    }
}
