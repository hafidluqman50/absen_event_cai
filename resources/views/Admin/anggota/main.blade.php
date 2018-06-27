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
                        <table class="table table-hover dashboard-task-infos anggota" id="table">
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
        var anggota = $('.anggota').DataTable({
            processing:true,
            serverSide:true,
            ajax:"{{ url('/ajax/anggota/'.$id) }}",
            columns:[
                {data:'id_anggota',searchable:false,render:function(data,type,row,meta){
                    return meta.row + meta.settings._iDisplayStart+1;
                    console.log(data);
                }},
                {data:'ket_peserta',name:'ket_peserta'},
                {data:'nama_anggota',name:'nama_anggota'},
                {data:'tempat_lahir',name:'tempat_lahir'},
                {data:'tgl_lahir',name:'tanggal_lahir'},
                {data:'no_telepon',name:'no_telepon'},
                {data:'email',name:'email'},
                {data:'jenis_kelamin',name:'jenis_kelamin'},
                {data:'alamat',name:'alamat'},
                {data:'desa',name:'desa'},
                {data:'dapukan',name:'dapukan'},
                {data:'status_peserta',name:'status_peserta'},
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
        anggota.on( 'order.dt search.dt', function () {
        anggota.column(0, {search:'applied', order:'applied'}).nodes().each( function (cell, i) {
        cell.innerHTML = i+1;
        });
        }).draw();
    });
</script>
@endsection