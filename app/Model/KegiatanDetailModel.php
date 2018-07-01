<?php

namespace App\Model;

use Illuminate\Database\Eloquent\Model;
use CodeItNow\BarcodeBundle\Utils\BarcodeGenerator;

class KegiatanDetailModel extends Model
{
    protected $table = 'kegiatan_detail';
    protected $primaryKey = 'id_detail';
    protected $guarded = [];

    public function barcode($code) {
    	$barcode = new BarcodeGenerator();
		$barcode->setText($code);
		$barcode->setType(BarcodeGenerator::Code39);
		$barcode->setScale(1);
		$barcode->setThickness(30);
		$barcode->setFontSize(15);
		$code = $barcode->generate();
		return $code;
    }
}
