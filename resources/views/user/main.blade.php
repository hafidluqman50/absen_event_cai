@extends('layout.app')

@section('custom_css')
    
@endsection

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
                    <a href="{{ route('user.create') }}" style="float: right; margin-top:-2.8rem" class="btn btn-default btn-circle waves-effect waves-circle waves-float" title="tambah user">
                        <i class="material-icons">group</i>
                    </a>
                </div>
                <div class="body">
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
                                <?php $no = 1; ?>
                                <tr>
                                    <th scope="row"><?= $no++; ?></th>
                                    <td>Nama</td>
                                    <td>Mr.yeye</td>
                                    <td><span class="badge bg-indigo">Aktif</span></td>
                                    <td>
                                        <div class="btn-group" role="group">
                                            <a href="#" title="Edit" class="btn btn-warning waves-effect"><i class="fa fa-pencil"></i></a>
                                            <a href="#" title="Hapus"  class="btn btn-danger waves-effect" onclick="return confirm('Anda Yakin?')"><i class="fa fa-trash"></i></a>
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