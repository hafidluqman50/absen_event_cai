@extends('layout.app')

@section('content')
    <div class="block-header">
        <h2>JADWAL</h2>
    </div>

    <div class="row clearfix">
        <!-- Task Info -->
        <div class="col-xs-12 col-sm-12 col-md-12 col-lg-12">
            <div class="card">
                <div class="header" style="box-shadow: 2px 3px 2px rgba(0, 0, 0, 0.3);">
                    <a href="{{ url('/guest/kegiatan') }}" style="float:left; margin-top:-1.2rem" class="btn btn-default btn-circle waves-effect waves-circle waves-float" title="kembali">
                        <i class="material-icons">keyboard_backspace</i>
                    </a>
                    <h2>DATA JADWAL</h2>
                </div>
                <div class="body">
                    <h5>Nama Kegiatan : {{ $kegiatan->nama_kegiatan }}</h5>
                    <h5>Tanggal Kegiatan : {{ explodeDate($kegiatan->tanggal_kegiatan) }}</h5>
                    <h5>Lokasi Kegiatan : {{ $kegiatan->lokasi_kegiatan }}</h5>
                    <div class="table-responsive">
                        <table class="table table-hover dashboard-task-infos" id="table">
                            <thead>
                                <tr>
                                    <th>No</th>
                                    <th>Jadwal</th>
                                    <th>Keterangan</th>
                                    <th>#</th>
                                </tr>
                            </thead>
                            <tbody>
                                @foreach($jadwal as $key => $data)
                                <tr>
                                    <td>{{ $key+1 }}</td>
                                    <td>{{ $data->nama_jadwal }}</td>
                                    <td>{{ $data->keterangan }}</td>
                                    <td>
                                        <div class="btn-group" role="button">
                                            <a href="{{ url('/guest/kegiatan/'.$data->id_kegiatan.'/jadwal/'.$data->id_jadwal.'/absen') }}" title="Lihat Peserta" class="btn btn-success waves-effect"><b>Lihat Absen</b></a>
                                        </div></td>
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