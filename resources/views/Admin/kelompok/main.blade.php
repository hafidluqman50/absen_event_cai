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
                    <div class="btn-group mg">
                        <a href="{{ url('/admin/import') }}" class="btn btn-success waves-effect waves-float btn-lg" title="tambah kelompok">
                            <b>Import Data</b>    
                        </a>
                    </div>
                    <div class="btn-group mg">
                        <a href="{{ url('/admin/contoh-import') }}" class="btn btn-success waves-effect waves-float btn-lg" title="tambah kelompok">
                            <b>Contoh Format Excel</b>    
                        </a>
                    </div>
                    <div class="table-responsive">
                        <table class="table table-hover dashboard-task-infos kelompok" id="table">
                            <thead>
                                <tr>
                                    <th>No</th>
                                    <th>Nama</th>
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
       var kelompok = $('.kelompok').DataTable({
            processing:true,
            serverSide:true,
            ajax:"{{ url('/ajax/kelompok') }}",
            columns:[
                {data:'id_kelompok',searchable:false,render:function(data,type,row,meta){
                    return meta.row + meta.settings._iDisplayStart+1;
                    console.log(meta.row);
                }},
                {data:'nama_kelompok',name:'nama_kelompok'},
                {data:'lokasi_kelompok',name:'lokasi_kelompok'},
                {data:'action',name:'action',searchable:false,orderable:false}
            ],
            scrollCollapse: true,
            columnDefs: [{
            sortable: true,
            "class": "index",
            targets: 0
            }],
            order: [[ 0, 'desc' ]],
            fixedColumns: true
        });
        kelompok.on( 'order.dt search.dt', function () {
        kelompok.column(0, {search:'applied', order:'applied'}).nodes().each( function (cell, i) {
        cell.innerHTML = i+1;
        });
        }).draw();
    });
</script>
@endsection