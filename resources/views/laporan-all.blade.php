<!DOCTYPE html>
<html lang="en">
<head>
	<meta charset="UTF-8">
	<title>Laporan Kegiatan {{ $kegiatan->nama_kegiatan.' '.explodeDate($kegiatan->tanggal_kegiatan) }}</title>
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
</head>
<body>
	<h2 align="center"><b>Laporan Kegiatan {{ $kegiatan->nama_kegiatan }} Tanggal {{ explodeDate($kegiatan->tanggal_kegiatan) }}</b></h2>
	@foreach($jadwal as $value)
		<h4 align="center"><b>{{ $value->nama_jadwal }} Hari {{ $value->hari }}</b></h4>
		<table class="table table-bordered">
			<thead>
				<tr align="center">
					<th colspan="7" scope="col"><b>Hadir</b></th>
				</tr>
				<tr align="center">
					<th scope="col"><b>No.</b></th>
					<th scope="col"><b>Keterangan</b></th>
					<th scope="col"><b>Nama Lengkap</b></th>
					<th scope="col"><b>Nama Kelompok</b></th>
					<th scope="col"><b>Jabatan</b></th>
					<th scope="col"><b>Waktu Hadir</b></th>
					<th scope="col"><b>Input By</b></th>
				</tr>
			</thead>
			<tbody>
				@forelse($absen->absenHadirAll($value->id_kegiatan,$value->id_jadwal) as $key => $data)
				<tr align="center">
					<th scope="row">{{ $key+1 }}</th>
					<td>{{ $data->ket_peserta }}</td>
					<td>{{ $data->nama_anggota }}</td>
					<td>{{ $data->nama_kelompok }}</td>
					<td>@if($data->ket=='panitia')
						<span class="badge badge-danger">{{ ucwords($data->ket) }}</span>
						@else
						<span class="badge badge-primary">{{ ucwords($data->ket) }}</span>
						@endif
					</td>
					<td>{{ $data->waktu_absen }}</td>
					<td>{{ $data->name }}</td>
				</tr>
				@empty
				<tr align="center">
					<td colspan="7"><b>Data Tidak Ada</b></td>
				</tr>
				@endforelse
				<tr>
					<td colspan="6"><b>Jumlah Hadir</b></td>
					<td>{{ count($absen->absenHadirAll($value->id_kegiatan,$value->id_jadwal)) }}</td>
				</tr>
			</tbody>
		</table>
		{{-- <hr color="black"> --}}
		<br>
		<table class="table table-bordered">
			<thead>
				<tr align="center">
					<th colspan="7" scope="col">Tidak Hadir</th>
				</tr>
				<tr align="center">
					<th scope="col"><b>No.</b></th>
					<th scope="col"><b>Keterangan</b></th>
					<th scope="col"><b>Nama Lengkap</b></th>
					<th scope="col"><b>Nama Kelompok</b></th>
					<th scope="col"><b>Jabatan</b></th>
					<th scope="col"><b>Waktu Hadir</b></th>
					<th scope="col"><b>Input By</b></th>
				</tr>
			</thead>
			<tbody>
				@forelse($absen->absenTidakHadirAll($value->id_kegiatan,$value->id_jadwal) as $key => $val)
				<tr align="center">
					<th scope="row">{{ $key+1 }}</th>
					<td>{{ $val->ket_peserta }}</td>
					<td>{{ $val->nama_anggota }}</td>
					<td>{{ $val->nama_kelompok }}</td>
					<td>@if($val->ket=='panitia')
						<span class="badge badge-danger">{{ ucwords($val->ket) }}</span>
						@else
						<span class="badge badge-primary">{{ ucwords($val->ket) }}</span>
						@endif
					</td>
					<td>-</td>
					<td>-</td>
				</tr>
				@empty
				<tr align="center">
					<td colspan="7"><b>Data Tidak Ada</b></td>
				</tr>
				@endforelse
				<tr>
					<td colspan="6"><b>Jumlah Tidak Hadir</b></td>
					<td>{{ count($absen->absenTidakHadirAll($value->id_kegiatan,$value->id_jadwal)) }}</td>
				</tr>
			</tbody>
		</table>
		<br>
	@endforeach
</body>
</html>