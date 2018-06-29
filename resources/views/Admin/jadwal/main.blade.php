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
                    <a href="{{ url('/admin/kegiatan') }}" style="float:left; margin-top:-1.2rem" class="btn btn-default btn-circle waves-effect waves-circle waves-float" title="kembali">
                        <i class="material-icons">keyboard_backspace</i>
                    </a>
                    <h2>DATA JADWAL</h2>
                    <a href="{{ url('/admin/kegiatan/'.$id.'/jadwal/tambah') }}" style="float: right; margin-top:-2.8rem" class="btn btn-default btn-circle waves-effect waves-circle waves-float" title="tambah kelompok">
                        <i class="material-icons">playlist_add_check</i>
                    </a>
                </div>
                <div class="body">
                    @if(session()->has('message'))
                    <div class="alert alert-success alert-dismissible">
                        <b>{{ session('message') }}</b> <button class="close" data-dismiss="alert">x</button>
                    </div>
                    @endif
                    <h5>Nama Kegiatan : {{ $kegiatan->nama_kegiatan }}</h5>
                    <h5>Tanggal Kegiatan : {{ explodeDate($kegiatan->tanggal_kegiatan) }}</h5>
                    <h5>Lokasi Kegiatan : {{ $kegiatan->lokasi_kegiatan }}</h5>
	                <div class="btn-group mg" role="button">
	                    <a href="{{ url('/admin/kegiatan/'.$id.'/jadwal/cetak-semua-excel') }}" title="Cetak" class="btn btn-info waves-effect btn-lg" target="_blank"><b>
	                        Cetak Semua Laporan
	                    </b></a>
	                </div>
                    <div class="btn-group mg" role="button">
                        <a href="{{ url('/admin/kegiatan/'.$id.'/jadwal/download-semua-pdf') }}" title="Download" class="btn btn-danger waves-effect btn-lg" target="_blank"><b>
                            Download Semua Laporan
                        </b></a>
                    </div>
                    <div class="table-responsive">
                        <table class="table table-hover dashboard-task-infos jadwal" id="table">
                            <thead>
                                <tr>
                                    <th>No</th>
                                    <th>Jadwal</th>
                                    <th>Keterangan</th>
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
        var jadwal = $('.jadwal').DataTable({
            processing:true,
            serverSide:true,
            ajax:"{{ url('/ajax/jadwal/'.$id) }}",
            columns:[
                {data:'id_jadwal',searchable:false,render:function(data,type,row,meta){
                    return meta.row + meta.settings._iDisplayStart+1;
                    console.log(data);
                }},
                {data:'nama_jadwal',name:'nama_jadwal'},
                {data:'keterangan',name:'keterangan'},
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
        jadwal.on( 'order.dt search.dt', function () {
        jadwal.column(0, {search:'applied', order:'applied'}).nodes().each( function (cell, i) {
        cell.innerHTML = i+1;
        });
        }).draw();
    });
</script>
@endsection