<?php

namespace App\Http\Controllers\Admin;

use Illuminate\Http\Request;
use App\Http\Controllers\Controller;
use App\Model\KelompokModel as Kelompok;
use App\Model\AnggotaModel as Anggota;
use Box\Spout\Reader\ReaderFactory;
use Box\Spout\Common\Type;
use DB;
use Excel;

class KelompokController extends Controller
{
    public function index() {
        $title = 'Kelompok';
        $page  = 'kelompok';
    	return view('Admin.kelompok.main',compact('title','page'));
    }

    public function tambah() {
    	$title = 'Form Kelompok';
    	$page = 'kelompok';
    	return view('Admin.kelompok.form-kelompok',compact('title','page'));
    }

    public function edit($id) {
    	$title = 'Form Kelompok';
    	$page = 'kelompok';
    	$row = Kelompok::where('id_kelompok',$id)->firstOrFail();
    	return view('Admin.kelompok.form-kelompok',compact('row','title','page'));
    }

    public function delete($id) {
    	Kelompok::where('id_kelompok',$id)->delete();
    	return redirect('/admin/kelompok')->with('message','Berhasil Hapus Kelompok');
    }

    public function save(Request $request) {
		$nama_kelompok   = strtoupper($request->nama_kelompok);
		$lokasi_kelompok = strtoupper($request->lokasi_kelompok);
		$id_kelompok     = $request->id_kelompok;
        $get             = Kelompok::where('nama_kelompok',$nama_kelompok)->count();
        if ($get != 0) {
            return redirect('/admin/kelompok')->with('log','Maaf Kelompok Sudah Ada');
        }
        else {
            $array = [
                'nama_kelompok'   => $nama_kelompok,
                'lokasi_kelompok' => $lokasi_kelompok
            ];
            if ($id_kelompok == '') {
                Kelompok::create($array);
                $message = 'Berhasil Input Kelompok';
            }
            else {
                Kelompok::where('id_kelompok',$id_kelompok)->update($array);
                $message = 'Berhasil Update Kelompok';
            }
            return redirect('/admin/kelompok')->with('message',$message);
        }
    }

    public function contohFormat() {
        Excel::create('contoh format absen cai',function($excel){
            $excel->sheet('Kelompok',function($sheet){
                // TITLE //
                $sheet->setCellValue('A1','NO.');
                $sheet->setCellValue('B1','NAMA KELOMPOK');
                $sheet->setCellValue('C1','LOKASI KELOMPOK');
                // END TITLE //

                // DATA //
                $sheet->setCellValue('A2','1');
                $sheet->setCellValue('B2','PELINDUNG KONOHA');
                $sheet->setCellValue('C2','DIMENSI SASUKE');

                $sheet->setCellValue('A3','2');
                $sheet->setCellValue('B3','DEWA SHINOBI');
                $sheet->setCellValue('C3','DUNIA HAGOROMO');
                // END DATA //
            });

            $excel->sheet('Peserta',function($sheet){
                // TITLE //
                $sheet->setCellValue('A1','NO.');
                $sheet->setCellValue('B1','PESERTA');
                $sheet->setCellValue('C1','NAMA LENGKAP PESERTA');
                $sheet->setCellValue('D1','TEMPAT LAHIR');
                $sheet->setCellValue('E1','TANGGAL LAHIR');
                $sheet->setCellValue('F1','ALAMAT');
                $sheet->setCellValue('G1','JENIS KELAMIN');
                $sheet->setCellValue('H1','NOMOR TELEPON');
                $sheet->setCellValue('I1','EMAIL PESERTA');
                $sheet->setCellValue('J1','KELOMPOK');
                $sheet->setCellValue('K1','DESA');
                $sheet->setCellValue('L1','DAPUKAN MUDA-MUDI');
                $sheet->setCellValue('M1','UKURAN BAJU');
                $sheet->setCellValue('N1','STATUS');
                // END TITLE //

                // DATA //
                $sheet->setCellValue('A2','1');
                $sheet->setCellValue('B2','KIRIMAN');
                $sheet->setCellValue('C2','UCHIHA SASUKE');
                $sheet->setCellValue('D2','KONOHAGAKURE');
                $sheet->setCellValue('E2','23/06/1997');
                $sheet->setCellValue('F2','JLN. PERUM UCHIHA BLOK 1');
                $sheet->setCellValue('G2','LAKI-LAKI');
                $sheet->setCellValue('H2','0888 8888 8888');
                $sheet->setCellValue('I2','sasukegagah@gmail.com');
                $sheet->setCellValue('J2','PELINDUNG KONOHA');
                $sheet->setCellValue('K2','KONOHA');
                $sheet->setCellValue('L2','FREELANCER');
                $sheet->setCellValue('M2','XL');
                $sheet->setCellValue('N2','VETERAN PERANG');

                $sheet->setCellValue('A3','2');
                $sheet->setCellValue('B3','PENDATANG');
                $sheet->setCellValue('C3','HAGOROMO OTSUTSUKI');
                $sheet->setCellValue('D3','BUMI');
                $sheet->setCellValue('E3','23/06/1290');
                $sheet->setCellValue('F3','JLN. SETAPAK DI SEBUAH DESA');
                $sheet->setCellValue('G3','PEREMPUAN');
                $sheet->setCellValue('H3','0888 8888 8888');
                $sheet->setCellValue('I3','hagoromonakmamah@gmail.com');
                $sheet->setCellValue('J3','PENDIRI NINSHU');
                $sheet->setCellValue('K3','DEWA SHINOBI');
                $sheet->setCellValue('L3','GURU');
                $sheet->setCellValue('M3','XL');
                $sheet->setCellValue('N3','TUKANG SEGEL');
                // END DATA //
            });
        })->download('xlsx');
    }

    public function importForm() {
        $title = 'Import';
        $page = 'kelompok';
        return view('Admin.kelompok.import',compact('title','page'));
    }

    public function importExcel(Request $request) {
        $file = $request->file('excel');
        if (!empty($file)) {
            $reader = ReaderFactory::create(Type::XLSX);
            $reader->open($file);
            foreach ($reader->getSheetIterator() as $value) {
                if ($value->getIndex() == 0) {
                    foreach ($value->getRowIterator() as $num => $val) {
                        if ($num > 1) {
                            Kelompok::firstOrCreate([
                                'nama_kelompok'   => strtoupper($val[1]),
                                'lokasi_kelompok' => strtoupper($val[2]),
                            ]);
                            $get = Kelompok::where('nama_kelompok',$val[1])->firstOrFail();
                            $id = $get->id_kelompok;
                            $slug = str_slug($get->nama_kelompok,'-');
                            $array[$id] = $slug;
                        }
                    }   
                }
                if ($value->getIndex() == 1) {
                    foreach ($value->getRowIterator() as $key => $data) {
                        if ($key > 1) {
                            $id_kelompok = array_search(str_slug($data[9],'-'),$array);
                            $explode = explode('/',$data[4]);
                            $tanggal = $explode[2].'-'.$explode[1].'-'.$explode[0];
                            Anggota::firstOrCreate([
                                'nama_anggota'   => $data[2],
                                'id_kelompok'    => $id_kelompok,
                                'tgl_lahir'      => $tanggal,
                                'tempat_lahir'   => $data[3],
                                'desa'           => $data[10],
                                'jenis_kelamin'  => strtolower($data[6]),
                                'no_telepon'     => $data[7],
                                'email'          => $data[8],
                                'alamat'         => $data[5],
                                'ket_peserta'    => $data[1],
                                'ukuran_baju'    => $data[12],
                                'dapukan'        => $data[11],
                                'status_peserta' => $data[13],
                            ]);
                        }
                    }
                }
            }
            return redirect('/admin/kelompok')->with('message','Berhasil Import Data Kelompok Dan Anggota');
        }
    }
}
