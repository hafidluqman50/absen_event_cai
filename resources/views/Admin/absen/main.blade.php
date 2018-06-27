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
                    <a href="{{ url('/admin/kegiatan/'.$id.'/jadwal') }}" style="float:left; margin-top:-1.2rem" class="btn btn-default btn-circle waves-effect waves-circle waves-float" title="kembali">
                        <i class="material-icons">keyboard_backspace</i>
                    </a>
                    <h2>DATA ABSEN</h2>
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
                    <form action="{{ url('admin/absen/save') }}" method="POST">
                        @csrf
                        <div class="display-flex row clearfix">
                            <div class="col-md-10 form-group form-float">
                                <div class="form-line">
                                    <input type="number" class="form-control" name="barcode" required="required">
                                    <label class="form-label" for="">Barcode</label>
                                </div>
                            </div>
                            <input type="hidden" name="id_jadwal" value="{{ $id_jadwal }}">
                            <input type="hidden" name="id_kegiatan" value="{{ $id }}">
                            <div class="col-md-2">
                                <button type="submit" class="btn bg-orange waves-effect" name="submit" value="submit">
                                    <i class="material-icons">save</i>
                                    <span>SIMPAN</span>
                                </button>
                            </div>
                        </div>
                    </form>
                    <div class="table-responsive">
                        <h5>Nama Kegiatan : {{ $jadwal->kegiatan->nama_kegiatan }}</h5>
                        <h5>Tanggal Kegiatan : {{ explodeDate($jadwal->kegiatan->tanggal_kegiatan) }}</h5>
                        <h5>Lokasi Kegiatan : {{ $jadwal->kegiatan->lokasi_kegiatan }}</h5>
                        <h5>Jadwal : {{ $jadwal->nama_jadwal }}</h5>
                        <table class="table table-hover dashboard-task-infos" id="table">
                            <thead>
                                <tr>
                                    <th>No</th>
                                    <th>Code Barcode</th>
                                    <th>Nama Anggota</th>
                                    <th>Nama Kelompok</th>
                                    <th>Jabatan</th>
                                    <th>Ket. Peserta</th>
                                    <th>Waktu Tiba</th>
                                    <th>Input By</th>
                                    <th>#</th>
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
                                    <td>{{ $data->ket_peserta }}</td>
                                    <td>{{ $data->waktu_absen }}</td>
                                    <td>{{ $data->name }}</td>
                                    <td>
                                        <div class="btn-group" role="button">
                                            <a href="{{ url('/admin/kegiatan/'.$id.'/jadwal/'.$id_jadwal.'/absen/'.$data->id_absen.'/delete') }}" title="Hapus" class="btn btn-danger waves-effect" onclick="return confirm('Anda Yakin?')"><b>Hapus</b></a>
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