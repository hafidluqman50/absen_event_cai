<?php 
function explodeDate($date) {
	if ($date == null || $date == '-') {
		return '0000-00-00';
	}
	else {
		$get = explode('-',$date);
		$tanggal = $get[2];
		$bulan = month($get[1]);
		$tahun = $get[0];
		return $tanggal.' '.$bulan.' '.$tahun;
	}
}

function year($date) {
	$explode = explode('-',$date);
	return $explode[0];
}

function month($month) {
    switch ($month) {
		case '1':
			$bulanan = 'Januari';
			break;

		case '2':
			$bulanan = 'Februari';
			break;

		case '3':
			$bulanan = 'Maret';
			break;

		case '4':
			$bulanan = 'April';
			break;

		case '5':
			$bulanan = 'Mei';
			break;

		case '6':
			$bulanan = 'Juni';
			break;

		case '7':
			$bulanan = 'Juli';
			break;

		case '8':
			$bulanan = 'Agustus';
			break;

		case '9':
			$bulanan = 'September';
			break;

		case '10':
			$bulanan = 'Oktober';
			break;

		case '11':
			$bulanan = 'November';
			break;

		case '12':
			$bulanan = 'Desember';
			break;
		
		default:
			$bulanan = 'Hayo';
			break;
	}
	return $bulanan;
}

function days($date) {
	$get = date('D',strtotime($date));
	$array = [
		'Sun' => 'Minggu',
		'Mon' => 'Senin',
		'Tue' => 'Selasa',
		'Wed' => 'Rabu',
		'Thu' => 'Kamis',
		'Fri' => "Jumat",
		'Sat' => 'Sabtu'
	];

	return $array[$get].', '.explodeDate($date);
}

function from_to_date($date1,$date2) {
    $explode1 = explode('-',$date1);
    $explode2 = explode('-',$date2);
    if($explode1[1] == $explode2[1] && $explode1[0] == $explode2[0]) {
        $tanggal = $explode1[2].'-'.$explode2[2].' '.month($explode1[1]).' '.$explode1[0];
    }
    elseif($explode1[0] == $explode2[0]) {
        $tanggal = $explode1[2].' '.month($explode1[1]).' - '.$explode2[2].' '.month($explode2[1]).' '.$explode1[0];
    }
    else {
        $tanggal = $explode1[2].' '.month($explode1[1]).' '.$explode1[0].' - '.$explode2[2].' '.month($explode2[1]).' '.$explode2[0];
    }
    return $tanggal;
    
}