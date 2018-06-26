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
                    <h2>DATA KEGIATAN</h2>
                </div>
                <div class="body">
                    <div class="table-responsive">
                        <table class="table table-hover dashboard-task-infos" id="table">
                            <thead>
                                <tr>
                                    <th>No</th>
                                    <th>Nama Kegiatan</th>
                                    <th>Tanggal</th>
                                    <th>Lokasi</th>
                                    <th>#</th>
                                </tr>
                            </thead>
                            <tbody>
                                @foreach($kegiatan as $key => $data)
                                <tr>
                                    <td>{{ $key+1 }}</td>
                                    <td>{{ $data->nama_kegiatan }}</td>
                                    <td>{{ explodeDate($data->tanggal_kegiatan) }}</td>
                                    <td>{{ $data->lokasi_kegiatan }}</td>
                                    <td>
                                        <div class="btn-group" role="button">
                                            <a href="{{ url('/guest/kegiatan/'.$data->id_kegiatan.'/jadwal') }}" title="Lihat Peserta" class="btn btn-success waves-effect"><b>Jadwal</b></a>
                                        </div>
                                        <div class="btn-group" role="button">
                                            <a href="{{ url('/guest/kegiatan/'.$data->id_kegiatan.'/peserta') }}" title="Lihat Peserta" class="btn btn-primary waves-effect"><b>Lihat Peserta</b></a>
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