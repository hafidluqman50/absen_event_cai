@extends('layout.app')

@section('custom_css')
    <link href="{{ asset('frontend/plugins/bootstrap-select/css/bootstrap-select.css') }}" rel="stylesheet" />
@endsection

@section('content')
    <div class="block-header">
        <h2>KEGIATAN</h2>
    </div>

    <div class="row clearfix">
        <!-- Form -->
        <div class="col-xs-12 col-sm-12 col-md-12 col-lg-12">
            <div class="card">
                <div class="header" style="box-shadow: 2px 3px 2px rgba(0, 0, 0, 0.3)">
                    <h2>FORM KEGIATAN</h2>
                    <a href="{{ url('/petugas/kegiatan') }}" style="float: right; margin-top:-2.8rem" class="btn btn-default btn-circle waves-effect waves-circle waves-float">
                        <i class="material-icons">keyboard_backspace</i>
                    </a>
                </div>
                <div class="body">
                	<form action="{{ url('/petugas/kegiatan/save') }}" method="POST">
                		@csrf
                		<div class="form-group form-float">
                			<div class="form-line">
                				<input type="text" name="nama_kegiatan" class="form-control" required="required" value="{{ isset($row) ? $row->nama_kegiatan : '' }}">
                				<label class="form-label" for="">Nama Kegiatan</label>
                			</div>
                		</div>
                		<div class="form-group form-float">
                			<label class="form-label" for="">Tanggal Kegiatan</label>
                			<div class="form-line">
                				<input type="date" name="tanggal_kegiatan" class="form-control" required="required" value="{{ isset($row) ? $row->tanggal_kegiatan : '' }}">
                			</div>
                		</div>
                		<div class="form-group form-float">
                			<div class="form-line">
                				<textarea name="lokasi_kegiatan" id="" cols="30" rows="10" class="form-control">{{ isset($row) ? $row->lokasi_kegiatan : '' }}</textarea>
            					<label class="form-label" for="">Lokasi Kegiatan</label>
                			</div>
                		</div>
                		<input type="hidden" name="id_kegiatan" value="{{ isset($row) ? $row->id_kegiatan : '' }}">
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
    
@endsection