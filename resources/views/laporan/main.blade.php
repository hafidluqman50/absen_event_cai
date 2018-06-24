@extends('layout.app')

@section('custom_css')
    
@endsection

@section('content')
    <div class="block-header">
        <h2>LAPORAN</h2>
    </div>

    <div class="row clearfix">
        <!-- Task Info -->
        <div class="col-xs-12 col-sm-12 col-md-12 col-lg-12">
            <div class="card">
                <div class="header" style="box-shadow: 2px 3px 2px rgba(0, 0, 0, 0.3);">
                    <h2>DATA LAPORAN</h2>
                </div>
                <div class="body">
                    <div class="table-responsive">
                        <table class="table table-hover dashboard-task-infos" id="table">

                            <thead>
                                <tr>
                                    <th>No</th>
                                    <th>Nama Kegiatan</th>
                                    <th>Tanggal Kegiatan</th>
                                    <th>Lokasi</th>
                                    <th>Aksi</th>
                                </tr>
                            </thead>
                            <tbody>
                                <?php $no = 1; ?>
                                <tr>
                                    <th scope="row"><?= $no++; ?></th>
                                    <td>CAI</td>
                                    <td>12 Juli 2018 - 15 Juli 2018</td>
                                    <td>Di Panjaitan</td>
                                    <td>
                                        <div class="btn-group" role="group">
                                            <a href="#" title="Lihat Anggota" style="padding:8px!important" class="btn btn-warning waves-effect"><b>Lihat Laporan</b></a>
                                            <a href="#" title="Lihat Anggota" style="padding:8px!important" class="btn btn-primary waves-effect"><b>Download Laporan</b></a>
                                        </div>
                                    </td>
                                </tr>
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