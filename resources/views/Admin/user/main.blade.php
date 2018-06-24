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
                        {{ session('message') }}<button class="close" data-dismiss="alert">x</button>
                    </div>
                    @endif
                    <div class="table-responsive">
                        <table class="table table-hover dashboard-task-infos" id="table">
                            <thead>
                                <tr>
                                    <th>No</th>
                                    <th>Nama</th>
                                    <th>Username</th>
                                    <th>Status</th>
                                    <th>Aksi</th>
                                </tr>
                            </thead>
                            <tbody>
                                @foreach($users as $key => $data)
                                <tr>
                                    <td>{{ $key+1 }}</td>
                                    <td>{{ $data->name }}</td>
                                    <td>{{ $data->username }}</td>
                                    <td>
                                        @if($data->status_akun == 1)
                                        <span class="badge bg-indigo">Aktif</span>
                                        @else
                                        <span class="badge label-danger">Nonaktif</span>
                                        @endif
                                    </td>
                                    <td>
                                        <div class="btn-group" role="group">
                                            <a href="{{ url('/admin/users/'.$data->id_users.'/edit') }}" title="Edit" class="btn btn-warning waves-effect">Edit</a>
                                        </div>
                                        <div class="btn-group" role="button">
                                            <a href="{{ url('/admin/users/'.$data->id_users.'/delete') }}" title="Hapus"  class="btn btn-danger waves-effect" onclick="return confirm('Anda Yakin?')">Hapus</a>
                                        </div> 
                                        <div class="btn-group" role="group">
                                            @if($data->status_akun == 1)
                                            <a href="{{ url('/admin/users/'.$data->id_users.'/status-users') }}" title="Status" class="btn btn-primary waves-effect">Nonaktifkan</a>
                                            @else
                                            <a href="{{ url('/admin/users/'.$data->id_users.'/status-users') }}" title="Status" class="btn btn-success waves-effect">Aktifkan</a>
                                            @endif
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