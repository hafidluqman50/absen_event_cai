<?php

namespace App\Model;

use Illuminate\Database\Eloquent\Model;
// use CodeItNow\BarcodeBundle\Utils\BarcodeGenerator;
use Milon\Barcode\DNS1D;

class KegiatanDetailModel extends Model
{
    protected $table = 'kegiatan_detail';
    protected $primaryKey = 'id_detail';
    protected $guarded = [];

    public function barcode($code) {
  //   	$barcode = new BarcodeGenerator();
		// $barcode->setText($code);
		// $barcode->setType(BarcodeGenerator::Code39);
		// $barcode->setScale(1);
		// $barcode->setThickness(30);
		// $barcode->setFontSize(15);
		// $code = $barcode->generate();
		$barcode = DNS1D::getBarcodePNG($code,'C39+',0.9,40,[0,0,0]); 
		return $barcode;
    }
}
