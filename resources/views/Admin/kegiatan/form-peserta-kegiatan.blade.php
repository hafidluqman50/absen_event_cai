@extends('layout.app')

@section('content')
    <div class="block-header">
        <h2>PESERTA</h2>
    </div>

    <div class="row clearfix">
        <!-- Form -->
        <div class="col-xs-12 col-sm-12 col-md-12 col-lg-12">
            <div class="card">
                <div class="header" style="box-shadow: 2px 3px 2px rgba(0, 0, 0, 0.3)">
                    <h2>FORM PESERTA KEGIATAN</h2>
                    <a href="{{ url('/admin/kegiatan/'.$id.'/peserta') }}" style="float: right; margin-top:-2.8rem" class="btn btn-default btn-circle waves-effect waves-circle waves-float">
                        <i class="material-icons">keyboard_backspace</i>
                    </a>
                </div>
                <div class="body">
                    <form action="{{ url('/admin/kegiatan/peserta/save') }}" method="POST">
                        @csrf
                        <div class="form-group form-float">
                            <label class="form-label" for="">Nama Peserta</label>
                            <div class="form-line">
                                <select name="peserta" class="form-control" id="">
                                    <option selected="selected" disabled="disabled">=== Pilih Peserta ===</option>
                                    @foreach($peserta as $data)
                                    <option value="{{ $data->id_peserta }}">{{ $data->nama_peserta }}</option>
                                    @endforeach
                                </select>
                            </div>
                        </div>
                        <div class="form-group form-float">
                            <label class="form-label">Nama Kelompok</label>
                            <div class="form-line">
                                <select name="kelompok" class="form-control">
                                    <option selected="selected" disabled="disabled">=== Pilih Kelompok ===</option>
                                    @foreach($kelompok as $data)
                                    <option value="{{ $data->id_kelompok }}">{{ $data->nama_kelompok }}</option>
                                    @endforeach
                                </select>
                            </div>
                        </div>
                        <input type="hidden" name="id_kegiatan" value="{{ $id }}">
                        <input type="hidden" name="id_detail" value="{{ isset($row) ? $row->id_detail : '' }}">
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