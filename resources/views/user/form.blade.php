<div class="form-group form-float">
    <div class="form-line">
        {!! Form::text('nama',null,['class'=>'form-control','required']) !!}
        <label class="form-label">Nama</label>
    </div>
</div>
<div class="form-group form-float">
    <div class="form-line">
        {!! Form::text('username',null,['class'=>'form-control','required']) !!}
        <label class="form-label">Username</label>
    </div>
</div>
<div class="form-group">
    <code>*Kosongkan password jika tidak ingin dirubah</code>
</div>
@yield('pass')
<div class="form-group">
    <select class="form-control show-tick" name="status" required>
        <option selected disabled>-- Pilih Status --</option>
        <option value="Aktif">Aktif</option>
        <option value="Tidak Aktif">Tidak Aktif</option>
    </select>
</div>