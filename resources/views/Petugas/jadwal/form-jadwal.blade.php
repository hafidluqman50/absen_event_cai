@extends('layout.app')

@section('content')
    <div class="block-header">
        <h2>JADWAL</h2>
    </div>

    <div class="row clearfix">
        <!-- Form -->
        <div class="col-xs-12 col-sm-12 col-md-12 col-lg-12">
            <div class="card">
                <div class="header" style="box-shadow: 2px 3px 2px rgba(0, 0, 0, 0.3)">
                    <h2>FORM JADWAL</h2>
                    <a href="{{ url('/petugas/kegiatan/'.$id.'/jadwal') }}" style="float: right; margin-top:-2.8rem" class="btn btn-default btn-circle waves-effect waves-circle waves-float">
                        <i class="material-icons">keyboard_backspace</i>
                    </a>
                </div>
                <div class="body">
                    <form action="{{ url('/petugas/jadwal/save') }}" method="POST">
                        @csrf
                        <div class="form-group form-float">
                            <div class="form-line">
                                <input type="text" name="jadwal" class="form-control" value="{{ isset($row) ? $row->nama_jadwal : '' }}" required="required">
                                <label class="form-label" for="">Jadwal</label>
                            </div>
                        </div>
                        <div class="form-group form-float">
                            <div class="form-line">
                                <textarea name="keterangan" id="" cols="30" rows="10" class="form-control" required="required">{{ isset($row) ? $row->keterangan : '' }}</textarea>
                                <label class="form-label" for="">Keterangan</label>
                            </div>
                        </div>
                        <input type="hidden" name="id_kegiatan" value="{{ $id }}">
                        <input type="hidden" name="id_jadwal" value="{{ isset($row) ? $row->id_jadwal : '' }}">
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