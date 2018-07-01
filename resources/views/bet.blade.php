<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Bet Peserta | Ansensi Online</title>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.0/css/bootstrap.min.css" integrity="sha384-9gVQ4dYFwwWSjIDZnLEWnxCjeSWFphJiwGPXr1jddIhOegiu1FwO5qRGvFXOdJZ4" crossorigin="anonymous">
    <link href="{{asset('frontend/custom/peserta.css')}}" rel="stylesheet">
    <link rel="stylesheet" src="{{asset('frontend/custom/print.css')}}" type="text/css" media="print" />
    <style type="text/css" media="print">
        @media print{
            *{-webkit-print-color-adjust:exact;print-color-adjust:exact}
            @page {
                page-break-after: always;
                size:F4;
            }

            @page{
                margin-top: -3.2cm;
                margin-left:0.5cm;   
                margin-right:0.5cm;   
                margin-bottom:-3.2cm; /* Top margin on first page 10cm */
            }

            /* *{
                -webkit-print-color-adjust: exact!important;
            } */
        }
    </style>
</head>
<body>
    <div class="container-fluid">
        <div class="row text-align">
            {{-- <div class="col-md-3">
                <div class="bgpeserta" style="width:302.3622047244088px; height:377.952755905511px; margin:0.5rem">
                    <div class="col-md-12 row" style="top:1rem; left:0.7rem">
                        <div class="col-md-3 text-center">
                            <img class="img" src="{{ asset('frontend/images/cai.png') }}" alt="" width="220%">
                        </div>
                        <div class="col-md-9 text-center" style="left:0.8rem">
                            <p class="judul">PERMATA XXXIX</p>
                            <p class="ket">CINTA ALAM INDONESIA</p>
                            <p class="thn">2018</p>
                        </div>
                    </div>
                    <div class="col-md-12 text-center" style="left:1rem; top:1rem">
                        <div class="kotak text-center">
                            <label class="status">Peserta</label>
                        </div>
                    </div>
                    <div class="col-md-12 text-center" style="top:2rem">
                        <label class="inp">Khoirulli Nurul Fatimah</label>
                        <label class="inp-kel">Sambutan</label>
                        <label class="inp-bar">165634689567</label>
                    </div>
                </div>
            </div> --}}
            <div class="{{ $get->ket == 'panitia' ? 'bgpanitia' :($get->ket == 'peserta' ? 'bgpeserta' : '') }}" style="width:12cm; height:16cm;">
                <div class="col-md-12 row" style="top:1rem; left:0.7rem">
                    <div class="col-md-3 text-center">
                        <img class="img" src="{{ asset('frontend/images/cai.png') }}" alt="" width="220%">
                    </div>
                    <div class="col-md-9 text-center" style="left:2rem; margin-top:0.5rem">
                        <p class="judul">PERMATA XXXIX</p>
                        <p class="ket">{{ $get->nama_kegiatan }}</p>
                        <p class="thn">{{ year($get->tanggal_kegiatan) }}</p>
                    </div>
                </div>
                <div class="col-md-12 text-center" style="left:5rem; top:1.9rem">
                    <div class="kotak text-center">
                        <label class="status">{{ $get->ket == 'panitia' ? 'Panitia' :($get->ket == 'peserta' ? 'Peserta' : '') }}</label>
                    </div>
                </div>
                <div class="col-md-12 text-center" style="top:4rem">
                    <label class="inp">{{ $get->nama_anggota }}</label>
                    <label class="inp-kel">{{ $get->nama_kelompok }}</label>
                    <label class="inp-bar"><img src="data:image/png;base64,{{$code}}" alt="barcode"/>{{$get->code_barcode}}</label>
                </div>
            </div>
{{-- 
            <div class="bgpanitia" style="width:302.3622047244088px; height:377.952755905511px; margin-left:1.5rem; margin-top:6rem">
                <div class="col-md-12 row" style="top:1rem; left:0.7rem">
                    <div class="col-md-3 text-center">
                        <img class="img" src="{{ asset('frontend/images/cai.png') }}" alt="" width="220%">
                    </div>
                    <div class="col-md-9 text-center" style="left:0.8rem">
                        <p class="judul">PERMATA XXXIX</p>
                        <p class="ket">CINTA ALAM INDONESIA</p>
                        <p class="thn">2018</p>
                    </div>
                </div>
                <div class="col-md-12 text-center" style="left:1rem; top:1rem">
                    <div class="kotak text-center">
                        <label class="status" style="letter-spacing:2px;">Panitia</label>
                    </div>
                </div>
                <div class="col-md-12 text-center" style="top:2rem">
                    <label class="inp-pan">Khoirulli Nurul Fatimah</label>
                    <label class="inp-kel-pan">Sambutan</label>
                    <label class="inp-bar-pan">165634689567</label>
                </div>
            </div> --}}
        </div>
    </div>
</body>
</html>