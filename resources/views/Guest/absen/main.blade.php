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
                    <a href="{{ url('/guest/kegiatan/'.$id.'/jadwal') }}" style="float:left; margin-top:-1.2rem" class="btn btn-default btn-circle waves-effect waves-circle waves-float" title="kembali">
                        <i class="material-icons">keyboard_backspace</i>
                    </a>
                    <h2>DATA ABSEN</h2>
                </div>
                <div class="body">
                    <div class="table-responsive">
                        <h5>Nama Kegiatan : {{ $jadwal->kegiatan->nama_kegiatan }}</h5>
                        <h5>Tanggal Kegiatan : {{ explodeDate($jadwal->kegiatan->tanggal_kegiatan) }}</h5>
                        <h5>Lokasi Kegiatan : {{ $jadwal->kegiatan->lokasi_kegiatan }}</h5>
                        <h5>Jadwal : {{ $jadwal->nama_jadwal }}</h5>
                        <table class="table table-hover dashboard-task-infos absen" id="table">
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
        var absen = $('.absen').DataTable({
            processing:true,
            serverSide:true,
            ajax:"{{ url('/ajax/absen/'.$id.'/'.$id_jadwal) }}",
            columns:[
                {data:'id_absen',searchable:false,render:function(data,type,row,meta){
                    return meta.row + meta.settings._iDisplayStart+1;
                    console.log(data);
                }},
                {data:'code_barcode',name:'code_barcode'},
                {data:'nama_anggota',name:'nama_anggota'},
                {data:'nama_kelompok',name:'nama_kelompok'},
                {data:'ket',name:'ket'},
                {data:'ket_peserta',name:'ket_peserta'},
                {data:'waktu_absen',name:'waktu_absen'},
                {data:'name',name:'name'},
            ],
            scrollCollapse: true,
            columnDefs: [ {
            sortable: true,
            "class": "index",
            targets: 0
            }],
            order: [[ 6, 'desc' ]],
            fixedColumns: true
        });
        absen.on( 'order.dt search.dt', function () {
        absen.column(0, {search:'applied', order:'applied'}).nodes().each( function (cell, i) {
        cell.innerHTML = i+1;
        });
        }).draw();
    });
</script>
@endsection