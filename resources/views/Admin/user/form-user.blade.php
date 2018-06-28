@extends('layout.app')

@section('custom_css')
    <link href="{{ asset('frontend/plugins/bootstrap-select/css/bootstrap-select.css') }}" rel="stylesheet" />
@endsection

@section('content')
    <div class="block-header">
        <h2>USER</h2>
    </div>

    <div class="row clearfix">
        <!-- Form -->
        <div class="col-xs-12 col-sm-12 col-md-12 col-lg-12">
            <div class="card">
                <div class="header" style="box-shadow: 2px 3px 2px rgba(0, 0, 0, 0.3)">
                    <a href="{{ url('/admin/users') }}" style="float:left; margin-top:-1.2rem" class="btn btn-default btn-circle waves-effect waves-circle waves-float" title="kembali">
                        <i class="material-icons">keyboard_backspace</i>
                    </a>
                    <h2>FORM USER</h2>
                </div>
                <div class="body">
                    @if(session()->has('log'))
                    <div class="alert alert-danger alert-dismissible">
                        {{ session('log') }} <button class="close" data-dismiss="alert">x</button>
                    </div>
                    @endif
                    <form action="{{ url('/admin/users/save') }}" method="POST">
                        @csrf
                        <div class="form-group form-float">
                            <div class="form-line">
                                <input type="text" name="name" class="form-control" value="{{ isset($row) ? $row->name : '' }}" required="required">
                                <label class="form-label">Nama</label>
                            </div>
                        </div>
                        <div class="form-group form-float">
                            <div class="form-line">
                                <input type="text" name="username" class="form-control" value="{{ isset($row) ? $row->username : '' }}" required="required">
                                <label class="form-label">Username</label>
                            </div>
                        </div>
                        <div class="form-group form-float">
                            <div class="form-line">
                                <input type="password" name="password" class="form-control">
                                <label class="form-label">Password</label>
                            </div>
                        </div>
                        <div class="form-group form-float">
                            <label class="form-label" for="">Level User</label>
                            <div class="form-line">
                                <select name="level" class="form-control show-tick" required="required">
                                    <option selected="selected" disabled="disabled">=== Pilih Level User</option>
                                    <option value="1" @if(isset($row)){{$row->level==1 ? 'selected="selected"' : ''}}@endif>Petugas</option>
                                    <option value="0" @if(isset($row)){{$row->level==0 ? 'selected="selected"' : ''}}@endif>Guest</option>
                                </select>
                            </div>
                        </div>
                        <input type="hidden" name="id_users" value="{{ isset($row) ? $row->id_users : '' }}">
                        <button type="submit" class="btn bg-orange waves-effect" name="submit" value="submit">
                            <i class="material-icons">save</i>
                            <span>SIMPAN</span>
                        </button>
                    </form>
                </div>
            </div>
        </div>
        <!-- #END# Form -->
    </div>
    
@endsection

@section('custom_js')
    <script src="{{ asset('frontend/plugins/bootstrap-select/js/bootstrap-select.js') }}"></script>
@endsection