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
		$barcode->setType(BarcodeGenerator::Code128);
		$barcode->setScale(2);
		$barcode->setThickness(25);
		$barcode->setFontSize(10);
		$code = $barcode->generate();
		return $code;
    }
}
