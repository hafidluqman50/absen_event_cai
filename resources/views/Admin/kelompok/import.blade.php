@extends('layout.app')

@section('custom_css')
@endsection

@section('content')
    <div class="block-header">
        <h2>IMPORT</h2>
    </div>

    <div class="row clearfix">
        <!-- Form -->
        <div class="col-xs-12 col-sm-12 col-md-12 col-lg-12">
            <div class="card">
                <div class="header" style="box-shadow: 2px 3px 2px rgba(0, 0, 0, 0.3)">
                    <h2>IMPORT</h2>
                    <a href="{{ url('/admin/kelompok') }}" style="float: right; margin-top:-2.8rem" class="btn btn-default btn-circle waves-effect waves-circle waves-float">
                        <i class="material-icons">keyboard_backspace</i>
                    </a>
                </div>
                <div class="body">
                    <form action="{{ url('/admin/import/post') }}" method="POST" enctype="multipart/form-data">
                        @csrf
                        <div class="form-group form-float">
                            <label for="">File Import</label>
                            <div class="form-line">
                                <input type="file" name="excel" class="form-control">
                            </div>
                        </div>
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
    <script>
        $(function(){
            $('.alert').hide();
            $('select[name="kelompok"]').change(function(){
                var val = $(this).val();
                $.ajax({
                    url: window.location.origin+'/get-anggota/'+val,
                    type:'GET',
                })
                .done(function(done) {
                    if (done.message == 'No Rows') {
                        $('.alert').show();
                        $('select[name="peserta"]').attr('disabled',true);
                        $('select[name="peserta"]').html(done.anggota).selectpicker('refresh');
                    }
                    else {
                        $('select[name="peserta"]').removeAttr('disabled');
                        $('select[name="peserta"]').html(done.anggota).selectpicker('refresh');
                    }
                    console.log(done.message);
                })
                .fail(function(error) {
                    console.log(error);
                });
                
            });
        });
    </script>
@endsection