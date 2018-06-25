@extends('layout.app')

@section('content')
    <div class="block-header">
        <h2>KEGIATAN</h2>
    </div>

    <div class="row clearfix">
        <!-- Task Info -->
        <div class="col-xs-12 col-sm-12 col-md-12 col-lg-12">
            <div class="card">
                <div class="header" style="box-shadow: 2px 3px 2px rgba(0, 0, 0, 0.3);">
                    <a href="{{ url('/petugas/kegiatan') }}" style="float:left; margin-top:-1.2rem" class="btn btn-default btn-circle waves-effect waves-circle waves-float" title="kembali">
                        <i class="material-icons">keyboard_backspace</i>
                    </a>
                    <h2>DATA ABSEN</h2>
                    <a href="{{ url('/petugas/kegiatan/'.$id.'/absen/tambah') }}" style="float: right; margin-top:-2.8rem" class="btn btn-default btn-circle waves-effect waves-circle waves-float" title="tambah kelompok">
                        <i class="material-icons">playlist_add_check</i>
                    </a>
                </div>
                <div class="body">
                    @if(session()->has('message'))
                    <div class="alert alert-success alert-dismissible">
                        {{ session('message') }} <button class="close" data-dismiss="alert">x</button>
                    </div>
                    @endif
                    <div class="table-responsive">
                        <h5>Nama Kegiatan : {{ $kegiatan->nama_kegiatan }}</h5>
                        <h5>Tanggal Kegiatan : {{ explodeDate($kegiatan->tanggal_kegiatan) }}</h5>
                        <h5>Lokasi Kegiatan : {{ $kegiatan->lokasi_kegiatan }}</h5>
                        <table class="table table-hover dashboard-task-infos" id="table">
                            <thead>
                                <tr>
                                    <th>No</th>
                                    <th>Code Barcode</th>
                                    <th>Nama Anggota</th>
                                    <th>Nama Kelompok</th>
                                    <th>Ket.</th>
                                    <th>Waktu Tiba</th>
                                    <th>Jadwal</th>
                                    <th>Input By</th>
                                    <th>Aksi</th>
                                </tr>
                            </thead>
                            <tbody>
                                @foreach($absen as $key => $data)
                                <tr>
                                    <td>{{ $key+1 }}</td>
                                    <td>{{ $data->code_barcode }}</td>
                                    <td>{{ $data->nama_anggota }}</td>
                                    <td>{{ $data->nama_kelompok }}</td>
                                    <td>
                                        @if($data->ket == 'panitia')
                                        <span class="badge label-danger">
                                            {{ ucwords($data->ket) }}
                                        </span>
                                        @else
                                        <span class="badge label-success">
                                            {{ ucwords($data->ket) }}
                                        </span>
                                        @endif
                                    </td>
                                    <td>{{ $data->waktu_absen }}</td>
                                    <td>{{ ucwords($data->keterangan) }}</td>
                                    <td>{{ $data->name }}</td>
                                    <td>
                                        <div class="btn-group" role="button">
                                            <a href="{{ url('/petugas/kegiatan/'.$id.'/absen/'.$data->id_absen.'/delete') }}" title="Hapus" class="btn btn-danger waves-effect" onclick="return confirm('Anda Yakin?')"><b>Hapus</b></a>
                                        </div>
                                    </td>
                                </tr>
                                @endforeach
                            </tbody>
                        </table>
                    </div>
                </div>
            </div>
        </div>
        <!-- #END# Task Info -->
    </div>
@endsection

@section('custom_js')
    
@endsection