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
                    <h2>DATA ANGGOTA</h2>
                </div>
                <div class="body">
                    @if(session()->has('message'))
                    <div class="alert alert-success alert-dismissible">
                        {{ session('message') }} <button class="close" data-dismiss="alert">x</button>
                    </div>
                    @endif
                    <div class="table-responsive">
                        <table class="table table-hover dashboard-task-infos" id="table">
                            <thead>
                                <tr>
                                    <th>No</th>
                                    <th>Peserta</th>
                                    <th>Nama</th>
                                    <th>Tempat Lhr</th>
                                    <th>Tgl Lahir</th>
                                    <th>No Telepon</th>
                                    <th>Email</th>
                                    <th>JK</th>
                                    <th>Alamat</th>
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