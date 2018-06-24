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
                    <h2>EDIT USER</h2>
                    <a href="{{ route('user.main') }}" style="float: right; margin-top:-2.8rem" class="btn btn-default btn-circle waves-effect waves-circle waves-float">
                        <i class="material-icons">keyboard_backspace</i>
                    </a>
                </div>
                <div class="body">
     				{{-- {{ Form::model($jabatan, array('route' => array('jabatan.update', $jabatan->id), 'files' => true, 'method' => '','class'=>'')) }} --}}
     				{{ Form::model(array('route' => array(), 'files' => true, 'method' => '','class'=>'')) }}
                        @include('user.form')
                        @section('pass')
                            <div class="form-group form-float">
                                <div class="form-line">
                                    {!! Form::password('password',null,['class'=>'form-control']) !!}
                                    <label class="form-label">Password</label>
                                </div>
                            </div>
                            <div class="form-group form-float">
                                <div class="form-line">
                                    {!! Form::password('repassword',null,['class'=>'form-control']) !!}
                                    <label class="form-label">Ulangi Password</label>
                                </div>
                            </div>
                        @endsection
                        <button type="submit" class="btn bg-orange waves-effect" name="submit" value="submit">
                            <i class="material-icons">save</i>
                            <span>PERBARUI</span>
                        </button>
                    {!! Form::close() !!}
                </div>
            </div>
        </div>
        <!-- #END# Form -->
    </div>
    
@endsection

@section('custom_js')
    
@endsection