<?php

namespace App\Model;

use Illuminate\Database\Eloquent\Model;
use CodeItNow\BarcodeBundle\Utils\BarcodeGenerator;
// use Milon\Barcode\DNS1D;
use DB;

class KegiatanDetailModel extends Model
{
    protected $table = 'kegiatan_detail';
    protected $primaryKey = 'id_detail';
    protected $guarded = [];

    public static function barcode($code) {
     	$barcode = new BarcodeGenerator();
		$barcode->setText($code);
		$barcode->setType(BarcodeGenerator::Code39);
		$barcode->setScale(1);
		$barcode->setThickness(45);
		$barcode->setFontSize(14);
		$code = $barcode->generate();
// 		$barcode = DNS1D::getBarcodePNG($code,'C39+',0.9,40,[0,0,0]); 
// 		return $barcode;
        return $code;
    }

    public static function code($code) {
        $barcode = new BarcodeGenerator();
        $barcode->setText($code);
        $barcode->setType(BarcodeGenerator::Code39);
        $barcode->setScale(1);
        $barcode->setThickness(40);
        $barcode->setFontSize(10);
        $code = $barcode->generate();
//      $barcode = DNS1D::getBarcodePNG($code,'C39+',0.9,40,[0,0,0]); 
//      return $barcode;
        return $code;   
    }
    
    public static function limitData($id,$offset) {
       $db = DB::table('kegiatan_detail')
                    ->join('anggota','kegiatan_detail.id_anggota','=','anggota.id_anggota')
                    ->join('kegiatan','kegiatan_detail.id_kegiatan','=','kegiatan.id_kegiatan')
                    ->select('anggota.*','kegiatan_detail.*','kegiatan.*')
                    ->where('kegiatan.id_kegiatan',$id)
                    ->offset($offset)
                    ->limit(48)
                    ->get();
        return $db;
    }
    
    public static function show($id) {
       $db = DB::table('kegiatan_detail')
                    ->join('anggota','kegiatan_detail.id_anggota','=','anggota.id_anggota')
                    ->join('kegiatan','kegiatan_detail.id_kegiatan','=','kegiatan.id_kegiatan')
                    ->select('anggota.*','kegiatan_detail.*','kegiatan.*')
                    ->where('kegiatan.id_kegiatan',$id)
                    ->get();
        return $db;
    }
}
