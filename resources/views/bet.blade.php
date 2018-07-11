<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="utf-8">
  <title>Bet Peserta</title>
 <!-- Normalize or reset CSS with your favorite library -->
 <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/normalize/7.0.0/normalize.min.css">

<!-- Load paper.css for happy printing -->
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/paper-css/0.3.0/paper.css">
<link href="https://fonts.googleapis.com/css?family=Share+Tech+Mono" rel="stylesheet">
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.0/css/bootstrap.min.css" integrity="sha384-9gVQ4dYFwwWSjIDZnLEWnxCjeSWFphJiwGPXr1jddIhOegiu1FwO5qRGvFXOdJZ4" crossorigin="anonymous">
<link href="{{asset('frontend/custom/peserta.css')}}" rel="stylesheet">
  <style>
    @import url('https://fonts.googleapis.com/css?family=Libre+Barcode+128+Text|Lobster|Montserrat|Source+Sans+Pro:700');
    @page { size: legal }
    
    @media print { 
    }
    .label{
        /* Avery 5160 labels -- CSS and HTML by MM at Boulder Information Services */
        width: 446px; /* plus .6 inches from padding */
        /* height: .670in; */
        height: 16cm; /* plus .125 inches from padding */
        padding: .10in 0in 0;
        margin-right: .125in; /* the gutter */
        margin-bottom: .125in; /* the gutter */
        float: left;
        display: block;
        text-align: center;
        overflow: hidden;
        outline: 1px solid grey; 
        }
      .page-break {
        clear: both;
        /*display:block;*/
        page-break-after:always;
        /* margin-bottom:105pt; */
        }
      .text-nama {
        font-family: 'Share Tech Mono';
        font-size: 8pt;
        width:100%;
        text-align: center;
        line-height: 2pt;
      }
      .bar{
          font-family: 'Libre Barcode 128 Text', cursive;
          font-size:27pt;
      }
  </style>
</head>
<body class="legal">
<section class="sheet padding-10mm">

    <div class="label {{ $get->ket=='panitia'?'bgpanitia':'bgpeserta' }}" style="margin-top:40pt">
        <div>
            <div class="text-center" style="margin-left:-180pt;margin-top:5pt;">
                <img class="img" src="{{ asset('frontend/images/cai.png') }}" alt="" width="160pt">
            </div>
            <div class="text-center" style="margin-left: 135pt;margin-top: -84pt;">
                <p class="judul">PERMATA XXXIX</p>
                <p class="ket">{{ $get->nama_kegiatan }}</p>
                <!--<p class="thn">{{ from_to_date($get->tanggal_kegiatan,$get->sampai_tanggal_kegiatan) }}</p>-->
                <p class="thn">{{ year($get->tanggal_kegiatan) }}</p>
            </div>
        </div>
        <div class="col-md-12 text-center" style="left:5rem; top:1.9rem">
            <div class="kotak text-center">
                <label class="status">{{ $get->ket=='panitia'?'Panitia':'Peserta' }}</label>
            </div>
        </div>
        <br>
        <div class="col-md-12 text-center" style="top:2rem">
            <label class="inp">{{ $get->nama_anggota }}</label>
            <label class="inp-kel">{{ $get->nama_kelompok }}</label>
            <label class="inp-bar"><img src="data:image/png;base64,{{$code}}" alt=""></label>
        </div>
    </div>
    <div class="page-break"></div>
</section>
</body>
</html>