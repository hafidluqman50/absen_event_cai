@extends('layout.app')

@section('custom_css')
    
@endsection

@section('content')
    <div class="block-header">
        <h2>KELOMPOK</h2>
    </div>

    <div class="row clearfix">
        <!-- Form -->
        <div class="col-xs-12 col-sm-12 col-md-12 col-lg-12">
            <div class="card">
                <div class="header" style="box-shadow: 2px 3px 2px rgba(0, 0, 0, 0.3)">
                    <h2>TAMBAH KELOMPOK</h2>
                    <a href="{{ route('kelompok.index') }}" style="float: right; margin-top:-2.8rem" class="btn btn-default btn-circle waves-effect waves-circle waves-float">
                        <i class="material-icons">keyboard_backspace</i>
                    </a>
                </div>
                <div class="body">
                    {{-- {!! Form::open(['route'=>'jabatan.store','class'=>'form-horizontal','files'=>true]) !!} --}}
                    {!! Form::open(['class'=>'','files'=>true]) !!}
                        @include('kelompok.form')
                        <button type="submit" class="btn bg-orange waves-effect" name="submit" value="submit">
                            <i class="material-icons">save</i>
                            <span>SIMPAN</span>
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