@extends('layout.app')

@section('content')
    <div class="block-header">
        <h2>ANGGOTA</h2>
    </div>

    <div class="row clearfix">
        <!-- Task Info -->
        <div class="col-xs-12 col-sm-12 col-md-12 col-lg-12">
            <div class="card">
                <div class="header" style="box-shadow: 2px 3px 2px rgba(0, 0, 0, 0.3);">
                    <a href="{{ url('/admin/kelompok') }}" style="float:left; margin-top:-1.2rem" class="btn btn-default btn-circle waves-effect waves-circle waves-float" title="kembali">
                        <i class="material-icons">keyboard_backspace</i>
                    </a>
                    <h2>DATA ANGGOTA</h2>
                    <a href="{{ url('/admin/kelompok/'.$id.'/anggota/tambah') }}" style="float: right; margin-top:-2.8rem" class="btn btn-default btn-circle waves-effect waves-circle waves-float" title="tambah kelompok">
                        <i class="material-icons">playlist_add_check</i>
                    </a>
                </div>
                <div class="body">
                    @if(session()->has('message'))
                    <div class="alert alert-success alert-dismissible">
                        <b>{{ session('message') }}</b> <button class="close" data-dismiss="alert">x</button>
                    </div>
                    @endif
                    <div class="table-responsive">
                        <h5>Nama Kelompok : {{ $kelompok->nama_kelompok }}</h5>
                        <h5>Lokasi Kelompok : {{ $kelompok->lokasi_kelompok }}</h5>
                        <table class="table table-hover dashboard-task-infos" id="table">
                            <thead>
                                <tr>
                                    <th>No</th>
                                    <th>Peserta</th>
                                    <th>Nama</th>
                                    <th>Tempat Lahir</th>
                                    <th>Tanggal Lahir</th>
                                    <th>No Telepon</th>
                                    <th>Email</th>
                                    <th>Jenis Kelamin</th>
                                    <th>Alamat</th>
                                    <th>Desa</th>
                                    <th>Dapukan</th>
                                    <th>Status</th>
                                    <th>#</th>
                                </tr>
                            </thead>
                            <tbody>
                                @foreach($anggota as $key => $data)
                                <tr>
                                    <td>{{ $key+1 }}</td>
                                    <td>{{ $data->ket_peserta }}</td>
                                    <td>{{ $data->nama_anggota }}</td>
                                    <td>{{ $data->tempat_lahir }}</td>
                                    <td>{{ explodeDate($data->tgl_lahir) }}</td>
                                    <td>{{ $data->no_telepon }}</td>
                                    <td>{{ $data->email }}</td>
                                    <td>{{ strtoupper($data->jenis_kelamin) }}</td>
                                    <td>{{ $data->alamat }}</td>
                                    <td>{{ $data->desa }}</td>
                                    <td>{{ $data->dapukan }}</td>
                                    <td>{{ $data->status_peserta }}</td>
                                    <td>
                                        <div class="btn-group" role="group">
                                            <a href="{{ url('/admin/kelompok/'.$id.'/anggota/'.$data->id_anggota.'/edit') }}" title="Edit" class="btn btn-warning waves-effect"><b>Edit</b></a>
                                        </div>
                                        <div class="btn-group" role="button">
                                            <a href="{{ url('/admin/kelompok/'.$id.'/anggota/'.$data->id_anggota.'/delete') }}" title="Hapus" class="btn btn-danger waves-effect" onclick="return confirm('Anda Yakin?')"><b>Hapus</b></a>
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