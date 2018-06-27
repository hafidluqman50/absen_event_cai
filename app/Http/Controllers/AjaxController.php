<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Model\AnggotaModel as Anggota;
use App\Model\KelompokModel as Kelompok;
use App\Model\KegiatanModel as Kegiatan;
use App\Model\JadwalModel as Jadwal;
use App\User;
use Yajra\DataTables\Html\Builder;
use Yajra\Datatables\Datatables;
use Auth;
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

    public function dataKelompok() {
        $kelompok = Kelompok::orderBy('id_kelompok','desc');
        $datatables = Datatables::of($kelompok)->addColumn('action',function($action){
            $button = '
                    <div class="btn-group" role="group">
                        <a href="/admin/kelompok/'.$action->id_kelompok.'/anggota" title="Lihat Anggota" class="btn btn-info">
                            <b>Lihat Anggota</b>
                        </a>
                    </div>
                    <div class="btn-group" role="group">
                        <a href="/admin/kelompok/'.$action->id_kelompok.'/edit" title="Edit" class="btn btn-warning waves-effect"><b>Edit</b></a>
                    </div>
                    <div class="btn-group" role="button">
                        <a href="/admin/kelompok/'.$action->id_kelompok.'/delete" title="Hapus"  class="btn btn-danger waves-effect" onclick="return confirm("Anda Yakin?")"><b>Hapus</b></a>
                    </div>';
            return $button;
        });
        // if ($keyword = $request->get('search')['value']) {
        //     $datatables->filterColumn('row', 'whereRaw', '@rownum  + 1 like ?', ["%{$keyword}%"]);
        // }
        return $datatables->make(true);
    }

    public function dataAnggota($id) {
        $anggota = Anggota::where('id_kelompok',$id)->orderBy('id_anggota','desc')->get();
        return Datatables::of($anggota)->addColumn('action',function($action){
            $button = '
                <div class="btn-group" role="group">
                    <a href="/admin/kelompok/'.$action->id_kelompok.'/anggota/'.$action->id_anggota.'/edit" title="Edit" class="btn btn-warning waves-effect"><b>Edit</b></a>
                </div>
                <div class="btn-group" role="button">
                    <a href="/admin/kelompok/'.$action->id_kelompok.'/anggota/'.$action->id_anggota.'/delete" title="Hapus" class="btn btn-danger waves-effect" onclick="return confirm(
                    Anda Yakin?")"><b>Hapus</b></a>
                </div>
                ';
            return $button; 
        })
        ->editColumn('tgl_lahir',function($edit){
            return explodeDate($edit->tgl_lahir);
        })
        ->editColumn('jenis_kelamin',function($edit){
            return strtoupper($edit->jenis_kelamin);
        })->make(true);
    }

    public function dataKegiatan() {
        $kegiatan = Kegiatan::orderBy('tanggal_kegiatan','desc');
        return Datatables::of(Kegiatan::query())->addColumn('action',function($action){
            if (Auth::user()->level==2 || Auth::user()->level==1) {
                $level = Auth::user()->level==2?'admin':(Auth::user()->level==1?'petugas':'');
                $button = '<div class="btn-group" role="group">
                                <a href="/'.$level.'/kegiatan/'.$action->id_kegiatan.'/edit" title="Edit" class="btn btn-warning waves-effect"><b>Edit</b></a>
                            </div>
                            <div class="btn-group" role="button">
                                <a href="/'.$level.'/kegiatan/'.$action->id_kegiatan.'/jadwal" title="Lihat Peserta" class="btn btn-success waves-effect"><b>Jadwal</b></a>
                            </div>
                            <div class="btn-group" role="button">
                                <a href="/'.$level.'/kegiatan/'.$action->id_kegiatan.'/peserta" title="Lihat Peserta" class="btn btn-primary waves-effect"><b>Lihat Peserta</b></a>
                            </div>
                            <div class="btn-group" role="button">
                                <a href="/'.$level.'/kegiatan/'.$action->id_kegiatan.'/delete" title="Hapus" class="btn btn-danger waves-effect" onclick="return confirm("Anda Yakin?")"><b>Hapus</b></a>
                            </div>';
            }
            elseif(Auth::user()->level==0) {
                $button = '<div class="btn-group" role="button">
                                <a href="/guest/kegiatan/'.$action->id_kegiatan.'/jadwal" title="Lihat Peserta" class="btn btn-success waves-effect"><b>Jadwal</b></a>
                            </div>
                            <div class="btn-group" role="button">
                                <a href="/guest/kegiatan/'.$action->id_kegiatan.'/peserta" title="Lihat Peserta" class="btn btn-primary waves-effect"><b>Lihat Peserta</b></a>
                            </div>';
            }
            return $button;
        })
        ->editColumn('tanggal_kegiatan',function($edit){
            return explodeDate($edit->tanggal_kegiatan);
        })->make(true);
    }

    public function dataPeserta($id) {
        $peserta = DB::table('kegiatan_detail')
                    ->join('anggota','kegiatan_detail.id_anggota','=','anggota.id_anggota')
                    ->join('kelompok','anggota.id_kelompok','=','kelompok.id_kelompok')
                    ->join('users','kegiatan_detail.id_users','=','users.id_users')
                    ->select('kegiatan_detail.*','anggota.nama_anggota','anggota.tgl_lahir','anggota.no_telepon','anggota.alamat','kelompok.nama_kelompok','users.name')
                    ->where('id_kegiatan',$id)
                    ->orderBy('id_detail','desc')
                    ->get();
        return Datatables::of($peserta)->addColumn('action',function($action){
            $level = Auth::user()->level==2?'admin':(Auth::user()->level==1?'petugas':'');
            $button = '<div class="btn-group" role="group">
                            <a href="/'.$level.'/kegiatan/'.$action->id_kegiatan.'/peserta/'.$action->id_detail.'/edit" title="Edit" class="btn btn-warning waves-effect"><b>Edit</b></a>
                        </div>
                        <div class="btn-group" role="button">
                            <a href="/'.$level.'/kegiatan/'.$action->id_kegiatan.'/peserta/'.$action->id_detail.'/delete" title="Hapus" class="btn btn-danger waves-effect" onclick="return confirm("Anda Yakin?")"><b>Hapus</b></a>
                        </div>
                        <div class="btn-group" role="button">
                            <a href="/'.$level.'/kegiatan/'.$action->id_kegiatan.'/peserta/'.$action->id_detail.'/cetak-bet" class="btn btn-info waves-effect" target="_blank"><b>Cetak Bet</b></a>
                        </div>';
            return $button;
        })
        ->editColumn('tgl_lahir',function($edit){
            return explodeDate($edit->tgl_lahir);
        })
        ->editColumn('ket',function($edit){
            if ($edit->ket == 'panitia') {
                $ket = '<span class="badge label-danger">'.ucwords($edit->ket).'</span>';
            }
            else {
                $ket = '<span class="badge label-success">'.ucwords($edit->ket).'</span>';   
            }
            return $ket;
        })
        ->rawColumns(['ket','action'])->make(true);
    }

    public function dataJadwal($id) {
        $jadwal = Jadwal::where('id_kegiatan',$id)->get();
        return Datatables::of($jadwal)->addColumn('action',function($action){
            if (Auth::user()->level==2 || Auth::user()->level==1) {
                $level = Auth::user()->level==2?'admin':(Auth::user()->level==1?'petugas':'');
                $button = '<div class="btn-group" role="group">
                                <a href="/'.$level.'/kegiatan/'.$action->id_kegiatan.'/jadwal/'.$action->id_jadwal.'/edit" title="Edit" class="btn btn-warning waves-effect"><b>Edit</b></a>
                            </div>
                            <div class="btn-group" role="button">
                                <a href="/'.$level.'/kegiatan/'.$action->id_kegiatan.'/jadwal/'.$action->id_jadwal.'/absen" title="Lihat Peserta" class="btn btn-success waves-effect"><b>Lihat Absen</b></a>
                            </div>
                            <div class="btn-group" role="button">
                                <a href="/'.$level.'/kegiatan/'.$action->id_kegiatan.'/jadwal/'.$action->id_jadwal.'/delete" title="Hapus" class="btn btn-danger waves-effect" onclick="return confirm("Anda Yakin?")"><b>Hapus</b></a>
                            </div>
                            <div class="btn-group" role="button">
                                <a href="/'.$level.'/kegiatan/'.$action->id_kegiatan.'/jadwal/'.$action->id_jadwal.'/cetak-excel" title="Cetak" class="btn btn-info" target="_blank"><b>
                                    Cetak Laporan
                                </b></a>
                            </div>';
            }
            elseif (Auth::user()->level==0) {
                $button = '<div class="btn-group" role="button">
                                <a href="/guest/kegiatan/'.$action->id_kegiatan.'/jadwal/'.$action->id_jadwal.'/absen" title="Lihat Peserta" class="btn btn-success waves-effect"><b>Lihat Absen</b></a>
                            </div>';
            }
            return $button;
        })->make(true);   
    }

    public function dataAbsen($id,$id_jadwal) {
        $absen = DB::table('absen')
                    ->join('jadwal','absen.id_jadwal','=','jadwal.id_jadwal')
                    ->join('kegiatan_detail','absen.id_detail','=','kegiatan_detail.id_detail')
                    ->join('anggota','kegiatan_detail.id_anggota','=','anggota.id_anggota')
                    ->join('kelompok','anggota.id_kelompok','=','kelompok.id_kelompok')
                    ->join('users','absen.id_users','=','users.id_users')
                    ->select('anggota.nama_anggota','anggota.ket_peserta','kelompok.nama_kelompok','kegiatan_detail.id_kegiatan','kegiatan_detail.code_barcode','kegiatan_detail.ket','users.name','absen.id_absen','absen.waktu_absen','jadwal.id_jadwal')
                    ->where('kegiatan_detail.id_kegiatan',$id)
                    ->where('absen.id_jadwal',$id_jadwal)
                    ->orderBy('waktu_absen','desc')
                    ->get();
        return Datatables::of($absen)->addColumn('action',function($action){
            $level = Auth::user()->level==2?'admin':(Auth::user()->level==1?'petugas':'');
            $button = '<div class="btn-group" role="button">
                            <a href="/'.$level.'/kegiatan/'.$action->id_kegiatan.'/jadwal/'.$action->id_jadwal.'/absen/'.$action->id_absen.'/delete" title="Hapus" class="btn btn-danger waves-effect" onclick="return confirm("Anda Yakin?"")"><b>Hapus</b></a>
                        </div>';
            return $button;
        })
        ->editColumn('ket',function($edit){
            if ($edit->ket == 'panitia') {
                $ket = '<span class="badge label-danger">'.ucwords($edit->ket).'</span>';
            }
            else {
                $ket = '<span class="badge label-success">'.ucwords($edit->ket).'</span>';   
            }
            return $ket;
        })
        ->rawColumns(['ket','action'])->make(true);   
    }

    public function dataUsers() {
        $users = User::where('status_delete',0)->whereIn('level',[1,0])->get();
        return Datatables::of($users)->addColumn('action',function($action){
            $status = [
                0=>['class'=>'btn-succes','text'=>'Aktifkan'],
                1=>['class'=>'btn-primary','text'=>'Nonaktfikan']
            ];
            $button = '<div class="btn-group" role="group">
                            <a href="/admin/users/'.$action->id_users.'/edit" title="Edit" class="btn btn-warning waves-effect">Edit</a>
                        </div>
                        <div class="btn-group" role="button">
                            <a href="/admin/users/'.$action->id_users.'/delete" title="Hapus"  class="btn btn-danger waves-effect" onclick="return confirm("Anda Yakin?")">Hapus</a>
                        </div> 
                        <div class="btn-group" role="group">
                            <a href="/admin/users/'.$action->id_users.'/status-users" title="Status" class="btn '.$status[$action->status_akun]['class'].' waves-effect">'.$status[$action->status_akun]['text'].'</a>
                        </div>';
            return $button;
        })
        ->editColumn('status_akun',function($edit){
            if ($edit->status_akun == '1') {
                $ket = '<span class="badge bg-indigo">Aktif</span>';
            }
            else {
                $ket = '<span class="badge label-danger">Nonaktif</span>';   
            }
            return $ket;
        })
        ->rawColumns(['status_akun','action'])->make(true);
    }
}
