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
// use Milon\Barcode\DNS1D;
// use DNS2D;
use PDF;
use Auth;

class KegiatanController extends Controller
{
    public function index() {
        $title = 'Kegiatan';
        $page = 'kegiatan';
        return view('Petugas.kegiatan.main',compact('title','page'));
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
            'lokasi_kegiatan' => $lokasi_kegiatan,
            'status_kegiatan' => 0
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

    public function statusKegiatan($id) {
        $kegiatan = Kegiatan::where('id_kegiatan',$id);
            if($kegiatan->firstOrFail()->status_kegiatan == 0){
                $status = Kegiatan::where('status_kegiatan',1);
                if($status->count() > 0) {
                    return redirect('/petugas/kegiatan')->with('log','Maaf Kegiatan '.$status->firstOrFail()->nama_kegiatan.' Harus ditutup terlebih dahulu');
                }
                else {
                    $kegiatan->update(['status_kegiatan'=>1]);
                    $message = 'Berhasil Membuka Data';
                }
            }
            else {
                $kegiatan->update(['status_kegiatan'=>0]);
                $message = 'Berhasil Menutup Data';
            }
            return redirect('/petugas/kegiatan')->with('message',$message);
    }
    
    public function peserta($id) {
        $title = 'Peserta';
        $page = 'kegiatan';
        $kegiatan = Kegiatan::where('id_kegiatan',$id)->firstOrFail();
    	return view('Petugas.kegiatan.peserta',compact('title','page','kegiatan','id'));
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
        $row = DB::table('kegiatan_detail')
                 ->join('anggota','kegiatan_detail.id_anggota','=','anggota.id_anggota')
                 ->where('id_kegiatan',$id)
                 ->where('id_detail',$id_detail)
                 ->first();
    	return view('Petugas.kegiatan.form-peserta-kegiatan',compact('title','page','kelompok','id','row','peserta'));
    }

    public function deletePeserta($id,$id_detail) {
    	KegiatanDetail::where('id_kegiatan',$id)->where('id_detail',$id_detail)->delete();
    	return redirect('/petugas/kegiatan/'.$id.'/peserta')->with('message','Berhasil Hapus Anggota');
    }

    public function savePeserta(Request $request) {
    	$code = 294153315;
        $peserta     = $request->peserta;
        $keterangan  = $request->keterangan;
        $id_kegiatan = $request->id_kegiatan;
        $id_detail   = $request->id_detail;
        $kegiatanDetail = new KegiatanDetail;
        $count = $kegiatanDetail->where('id_kegiatan',$id_kegiatan)->where('id_anggota',$peserta)->count();
        if ($count != 0) {
            return redirect('/petugas/kegiatan/'.$id_kegiatan.'/peserta')->with('log','Maaf Data Sudah Ada');
        }
        else {
            $number = $kegiatanDetail->where('id_kegiatan',$id_kegiatan)->count();
            if ($number <= 9999) {
                $number++;
                $str = str_pad($number,4,'0000',STR_PAD_LEFT);
            }
            $barcode = $request->code != '' ? $request->code : $code.$str;
            $array = [
                'code_barcode' => $barcode,
                'id_anggota' => $peserta,
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
    }

    public function cetakBet($id,$id_detail) {
        $get = DB::table('kegiatan_detail')
                ->join('anggota','kegiatan_detail.id_anggota','=','anggota.id_anggota')
                ->join('kelompok','anggota.id_kelompok','=','kelompok.id_kelompok')
                ->join('kegiatan','kegiatan_detail.id_kegiatan','=','kegiatan.id_kegiatan')
                ->select('anggota.*','kegiatan_detail.*','kegiatan.*','kelompok.nama_kelompok')
                ->where('kegiatan_detail.id_kegiatan',$id)
                ->where('id_detail',$id_detail)
                ->first();

        // $barcode = new BarcodeGenerator();
        // $barcode->setText($get->code_barcode);
        // $barcode->setType(BarcodeGenerator::Code39);
        // $barcode->setScale(1);
        // $barcode->setThickness(30);
        // $barcode->setFontSize(15);
        // $code = $barcode->generate();
        $code = KegiatanDetail::barcode($get->code_barcode);
        // dd('<img src="data:image/png;base64,'.$code.'"');
        // $code = DNS1D::getBarcodePNG($get->code_barcode,'C39+',0.9,40,[0,0,0],true);
    	return view('bet',compact('get','code'));
    }

    public function cetakBetAll($id) {
        if (KegiatanDetail::where('id_kegiatan',$id)->count() == 0) {
            return redirect('/petugas/kegiatan/'.$id.'/peserta')->with('log','Maaf Peserta Tidak Ada');
        }
        else {
            $get = DB::table('kegiatan_detail')
                    ->join('anggota','kegiatan_detail.id_anggota','=','anggota.id_anggota')
                ->join('kelompok','anggota.id_kelompok','=','kelompok.id_kelompok')
                    ->join('kegiatan','kegiatan_detail.id_kegiatan','=','kegiatan.id_kegiatan')
                    ->select('anggota.*','kegiatan_detail.*','kegiatan.*','kelompok.nama_kelompok')
                    ->where('kegiatan.id_kegiatan',$id)
                    ->get();
            $barcode = new KegiatanDetail;
            return view('bet-all',compact('get','barcode'));
        }
    }

    public function cetakBetPdf($id,$id_detail) {
        $get = DB::table('kegiatan_detail')
                ->join('anggota','kegiatan_detail.id_anggota','=','anggota.id_anggota')
                ->join('kegiatan','kegiatan_detail.id_kegiatan','=','kegiatan.id_kegiatan')
                ->select('anggota.*','kegiatan_detail.*','kegiatan.*')
                ->where('kegiatan_detail.id_kegiatan',$id)
                ->where('id_detail',$id_detail)
                ->first();
        $barcode = new BarcodeGenerator();
        $barcode->setText($get->code_barcode);
        $barcode->setType(BarcodeGenerator::Code128);
        $barcode->setScale(1);
        $barcode->setThickness(25);
        $barcode->setFontSize(10);
        $code = $barcode->generate();
        PDF::loadView('bet',compact('get','code'))->download('bet-'.str_slug($get->nama_anggota,'-').'.pdf');
    }

    public function cetakBetPdfAll($id) {
        if (KegiatanDetail::where('id_kegiatan',$id)->count() == 0) {
            return redirect('/admin/kegiatan/'.$id.'/peserta')->with('log','Maaf Peserta Tidak Ada');
        }
        else {
            $get = DB::table('kegiatan_detail')
                    ->join('anggota','kegiatan_detail.id_anggota','=','anggota.id_anggota')
                    ->join('kegiatan','kegiatan_detail.id_kegiatan','=','kegiatan.id_kegiatan')
                    ->select('anggota.*','kegiatan_detail.*','kegiatan.*')
                    ->where('kegiatan.id_kegiatan',$id)
                    ->get();
            $kegiatan = Kegiatan::where('id_kegiatan',$id)->firstOrFail();
            $barcode = new KegiatanDetail;
        PDF::loadView('bet-all',compact('get','barcode'))->download('Bet Kegiatan '.$kegiatan->nama_kegiatan.' '.explodeDate($kegiatan->tanggal_kegiatan).'.pdf');
        }
    }
}
