@extends('layout.app')

@section('content')
    <div class="block-header">
        <h2>KELOMPOK</h2>
    </div>

    <div class="row clearfix">
        <!-- Task Info -->
        <div class="col-xs-12 col-sm-12 col-md-12 col-lg-12">
            <div class="card">
                <div class="header" style="box-shadow: 2px 3px 2px rgba(0, 0, 0, 0.3);">
                    <h2>DATA KELOMPOK</h2>
                    <a href="{{ url('/admin/kelompok/tambah') }}" style="float: right; margin-top:-2.8rem" class="btn btn-default btn-circle waves-effect waves-circle waves-float" title="tambah kelompok">
                        <i class="material-icons">group</i>
                    </a>
                </div>
                <div class="body">
                    @if(session()->has('message'))
                    <div class="alert alert-success alert-dismissible">
                        <b>{{ session('message') }}</b> <button class="close" data-dismiss="alert">x</button>
                    </div>
                    @elseif(session()->has('log'))
                    <div class="alert alert-danger alert-dismissible">
                        <b>{{ session('log') }}</b> <button class="close" data-dismiss="alert">x</button>
                    </div>
                    @endif
                    <div class="table-responsive">
                        <table class="table table-hover dashboard-task-infos" id="table">
                            <thead>
                                <tr>
                                    <th>No</th>
                                    <th>Nama</th>
                                    <th>Lokasi</th>
                                    <th>#</th>
                                </tr>
                            </thead>
                            <tbody>
                                @foreach($kelompok as $key => $data)
                                <tr>
                                    <td>{{ $key+1 }}</td>
                                    <td>{{ $data->nama_kelompok }}</td>
                                    <td>{{ $data->lokasi_kelompok }}</td>
                                    <td>
                                        <div class="btn-group" role="group">
                                            <a href="{{ url('/admin/kelompok/'.$data->id_kelompok.'/anggota') }}" title="Lihat Anggota" class="btn btn-info">
                                                <b>Lihat Anggota</b>
                                            </a>
                                        </div>
                                        <div class="btn-group" role="group">
                                            <a href="{{ url('/admin/kelompok/'.$data->id_kelompok.'/edit') }}" title="Edit" class="btn btn-warning waves-effect"><b>Edit</b></a>
                                        </div>
                                        <div class="btn-group" role="button">
                                            <a href="{{ url('/admin/kelompok/'.$data->id_kelompok.'/delete') }}" title="Hapus"  class="btn btn-danger waves-effect" onclick="return confirm('Anda Yakin?')"><b>Hapus</b></a>
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