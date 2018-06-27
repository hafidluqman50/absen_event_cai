@extends('layout.app')

@section('content')
    <div class="block-header">
        <h2>USER</h2>
    </div>

    <div class="row clearfix">
        <!-- Task Info -->
        <div class="col-xs-12 col-sm-12 col-md-12 col-lg-12">
            <div class="card">
                <div class="header" style="box-shadow: 2px 3px 2px rgba(0, 0, 0, 0.3);">
                    <h2>DATA USER</h2>
                    <a href="{{ url('/admin/users/tambah') }}" style="float: right; margin-top:-2.8rem" class="btn btn-default btn-circle waves-effect waves-circle waves-float" title="tambah user">
                        <i class="material-icons">group</i>
                    </a>
                </div>
                <div class="body">
                    @if(session()->has('message'))
                    <div class="alert alert-success alert-dismissible">
                        <b>{{ session('message') }}</b> <button class="close" data-dismiss="alert">x</button>
                    </div>
                    @endif
                    <div class="table-responsive">
                        <table class="table table-hover dashboard-task-infos users" id="table">
                            <thead>
                                <tr>
                                    <th>No</th>
                                    <th>Nama</th>
                                    <th>Username</th>
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
       var users = $('.users').DataTable({
            processing:true,
            serverSide:true,
            ajax:"{{ url('/ajax/users') }}",
            columns:[
                {data:'id_users',searchable:false,render:function(data,type,row,meta){
                    return meta.row + meta.settings._iDisplayStart+1;
                    console.log(meta.row);
                }},
                {data:'name',name:'name'},
                {data:'username',name:'username'},
                {data:'status_akun',name:'status_akun'},
                {data:'action',name:'action',searchable:false,orderable:false}
            ],
            scrollCollapse: true,
            columnDefs: [{
            sortable: true,
            "class": "index",
            targets: 0
            }],
            order: [[ 0, 'desc' ]],
            // fixedColumns: true
        });
        users.on( 'order.dt search.dt', function () {
        users.column(0, {search:'applied', order:'applied'}).nodes().each( function (cell, i) {
        cell.innerHTML = i+1;
        });
        }).draw();
    });
</script>
@endsection