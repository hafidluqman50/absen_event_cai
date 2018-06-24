<div class="form-group form-float">
    <div class="form-line">
        {!! Form::text('nama',null,['class'=>'form-control','required']) !!}
        <label class="form-label">Nama Kegiatan</label>
    </div>
</div>
<div class="form-group form-float">
    <div class="form-line">
        {!! Form::date('tanggal',null,['class'=>'form-control','required']) !!}
        <label class="form-label">Tanggal Kegiatan</label>
    </div>
</div>
<div class="form-group form-float">
    <div class="form-line">
        {!! Form::text('lokasi',null,['class'=>'form-control','required']) !!}
        <label class="form-label">Lokasi</label>
    </div>
</div>