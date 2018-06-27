@extends('layout.app')

@section('content')
    <div class="block-header">
        <h2>PESERTA</h2>
    </div>

    <div class="row clearfix">
        <div class="col-xs-12 col-sm-12 col-md-12 col-lg-12">
            <div class="card">
                <div class="header" style="box-shadow: 2px 3px 2px rgba(0, 0, 0, 0.3);">
                    <a href="{{ url('/admin/kegiatan') }}" style="float:left; margin-top:-1.2rem" class="btn btn-default btn-circle waves-effect waves-circle waves-float" title="kembali">
                        <i class="material-icons">keyboard_backspace</i>
                    </a>
                    <h2>DATA PESERTA</h2>
                    <a href="{{ url('/admin/kegiatan/'.$id.'/peserta/tambah') }}" style="float: right; margin-top:-2.8rem" class="btn btn-default btn-circle waves-effect waves-circle waves-float" title="tambah kelompok">
                        <i class="material-icons">playlist_add_check</i>
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
                        <h5>Nama Kegiatan : {{ $kegiatan->nama_kegiatan }}</h5>
                        <h5>Tanggal Kegiatan : {{ explodeDate($kegiatan->tanggal_kegiatan) }}</h5>
                        <h5>Lokasi Kegiatan : {{ $kegiatan->lokasi_kegiatan }}</h5>
                        <div class="btn-group mg">
                            <a href="{{ url('/admin/kegiatan/'.$id.'/peserta/cetak-semua-bet') }}" class="btn btn-primary btn-lg waves-effect" target="_blank">
                                <b>Cetak Semua Bet</b>
                            </a>
                        </div>
                        <table class="table table-hover dashboard-task-infos peserta" id="table">
                            <thead>
                                <tr>
                                    <th>No</th>
                                    <th>Code Barcode</th>
                                    <th>Nama Anggota</th>
                                    <th>Nama Kelompok</th>
                                    <th>Tgl Lahir</th>
                                    <th>No Telepon</th>
                                    <th>Alamat</th>
                                    <th>Ket.</th>
                                    <th>Input By</th>
                                    <th>#</th>
                                </tr>
                            </thead>
                            <tbody>
                                
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
<script>
    $(function(){
        var peserta = $('.peserta').DataTable({
            processing:true,
            serverSide:true,
            ajax:"{{ url('/ajax/peserta/'.$id) }}",
            columns:[
                {data:'id_anggota',searchable:false,render:function(data,type,row,meta){
                    return meta.row + meta.settings._iDisplayStart+1;
                    console.log(data);
                }},
                {data:'code_barcode',name:'code_barcode'},
                {data:'nama_anggota',name:'nama_anggota'},
                {data:'nama_kelompok',name:'nama_kelompok'},
                {data:'tgl_lahir',name:'tgl_lahir'},
                {data:'no_telepon',name:'no_telepon'},
                {data:'alamat',name:'alamat'},
                {data:'ket',name:'ket'},
                {data:'name',name:'name'},
                {data:'action',name:'action',searchable:false,orderable:false}
            ],
            scrollCollapse: true,
            columnDefs: [ {
            sortable: true,
            "class": "index",
            targets: 0
            }],
            order: [[ 0, 'desc' ]],
            fixedColumns: true
        });
        peserta.on( 'order.dt search.dt', function () {
        peserta.column(0, {search:'applied', order:'applied'}).nodes().each( function (cell, i) {
        cell.innerHTML = i+1;
        });
        }).draw();
    });
</script>
@endsection