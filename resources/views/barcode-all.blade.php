<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="utf-8">
  <title>Barcode Absen</title>
 <!-- Normalize or reset CSS with your favorite library -->
 <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/normalize/7.0.0/normalize.min.css">

<!-- Load paper.css for happy printing -->
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/paper-css/0.3.0/paper.css">
<link href="https://fonts.googleapis.com/css?family=Share+Tech+Mono" rel="stylesheet">
  <style>
    @import url('https://fonts.googleapis.com/css?family=Libre+Barcode+128+Text|Lobster|Montserrat|Source+Sans+Pro:700');
    @page { size: A4 }
    
    @media print { 

    }
    .label{
        /* Avery 5160 labels -- CSS and HTML by MM at Boulder Information Services */
        width: 220px; /* plus .6 inches from padding */
        /* height: .670in; */
        height: .940in; /* plus .125 inches from padding */
        padding: .10in 0in 0;
        margin-right: .125in; /* the gutter */
        margin-bottom: .125in; /* the gutter */
        float: left;
        display: block;
        text-align: center;
        overflow: hidden;
        outline: 1px dotted; 
        }
      /*.page-break {*/
      /*  clear: both;*/
      /*  display:block;*/
      /*  page-break-after:always;*/
      /*  }*/
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
<body class="A4 portrait">
@if(count($data) > 48)
    @for($i=0;$i<$hitung;$i++)
    @php
    $offset = $i*48;
    @endphp
    <section class="sheet padding-10mm">
        <h5 style="text-align:center;font-family: 'Source Sans Pro', sans-serif;">
            ABSEN KEGIATAN {{ $kegiatan->nama_kegiatan }} {{ from_to_date($kegiatan->tanggal_kegiatan,$kegiatan->sampai_tanggal_kegiatan) }}
        </h5>
        @foreach($barcode->limitData($id,$offset) as $num => $val)
        @php
        $num = $num+1;
        @endphp
        <div class="label">
            <label class="bar"><img src="data:image/png;base64,{{ $barcode->code($val->code_barcode) }}" alt=""></label><br>
            <span class="text-nama">{{ $val->nama_anggota }}</span>
        </div>{{--
        @if($num%48 == 0)
        <div class="page-break"></div>
        @endif--}}
        @endforeach
      </section>
    @endfor
@else
<section class="sheet padding-10mm">
    <h5 style="text-align:center;font-family: 'Source Sans Pro', sans-serif;">
        ABSEN KEGIATAN {{ $kegiatan->nama_kegiatan }} {{ from_to_date($kegiatan->tanggal_kegiatan,$kegiatan->sampai_tanggal_kegiatan) }}
    </h5>
    @foreach($get as $num => $val)
    <div class="label">
        <label class="bar"><img src="data:image/png;base64,{{ $barcode->code($val->code_barcode) }}" alt=""></label><br>
        <span class="text-nama">{{ $val->nama_anggota }}</span>
    </div>
    @endforeach
  </section>
@endif
</body>
</html>