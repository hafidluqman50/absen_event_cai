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
                        <table class="table table-hover dashboard-task-infos kegiatan" id="table">
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
        var kegiatan = $('.kegiatan').DataTable({
            processing:true,
            serverSide:true,
            ajax:"{{ url('/ajax/kegiatan') }}",
            columns:[
                {data:'id_kegiatan',searchable:false,render:function(data,type,row,meta){
                    return meta.row + meta.settings._iDisplayStart+1;
                    console.log(data);
                }},
                {data:'nama_kegiatan',name:'nama_kegiatan'},
                {data:'tanggal_kegiatan',name:'tanggal_kegiatan'},
                {data:'lokasi_kegiatan',name:'lokasi_kegiatan'},
                {data:'action',name:'action',searchable:false,orderable:false}
            ],
            scrollCollapse: true,
            columnDefs: [ {
            sortable: true,
            "class": "index",
            targets: 0
            }],
            order: [[ 2, 'desc' ]],
            fixedColumns: true
        });
        kegiatan.on( 'order.dt search.dt', function () {
        kegiatan.column(0, {search:'applied', order:'applied'}).nodes().each( function (cell, i) {
        cell.innerHTML = i+1;
        });
        }).draw();
    });
</script>
@endsection