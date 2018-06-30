<?php 
function explodeDate($date) {
	if ($date == null || $date == '-') {
		return '0000-00-00';
	}
	else {
		$get = explode('-',$date);
		$tanggal = $get[2];
		$bulan = $get[1];
		$tahun = $get[0];

		switch ($bulan) {
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

		return $tanggal.' '.$bulanan.' '.$tahun;
	}
}

function year($date) {
	$explode = explode('-',$date);
	return $explode[0];
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