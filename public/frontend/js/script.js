if (typeof jQuery === "undefinied") {
    throw new Error("jQuery plugins need before this file");
}

$(function(){
    
    $('#sip').click(function(){
        if ($(this).is(':checked')) {
            $('.username').removeAttr('disabled');
        }
        else {
            $('.username').attr('disabled','disabled');
        }
    });

    $('#cek').click(function(){
        if ($(this).is(':checked')) {
            $('.ubah').removeAttr('disabled');
        }
        else {
            $('.ubah').attr('disabled','disabled');
        }
    });

    $('.yeah').hide();
    $('select[name="kelompok"]').change(function(){
        var val = $(this).val();
        $.ajax({
            url: window.location.origin+'/get-anggota/'+val,
            type:'GET',
        })
        .done(function(done) {
            if (done.message == 'No Rows') {
                $('.alert').show();
                $('select[name="peserta[]"]').attr('disabled',true);
                $('select[name="peserta[]"]').html(done.anggota).selectpicker('refresh');
            }
            else {
                $('select[name="peserta[]"]').removeAttr('disabled');
                $('select[name="peserta[]"]').html(done.anggota).selectpicker('refresh');
            }
            console.log(done.message);
        })
        .fail(function(error) {
            console.log(error);
        });
    });
    
});