<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Model\AnggotaModel as Anggota;
use App\Model\KelompokModel as Kelompok;
use Yajra\DataTables\Html\Builder;
use Yajra\Datatables\Datatables;
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

    public function dataKelompok(Request $request) {
        // DB::statement(DB::raw('set @rownum=0'));
        $kelompok = Kelompok::select([
            // DB::raw('@rownum := @rownum + 1 AS row'),
            'id_kelompok',
            'nama_kelompok',
            'lokasi_kelompok']);
        $datatables = Datatables::of($kelompok)->addColumn('action',function($action){
            return '
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
        });
        if ($keyword = $request->get('search')['value']) {
            $datatables->filterColumn('row', 'whereRaw', '@rownum  + 1 like ?', ["%{$keyword}%"]);
        }
        return $datatables->make(true);
    }
}
