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
                    <h2>FORM PESERTA</h2>
                    <a href="{{ url('/admin/kelompok/'.$id.'/anggota') }}" style="float: right; margin-top:-2.8rem" class="btn btn-default btn-circle waves-effect waves-circle waves-float">
                        <i class="material-icons">keyboard_backspace</i>
                    </a>
                </div>
                <div class="body">
                    <form action="{{ url('/admin/anggota/save') }}" method="POST">
                        @csrf
                        <div class="form-group form-float">
                            <div class="form-line">
                                <input type="text" class="form-control" name="nama_anggota" value="{{ isset($row) ? $row->nama_anggota : '' }}" required="required">
                                <label class="form-label" for="">Nama Peserta</label>
                            </div>
                        </div>
                        <div class="form-group form-float">
                            <label class="form-label" for="">Kelompok</label>
                            <div class="form-line">
                                <select name="kelompok" class="form-control show-tick" required="required" data-live-search="true">
                                    <option selected="selected" disabled="disabled">=== Pilih Kelompok</option>
                                    @foreach($kelompok as $data)
                                    <option value="{{ $data->id_kelompok }}" @if(isset($row)){{$row->id_kelompok == $data->id_kelompok ? 'selected="selected"' : ''}}@endif>{{ $data->nama_kelompok }}</option>
                                    @endforeach
                                </select>
                            </div>
                        </div>
                        <div class="form-group form-float">
                            <label class="form-label" for="">Jenis Kelamin</label>
                            <div class="form-line">
                                <select name="jenis_kelamin" class="form-control show-tick" required="required">
                                    <option selected="selected" disabled="disabled">=== Pilih Jenis kelamin ===</option>
                                    <option value="laki-laki" @if(isset($row)){{$row->jenis_kelamin=='laki-laki' ? 'selected="selected"' : ''}}@endif>Laki - Laki</option>
                                    <option value="perempuan" @if(isset($row)){{$row->jenis_kelamin=='perempuan' ? 'selected="selected"' : ''}}@endif>Perempuan</option>
                                </select>
                            </div>
                        </div>
                        <div class="form-group form-float">
                            <label class="form-label" for="">Tanggal Lahir</label>
                            <div class="form-line">
                                <input type="date" class="form-control" name="tgl_lahir" value="{{ isset($row) ? $row->tgl_lahir : '' }}" required="required">
                            </div>
                        </div>
                        <div class="form-group form-float">
                            <div class="form-line">
                                <input type="text" class="form-control" name="tempat_lahir" value="{{ isset($row) ? $row->tempat_lahir : '' }}" required="required">
                                <label class="form-label" for="">Tempat Lahir</label>
                            </div>
                        </div>
                        <div class="form-group form-float">
                            <div class="form-line">
                                <input type="number" class="form-control" name="no_telepon" value="{{ isset($row) ? $row->no_telepon : '' }}">
                                <label class="form-label" for="">No Telepon</label>
                            </div>
                        </div>
                        <div class="form-group form-float">
                            <div class="form-line">
                                <input type="email" name="email" class="form-control" value="{{ isset($row) ? $row->email : '' }}" required="required">
                                <label class="form-label" for="">Email</label>
                            </div>
                        </div> 
                        <div class="form-group form-float">
                            <div class="form-line">
                                <textarea name="alamat" class="form-control" id="" cols="30" rows="10" required="required">{{ isset($row) ? $row->alamat : '' }}</textarea>
                                <label class="form-label" for="">Alamat</label>
                            </div>
                        </div>
                        <div class="form-group form-float">
                            <div class="form-line">
                                <input type="text" name="desa" class="form-control" value="{{ isset($row) ? $row->desa : '' }}" required="required">
                                <label class="form-label" for="">Desa</label>
                            </div>
                        </div>
                        <div class="form-group form-float">
                            <div class="form-line">
                                <input type="text" name="ket" class="form-control" value="{{ isset($row) ? $row->ket_peserta : '' }}" required="required">
                                <label class="form-label" for="">Keterangan Anggota</label>
                            </div>
                        </div>
                        <div class="form-group form-float">
                            <div class="form-line">
                                <input type="text" name="ukuran" class="form-control" value="{{ isset($row) ? $row->ukuran_baju : '' }}" required="required">
                                <label class="form-label" for="">Ukuran Baju</label>
                            </div>
                        </div>
                        <div class="form-group form-float">
                            <div class="form-line">
                                <input type="text" name="dapukan" class="form-control" value="{{ isset($row) ? $row->dapukan : '' }}" required="required">
                                <label class="form-label" for="">Dapukan</label>
                            </div>
                        </div>
                        <div class="form-group form-float">
                            <div class="form-line">
                                <input type="text" name="status" class="form-control" value="{{ isset($row) ? $row->status_peserta : '' }}" required="required">
                                <label class="form-label" for="">Status Anggota</label>
                            </div>
                        </div>
                        <input type="hidden" name="id_kelompok" value="{{ $id }}">
                        <input type="hidden" name="id_anggota" value="{{ isset($row) ? $row->id_anggota : '' }}">
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