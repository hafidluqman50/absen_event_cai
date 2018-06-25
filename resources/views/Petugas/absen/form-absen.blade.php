@extends('layout.app')

@section('content')
    <div class="block-header">
        <h2>ABSEN</h2>
    </div>

    <div class="row clearfix">
        <!-- Form -->
        <div class="col-xs-12 col-sm-12 col-md-12 col-lg-12">
            <div class="card">
                <div class="header" style="box-shadow: 2px 3px 2px rgba(0, 0, 0, 0.3)">
                    <h2>FORM ABSEN</h2>
                    <a href="{{ url('/petugas/kegiatan/'.$id.'/absen') }}" style="float: right; margin-top:-2.8rem" class="btn btn-default btn-circle waves-effect waves-circle waves-float">
                        <i class="material-icons">keyboard_backspace</i>
                    </a>
                </div>
                <div class="body">
                    <form action="{{ url('petugas/absen/save') }}" method="POST">
                        @csrf
                        <div class="form-group form-float">
                            <label class="form-label" for="">Jadwal</label>
                            <div class="form-line">
                                <input type="text" name="keterangan" class="form-control" required="required" placeholder="Ex: Pagi;">
                            </div>
                        </div>
                        <div class="form-group form-float">
                            <div class="form-line">
                                <input type="number" class="form-control" name="barcode" required="required">
                                <label class="form-label" for="">Barcode</label>
                            </div>
                        </div>
                        <input type="hidden" name="id_kegiatan" value="{{ $id }}">
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