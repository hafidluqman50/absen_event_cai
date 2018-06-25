<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>Bet | Ansensi Online</title>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.0/css/bootstrap.min.css" integrity="sha384-9gVQ4dYFwwWSjIDZnLEWnxCjeSWFphJiwGPXr1jddIhOegiu1FwO5qRGvFXOdJZ4" crossorigin="anonymous">
    <link href="{{asset('frontend/custom/style.css')}}" rel="stylesheet">
    <link rel="stylesheet" src="{{asset('frontend/custom/print.css')}}" type="text/css" media="print" />
    <style type="text/css" media="print">
        @media print{
             *{-webkit-print-color-adjust:exact;print-color-adjust:exact}
            @page {
            } 

            .bg{
                -webkit-print-color-adjust: exact!important;
                /* color-adjust: exact!important; */
            }

            .jabatan{
                margin-left:-6rem;
            }

            .lokasi{
                margin-left:3rem;
            }

            .nama{
                font-size:20px;
            }
        }
    </style>
</head>
<body>
    {{-- <div class="container-fluid"></div> --}}
    <div class="row" style="margin:0px!important" style="margi">
        <div class="col-md-6" style="margin-top:1rem">
            <div class="container-fluid bg" style="border:1px solid black">
                <br>
                <div class="row">
                    <div class="col-md-6">
                        <img class="img" src="{{ asset('frontend/images/cai.png') }}" alt="" width="70%">
                    </div>
                    <div class="col-md-6">
                        <p class="jabatan">PESERTA</p>
                        <p class="tmpt">at</p>
                    </div>
                </div>
                <div class="col-md-12" style="margin-top:-1.7rem; margin-left:-1.5rem">
                    <p class="lokasi col text-right">PONPES AL-AZIZIAH SAMARINDA</p>
                    <p class="lokasi col text-right" style="margin-top:-1rem">12 - 15 Juli 2018</p>
                </div>
                <br><br><br>
                <div class="col-md-12">
                    <div class="box col-md-10 offset-md-1">
                        <label class="nama">KHOIRULLI NURUL FATIMAH</label>
                    </div>
                </div>
                <br>
                <div class="col-md-12">
                    <div class="box col-md-10 offset-md-1">
                        <label class="nama">SAMBUTAN</label>
                    </div>
                </div>
                <div class="col-md-12">
                    <div class="text-left">
                        <label class="barcode">294153315001</label>
                    </div>
                </div>
            </div>
        </div>
    </div>
</body>
</html>