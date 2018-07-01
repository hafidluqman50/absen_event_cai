-- phpMyAdmin SQL Dump
-- version 4.7.7
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Jul 01, 2018 at 07:16 PM
-- Server version: 10.1.33-MariaDB
-- PHP Version: 5.6.30

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `u5212726_absen`
--

-- --------------------------------------------------------

--
-- Table structure for table `absen`
--

CREATE TABLE `absen` (
  `id_absen` int(11) NOT NULL,
  `id_detail` int(11) NOT NULL,
  `waktu_absen` datetime NOT NULL,
  `id_jadwal` int(11) NOT NULL,
  `id_users` int(3) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `absen`
--

INSERT INTO `absen` (`id_absen`, `id_detail`, `waktu_absen`, `id_jadwal`, `id_users`, `created_at`, `updated_at`) VALUES
(2, 529, '2018-07-01 07:54:54', 1, 4, '2018-07-01 00:54:54', '2018-07-01 00:54:54');

-- --------------------------------------------------------

--
-- Table structure for table `anggota`
--

CREATE TABLE `anggota` (
  `id_anggota` int(11) NOT NULL,
  `nama_anggota` varchar(70) NOT NULL,
  `id_kelompok` int(11) NOT NULL,
  `tgl_lahir` date DEFAULT NULL,
  `tempat_lahir` varchar(70) NOT NULL,
  `desa` varchar(50) NOT NULL,
  `jenis_kelamin` varchar(50) NOT NULL,
  `no_telepon` varchar(20) NOT NULL,
  `email` varchar(100) NOT NULL,
  `alamat` text NOT NULL,
  `ket_peserta` text NOT NULL,
  `ukuran_baju` varchar(10) NOT NULL,
  `dapukan` varchar(100) NOT NULL,
  `status_peserta` varchar(100) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `anggota`
--

INSERT INTO `anggota` (`id_anggota`, `nama_anggota`, `id_kelompok`, `tgl_lahir`, `tempat_lahir`, `desa`, `jenis_kelamin`, `no_telepon`, `email`, `alamat`, `ket_peserta`, `ukuran_baju`, `dapukan`, `status_peserta`, `created_at`, `updated_at`) VALUES
(1, 'PANGGALIH HUSODO', 3, '1994-11-18', 'MALANG', 'SAMARINDA ULU', 'laki-laki', '0813 5015 7264', 'gnom354@yahoo.com', '-', 'KIRIMAN', 'XL', 'KETUA MUDA/I', 'MUBALLIGH SETEMPAT', '2018-06-30 04:22:06', '2018-06-30 04:22:06'),
(2, 'NADIA KURNIKOVA', 3, '2003-08-11', 'SAMARINDA', 'SAMARINDA ULU', 'perempuan', '0853 9058 9108', '-', '-', 'KIRIMAN', 'XL', 'ROKYAH', 'PELAJAR', '2018-06-30 04:22:06', '2018-06-30 04:22:06'),
(3, 'NOVIA RATNA SARI', 3, '1997-11-04', 'SAMARINDA', 'SAMARINDA ULU', 'perempuan', '0813 8512 1140', '-', '-', 'KIRIMAN', 'XL', 'KEPUTRIAN KELOMPOK', 'MUBALLIGH SETEMPAT', '2018-06-30 04:22:06', '2018-06-30 04:22:06'),
(4, 'KHODIJAH KIKI LESTARI', 21, '1995-04-30', 'SAMARINDA', 'SAMBUTAN', 'perempuan', '0822 5512 1207', 'khodijahklestari@gmail.com', '-', 'KIRIMAN', 'L', 'KEPUTRIAN DESA', 'MUBALLIGH SETEMPAT', '2018-06-30 04:22:06', '2018-06-30 04:22:06'),
(5, 'MUHAMMAD AFIF', 21, '1998-02-13', 'SAMARINDA', 'SAMBUTAN', 'laki-laki', '0812 5383 9523', 'afif1998m@gmail.com', '-', 'KIRIMAN', 'XL', 'KETUA MUDA MUDI ', 'MAHASISWA', '2018-06-30 04:22:06', '2018-06-30 04:22:06'),
(6, 'MUHAMMAD NUR HUDA', 21, '1996-11-01', 'SAMARINDA', 'SAMBUTAN', 'laki-laki', '0823 0148 2826', '-', '-', 'KIRIMAN', 'L', 'ROKYAH', 'KERJA', '2018-06-30 04:22:06', '2018-06-30 04:22:06'),
(7, 'FADLI UMAR HAMDAN', 21, '2000-04-26', 'SAMARINDA', 'SAMBUTAN', 'laki-laki', '0823 5306 8300', 'fedli354@gmail.com', '-', 'KIRIMAN', 'M', 'WAKIL KETUA MUDA MUDI', 'PELAJAR', '2018-06-30 04:22:06', '2018-06-30 04:22:06'),
(8, 'BAGUSTO PRANTAU PRATMAJAYA', 8, '1998-11-28', 'BALIKPAPAN', 'SAMARINDA SEBERANG', 'laki-laki', '0821 3963 7760', 'Bagussatrya2898@gmail.com', '-', 'KIRIMAN', 'XL', 'WAKIL KETUA MUDA/I', 'MAHASISWA', '2018-06-30 04:22:06', '2018-06-30 04:22:06'),
(9, 'IRVAN JAENUDIN', 8, '1998-05-28', 'BITUNG', 'SAMARINDA SEBERANG', 'laki-laki', '-', '-', '-', 'KIRIMAN', 'L', 'MUBALLIGH TUGASAN', 'MUBALLIGH TUGASAN', '2018-06-30 04:22:06', '2018-06-30 04:22:06'),
(10, 'ADAM AGUNG NUGROHO', 8, '1997-10-08', 'SAMARINDA', 'SAMARINDA SEBERANG', 'laki-laki', '0813 4745 5353', 'Adam.agung.nugroho@gmail.com', '-', 'KIRIMAN', 'XL', 'KETUA MUDA/I', 'MAHASISWA', '2018-06-30 04:22:06', '2018-06-30 04:22:06'),
(11, 'RIAN AZANNOVA', 26, '1994-05-07', 'SAMARINDA', 'SAMARINDA ULU', 'laki-laki', '0812 5050 0031', 'rianazannova@yahoo.com', '-', 'KIRIMAN', 'M', 'KETUA MUDA/I', 'MAHASISWA', '2018-06-30 04:22:06', '2018-06-30 04:22:06'),
(12, 'QORI RIA PERTIWI', 21, '1996-08-04', 'SAMARINDA', 'SAMBUTAN', 'perempuan', '0852 5734 8749', '-', '-', 'KIRIMAN', 'L', 'KEPUTRIAN KELOMPOK', 'MUBALLIGH SETEMPAT', '2018-06-30 04:22:06', '2018-06-30 04:22:06'),
(13, 'MUHAMMAD RAMZY', 15, '2003-06-08', 'MUARA BADAK', 'SAMARINDA ILIR', 'laki-laki', '-', '-', '-', 'KIRIMAN', 'M', '-', 'PELAJAR', '2018-06-30 04:22:07', '2018-06-30 04:22:07'),
(14, 'MUHAMMAD IDHAM ALGHIFARI', 15, '2003-03-15', 'MUARA BADAK', 'SAMARINDA ILIR', 'laki-laki', '-', '-', '-', 'KIRIMAN', 'M', '-', 'PELAJAR', '2018-06-30 04:22:07', '2018-06-30 04:22:07'),
(15, 'FIRMAN', 13, '1987-11-12', 'SAMARINDA', 'SAMARINDA SEBERANG', 'laki-laki', '0857 8586 8289', '-', '-', 'KIRIMAN', 'M', 'WAKIL KETUA MUDA/I', 'MUBALLIGH SETEMPAT', '2018-06-30 04:22:07', '2018-06-30 04:22:07'),
(16, 'ARIS WIBOWO', 13, '1994-05-29', 'PALEMBANG ', 'SAMARINDA SEBERANG', 'laki-laki', '0823 5187 2854', '-', '-', 'KIRIMAN', 'L', 'KETUA MUDA/I ', 'MUBALLIGH SETEMPAT', '2018-06-30 04:22:07', '2018-06-30 04:22:07'),
(17, 'RICHA HANIFA FILLA', 15, '1999-07-05', 'MUARA BADAK', 'SAMARINDA ILIR', 'perempuan', '-', '-', '-', 'KIRIMAN', 'L', '-', 'PELAJAR', '2018-06-30 04:22:07', '2018-06-30 04:22:07'),
(18, 'MUHAMMAD SHODIQIN', 13, '1999-09-28', 'SUKA RAJA 3', 'SAMARINDA SEBERANG', 'laki-laki', '0813 5069 0009', '--', '-', 'KIRIMAN', 'M', '-', 'MUBALLIGH TUGASAN', '2018-06-30 04:22:07', '2018-06-30 04:22:07'),
(19, 'TIARA IZZA NAFILA', 15, '2000-07-12', 'BANDUNG', 'SAMARINDA ILIR', 'perempuan', '-', '-', '-', 'KIRIMAN', 'M', 'TIM KEPUTRIAN', 'PELAJAR', '2018-06-30 04:22:07', '2018-06-30 04:22:07'),
(20, 'MUHSIN RUSDIYANTO', 28, '1994-10-12', 'JAMBI', 'SAMARINDA ULU', 'laki-laki', '0823 0710 4354', 'Tsholihanhuda@gmail.com', '-', 'KIRIMAN', 'L', 'MT', 'MUBALLIGH TUGASAN', '2018-06-30 04:22:07', '2018-06-30 04:22:07'),
(21, 'ABDUL MALIK', 16, '1996-12-17', 'SIDODADI RAMUNIA', 'SAMARINDA SEBERANG', 'laki-laki', '0815 5422 1634', 'abdulmalik427@ymail.com', '-', 'KIRIMAN', 'M', 'MUBALLIGH TUGASAN', 'MUBALLIGH TUGASAN', '2018-06-30 04:22:07', '2018-06-30 04:22:07'),
(22, 'CAHYO WIDODO', 16, '1991-03-13', 'SAMARINDA', 'SAMARINDA SEBERANG', 'laki-laki', '0852 3358 0147', 'cahyowidodo5124k@gmail.com', '-', 'KIRIMAN', 'L', 'TIM IT', 'PEGAWAI HONORER', '2018-06-30 04:22:07', '2018-06-30 04:22:07'),
(23, 'RADEN BAGUS WIJAYA KESUMA', 28, '2001-12-10', 'SAMARINDA', 'SAMARINDA ULU', 'laki-laki', '0831 4001 1616', 'radenbagus487@gmail.com', '-', 'KIRIMAN', 'M', 'ROQYAH', 'PELAJAR', '2018-06-30 04:22:07', '2018-06-30 04:22:07'),
(24, 'RIDWAN DWI PUTRA', 7, '2001-04-07', 'SAMARINDA', 'SAMARINDA ILIR', 'laki-laki', '0831 4019 7145', 'yahya3131@gmail.com', '-', 'KIRIMAN', 'L', 'SEKSI OLAHRAGA', 'PELAJAR', '2018-06-30 04:22:07', '2018-06-30 04:22:07'),
(25, 'ABDUH ALDIN ABID ROBBANI', 7, '2000-11-24', 'SAMARINDA', 'SAMARINDA ILIR', 'laki-laki', '0823 5044 1904', 'crusherXT99@gmail.com', '-', 'KIRIMAN', 'M', 'PENEROBOS', 'PELAJAR', '2018-06-30 04:22:07', '2018-06-30 04:22:07'),
(26, 'NIKMAJ MAISYI RODZIAH', 1, '1997-07-02', 'SAMARINDA', 'SAMARINDA ULU', 'perempuan', '-', '-', '', 'KIRIMAN', 'XL', '-', 'MUBALLIGH TUGASAN', '2018-06-30 04:22:07', '2018-06-30 04:22:07'),
(27, 'FAUZI ABDUL MANAN', 1, '1999-09-19', 'SAMARINDA', 'SAMARINDA ULU', 'laki-laki', '-', '-', '', 'KIRIMAN', 'L', '-', 'MUBALLIGH SETEMPAT', '2018-06-30 04:22:07', '2018-06-30 04:22:07'),
(28, 'ADITYA ABDUL FAJAR', 29, '2001-10-16', 'SAMARINDA', 'SAMARINDA ULU', 'laki-laki', '0813 4217 4251', 'aditya1abdul@gmail.com', '', 'KIRIMAN', 'L', 'PENEROBOS PELAJAR', 'PELAJAR', '2018-06-30 04:22:08', '2018-06-30 04:22:08'),
(29, 'PURI AZKA OCTAVIA', 29, '1997-10-19', 'SEMARANG', 'SAMARINDA ULU', 'perempuan', '0815 4803 5361', 'purioctavia354@gmail.com', '', 'KIRIMAN', 'L', 'MT', 'MUBALLIGH TUGASAN', '2018-06-30 04:22:08', '2018-06-30 04:22:08'),
(30, 'SAFULLOH', 29, '1999-08-30', 'ACEH', 'SAMARINDA ULU', 'laki-laki', '0821 1193 8455', 'saifullohaceh@gmail.com', '', 'KIRIMAN', 'L', 'MT', 'MUBALLIGH TUGASAN', '2018-06-30 04:22:08', '2018-06-30 04:22:08'),
(31, 'ANDRI KURNIAWAN', 11, '1996-01-11', 'SERAGEN', 'SAMARINDA SEBERANG', 'laki-laki', '0852 5020 2757', 'andrikurn45@gmail.com', '', 'KIRIMAN', 'L', 'KETUA MUDA/I', 'MUBALLIGH SETEMPAT', '2018-06-30 04:22:08', '2018-06-30 04:22:08'),
(32, 'MAULANA MALIK IBRAHIM', 2, '2000-12-09', 'SAMARINDA', 'SAMBUTAN', 'laki-laki', '0821 5780 3900', 'Wahyu_d95@yahoo.co.id', '', 'KIRIMAN', 'XL', 'WAKIL KETUA', 'BEKERJA', '2018-06-30 04:22:08', '2018-06-30 04:22:08'),
(33, 'MUSTAQIM', 2, '1993-01-06', 'MAKASSAR', 'SAMBUTAN', 'laki-laki', '0821 5780 3900', 'Wahyu_d95@yahoo.co.id', '', 'KIRIMAN', 'M', 'MT', 'MUBALLIGH SETEMPAT', '2018-06-30 04:22:08', '2018-06-30 04:22:08'),
(34, 'SAHRUL', 2, '1997-06-06', 'TANJUNG SANTAN', 'SAMBUTAN', 'laki-laki', '0821 5780 3900', 'Wahyu_d95@yahoo.co.id', '', 'KIRIMAN', 'XL', 'KETUA MUDA MUDI', 'MAHASISWA', '2018-06-30 04:22:08', '2018-06-30 04:22:08'),
(35, 'MUHAMMAD YUSUF ASYIFA\'G', 7, '1998-12-31', 'PARE', 'SAMARINDA ILIR', 'laki-laki', '0821 5465 1347', 'yahya3131@gmail.com', '', 'KIRIMAN', 'L', 'MUBALIGH TUGASAN', 'MUBALLIGH TUGASAN', '2018-06-30 04:22:08', '2018-06-30 04:22:08'),
(36, 'CINDI FITRIA NISAUL KHASANAH', 14, '2000-01-17', 'DEMAK', 'SAMARINDA ILIR', 'perempuan', '0855 4667 3009', 'cindifitria17@gmail.com', '', 'KIRIMAN', 'L', '-', 'MUBALLIGH SETEMPAT', '2018-06-30 04:22:08', '2018-06-30 04:22:08'),
(37, 'RAHMATUL ISTUNING AZIZAH', 14, '1998-10-03', 'BATAM', 'SAMARINDA ILIR', 'perempuan', '0813 4749 1095', 'rahmatulistuning@gmail.com', '', 'KIRIMAN', 'XL', 'BENDAHARA', 'MAHASISWA', '2018-06-30 04:22:08', '2018-06-30 04:22:08'),
(38, 'LATIFAH USWATUN KHASANAH', 5, '1997-07-01', 'SAMARINDA', 'SAMARINDA ILIR', 'perempuan', '0852 4667 9830', 'latifah.khasanah7@gmail.com', '', 'KIRIMAN', 'XL', 'PENEROBOS MUDA/I', 'MUBALLIGH SETEMPAT', '2018-06-30 04:22:08', '2018-06-30 04:22:08'),
(39, 'AHMAD YUSUF', 5, '1993-07-02', 'LAMPUNG', 'SAMARINDA ILIR', 'laki-laki', '0857 3251 1354', 'akhmadyusufaja@gmail.com', '', 'KIRIMAN', 'M', 'KETUA MUDA/I', 'MUBALLIGH SETEMPAT', '2018-06-30 04:22:08', '2018-06-30 04:22:08'),
(40, 'AYU DINIA BELADINI', 5, '1996-12-28', 'SAMARINDA', 'SAMARINDA ILIR', 'perempuan', '0853 8757 8192', 'ayudiniabeladina@gmail.com', '', 'KIRIMAN', 'L', '-', 'MAHASISWA', '2018-06-30 04:22:09', '2018-06-30 04:22:09'),
(41, 'KHOIRUN NISA', 1, '1998-03-17', 'SAMARINDA', 'SAMARINDA ULU', 'perempuan', '-', '-', '', 'KIRIMAN', 'L', '-', 'MUBALLIGH SETEMPAT', '2018-06-30 04:22:09', '2018-06-30 04:22:09'),
(42, 'LATIFA NUR ISNAINI ', 11, '2003-12-22', 'BALIKPAPAN', 'SAMARINDA SEBERANG', 'perempuan', '-', '-', '', 'KIRIMAN', 'XL', '-', 'PELAJAR', '2018-06-30 04:22:09', '2018-06-30 04:22:09'),
(43, 'ARIF ROMADHON', 11, '1999-01-02', 'BANJAR NEGARA ', 'SAMARINDA SEBERANG', 'laki-laki', '0857 3325 8575', '-', '', 'PERSON', 'L', 'MT', 'MUBALLIGH TUGASAN', '2018-06-30 04:22:09', '2018-06-30 04:22:09'),
(44, 'SAIDAH AYU ASRIE AWALINE', 11, '2002-01-16', 'SERAGEN', 'SAMARINDA SEBERANG', 'perempuan', '0853 5050 7338', 'Asrieawalinenei@gmail.com', '', 'PERSON', 'XL', 'KEPUTRIAN ', 'PELAJAR', '2018-06-30 04:22:09', '2018-06-30 04:22:09'),
(45, 'LULUK ROYHAN', 14, '1999-04-13', 'JAKARTA', 'SAMARINDA ILIR', 'perempuan', '0852 5000 6099', 'luluk_royhan88@yahoo.com', '', 'KIRIMAN', 'XL', '-', 'MUBALLIGH TUGASAN', '2018-06-30 04:22:09', '2018-06-30 04:22:09'),
(46, 'ALMAI BARIDA', 26, '2001-08-15', 'SAMARINDA', 'SAMARINDA ULU', 'perempuan', '0813 5059 9816', 'almaibarida123@gmail.com', '', 'KIRIMAN', 'L', 'TIM DOCUMENTASI DESA', 'PELAJAR', '2018-06-30 04:22:09', '2018-06-30 04:22:09'),
(47, 'QOONITHA MIFTAHUL JANNAH', 26, '2001-11-07', 'SAMARINDA', 'SAMARINDA ULU', 'perempuan', '0853 4781 2267', 'qoonithamj@gmail.com', '', 'KIRIMAN', 'XL', 'KOOR. KEPUTRIAN DESA', 'MAHASISWA', '2018-06-30 04:22:09', '2018-06-30 04:22:09'),
(48, 'RESTY RAFIKA SANDY', 26, '1995-12-23', 'SAMARINDA', 'SAMARINDA ULU', 'perempuan', '0812 5838 4559', 'restysandy95@gmail.com', '', 'KIRIMAN', 'L', 'KEPUTRIAN KELOMPOK', 'MUBALLIGH SETEMPAT', '2018-06-30 04:22:09', '2018-06-30 04:22:09'),
(49, 'ANDIKA BAYU MANDALA', 28, '1997-07-28', 'MADIUN', 'SAMARINDA ULU', 'laki-laki', '0821 4914 0802', 'abmmaki2807@yahoo.com', '', 'KIRIMAN', 'M', 'BENDAHARA', 'MAHASISWA', '2018-06-30 04:22:09', '2018-06-30 04:22:09'),
(50, 'GADING DWI NUR HAYATI', 27, '1994-10-27', 'SAMARINDA', 'SAMARINDA ILIR', 'perempuan', '0823 3046 6423', 'gadingdn7@gmail.com', '', 'KIRIMAN', 'M', 'KEPUTRIAN DAERAH DAN SEKRETARIS MUMI KELOMPOK', 'MUBALLIGH TUGASAN', '2018-06-30 04:22:09', '2018-06-30 04:22:09'),
(51, 'MUHAMMAD NURLI', 25, '1996-10-19', 'SAMARINDA', 'SAMBUTAN', 'laki-laki', '0812 3280 1896', 'nurlijokam354@gmail.com', '', 'KIRIMAN', 'L', 'MT', 'MUBALLIGH TUGASAN', '2018-06-30 04:22:09', '2018-06-30 04:22:09'),
(52, 'MUHAMMAD YUSUF EFENDI', 25, '1996-08-21', 'SAMARINDA', 'SAMBUTAN', 'laki-laki', '0823 3511 1285', 'yusufefendi9621@gmail.com', '', 'KIRIMAN', 'L', 'PENEROBOS DESA', 'MUBALLIGH SETEMPAT', '2018-06-30 04:22:09', '2018-06-30 04:22:09'),
(53, 'NAJIB ASALABI', 6, '2018-06-12', 'JAKARTA', 'SAMARINDA ILIR', 'laki-laki', '0856 0116 2641', '-', '', 'KIRIMAN', 'M', 'MT', 'MUBALLIGH TUGASAN', '2018-06-30 04:22:09', '2018-06-30 04:22:09'),
(54, 'VENNA REVILDA VIENTY', 6, '1999-08-26', 'SAMARINDA', 'SAMARINDA ILIR', 'perempuan', '0831 4018 2650', 'Vientyvennarevilda@gmail.com', '', 'KIRIMAN', 'L', 'KU', 'PELAJAR', '2018-06-30 04:22:10', '2018-06-30 04:22:10'),
(55, 'IMAS MAZDHATUL KHUSNA', 6, '1998-11-11', 'SAMARINDA', 'SAMARINDA ILIR', 'perempuan', '0823 5868 2221', 'Imasazna@gmail.com', '', 'KIRIMAN', 'M', 'MT', 'MUBALLIGH TUGASAN', '2018-06-30 04:22:10', '2018-06-30 04:22:10'),
(56, 'RISNA ZUYYINA', 6, '1997-05-05', 'LAMONGAN', 'SAMARINDA ILIR', 'perempuan', '0852 1589 5080', 'Zuyyinarisna@gmail.com', '', 'KIRIMAN', 'XL', 'KEPUTRIAN DAERAH', 'MAHASISWA', '2018-06-30 04:22:10', '2018-06-30 04:22:10'),
(57, 'BIMA IZZA PRAMUDYA', 6, '2004-02-02', 'KEDIRI', 'SAMARINDA ILIR', 'laki-laki', '-', '-', '', 'KIRIMAN', 'M', 'PENEROBOS MUDA-MUDI KELOMPOK', 'PELAJAR', '2018-06-30 04:22:10', '2018-06-30 04:22:10'),
(58, 'ROSITA', 22, '1996-08-18', 'SAMARINDA', 'SAMARINDA SEBERANG', 'perempuan', '0856 5083 6651', 'Rositawati@gmail.com', '', 'KIRIMAN', 'L', 'MT', 'MUBALLIGH TUGASAN', '2018-06-30 04:22:10', '2018-06-30 04:22:10'),
(59, 'FAUZI ANDILLAH', 5, '1996-03-12', 'TANJUNG PANDAN', 'SAMARINDA ILIR', 'laki-laki', '0812 3906 4282', '-', '', 'KIRIMAN', 'L', '-', 'MUBALLIGH TUGASAN', '2018-06-30 04:22:10', '2018-06-30 04:22:10'),
(60, 'ZAKI SABTA MAULANA', 4, '1999-01-01', 'LAMPUNG', 'SAMARINDA ULU', 'laki-laki', '0816 4945 6143', 'TIDAK', '', 'KIRIMAN', 'XL', 'MT', 'MUBALLIGH TUGASAN', '2018-06-30 04:22:10', '2018-06-30 04:22:10'),
(61, 'GAGAS PRAYUDA BAKTI', 12, '1997-04-15', 'GARUT', 'SAMBUTAN', 'laki-laki', '0821 9847 6933', 'Gagaspb@yahoo.co.id', '', 'KIRIMAN', 'L', 'MT', 'MUBALLIGH TUGASAN', '2018-06-30 04:22:10', '2018-06-30 04:22:10'),
(62, 'HASAN ABDI ', 4, '1990-02-13', 'SAMARINDA ', 'SAMARINDA ULU', 'laki-laki', '0857 0888 2227', 'hasan.limid@gmail.com', '', 'KIRIMAN', 'XL', 'KETUA MUDA/I KELOMPOK', 'SARJANA & MUBALLIGH', '2018-06-30 04:22:10', '2018-06-30 04:22:10'),
(63, 'M.ROYAN PRADANA', 12, '2002-04-24', 'SAMARINDA', 'SAMBUTAN', 'laki-laki', '0822 5536 6083', 'royan.pradana@gmail.com', '', 'KIRIMAN', 'XXL', 'PENEROBOS', 'PELAJAR', '2018-06-30 04:22:10', '2018-06-30 04:22:10'),
(64, 'BUMBUNG TEGAR RAPIDANI PUTRA', 12, '1999-11-30', 'SAMARINDA', 'SAMBUTAN', 'laki-laki', '0858 6611 2274', 'Btrdp28@gmail.com', '', 'KIRIMAN', 'L', 'MUDA-MUDI', 'PELAJAR', '2018-06-30 04:22:10', '2018-06-30 04:22:10'),
(65, 'M. GARIN NUGROHO', 9, '2000-04-21', 'SAMARINDA', 'SAMARINDA ULU', 'laki-laki', '-', 'garin0420@gmail.com', '', 'KIRIMAN', 'S', '-', 'MUBALLIGH SETEMPAT', '2018-06-30 04:22:10', '2018-06-30 04:22:10'),
(66, 'ROSITA', 16, '1996-08-18', 'SAMARINDA', 'SAMARINDA SEBERANG', 'perempuan', '0856 5083 6651', 'rositawati@gmail.com', '', 'KIRIMAN', 'L', 'MUBALLIGHOT', 'MUBALLIGH TUGASAN', '2018-06-30 04:22:10', '2018-06-30 04:22:10'),
(67, 'IWAN', 10, NULL, '-', 'SAMARINDA ULU', 'laki-laki', '-', '-', '', 'KIRIMAN', 'L', '-', '-', '2018-06-30 04:22:10', '2018-06-30 04:22:10'),
(68, 'AJENG IMTINAN ROFI\'AH', 10, '1998-11-08', 'UJUNG PANDANG', 'SAMARINDA ULU', 'perempuan', '0812 3342 0902', 'ajengimtinan@gmail.com', '', 'KIRIMAN', 'XXL', 'TIM KEILMUAN', 'MUBALLIGH TUGASAN', '2018-06-30 04:22:10', '2018-06-30 04:22:10'),
(69, 'SONIA TAMALA SHELA', 10, '1999-11-07', 'SAKA JAYA', 'SAMARINDA ULU', 'perempuan', '0878 4207 7352', 'soniatamalashela07@gmail.com', '', 'KIRIMAN', 'M', 'TIM KEILMUAN', 'MUBALLIGH TUGASAN', '2018-06-30 04:22:10', '2018-06-30 04:22:10'),
(70, 'RIMA NOVITA KUSUMA NINGRUM', 10, '1999-11-18', 'SAMARINDA', 'SAMARINDA ULU', 'perempuan', '0852 4836 6064', 'rimanovita1811@gmail.com', '', 'KIRIMAN', 'Double L', 'BENDAHARA', 'MAHASISWA', '2018-06-30 04:22:10', '2018-06-30 04:22:10'),
(71, 'RIDWAN', 9, '1998-09-30', 'SAMARINDA', 'SAMARINDA ULU', 'laki-laki', '0852 5038 8643', '-', '', 'KIRIMAN', 'L', 'TIM KEILMUAN', 'MUBALLIGH TUGASAN', '2018-06-30 04:22:10', '2018-06-30 04:22:10'),
(72, 'MELINDA ARIS DWIYANTI', 10, '1998-05-27', 'SAMARINDA', 'SAMARINDA ULU', 'perempuan', '852 5181 8284', 'melindaarnis07@gmail.com', '', 'KIRIMAN', 'L', 'BENDAHARA MUMI KELOMPOK', 'MAHASISWA', '2018-06-30 04:22:10', '2018-06-30 04:22:10'),
(73, 'ANITA PUSPITASARI', 28, '1997-10-11', 'BEKASI', 'SAMARINDA ULU', 'perempuan', '0857 1710 2128', 'Anitapuspita644@gmail.com', '', 'PERSON', 'XL', 'MT', 'MUBALLIGH TUGASAN', '2018-06-30 04:22:10', '2018-06-30 04:22:10'),
(74, 'AMIN', 30, '2018-06-21', '-', 'SAMARINDA ILIR', 'laki-laki', '-', '-', '', 'KIRIMAN', 'L', 'MT', 'MUBALLIGH TUGASAN', '2018-06-30 04:22:10', '2018-06-30 04:22:10'),
(75, 'YUSUF', 30, '2018-06-21', '-', 'SAMARINDA ILIR', 'laki-laki', '-', '-', '', 'KIRIMAN', 'L', 'KETUA MUDA-MUDI', '-', '2018-06-30 04:22:10', '2018-06-30 04:22:10'),
(76, 'M. REZA', 30, '2018-06-21', '-', 'SAMARINDA ILIR', 'laki-laki', '-', '-', '', 'KIRIMAN', 'L', '-', '-', '2018-06-30 04:22:10', '2018-06-30 04:22:10'),
(77, 'RAHMAT EFENDI', 27, '1993-12-28', 'BERAU', 'SAMARINDA ILIR', 'laki-laki', '0822 5574 3815', 'rhmtefendi28@gmail.com', '', 'KIRIMAN', 'M', 'WAKIL KETUA MUMI', 'MUBALLIGH SETEMPAT', '2018-06-30 04:22:10', '2018-06-30 04:22:10'),
(78, 'ADAM BARORRI', 27, '1997-10-03', 'SAMARINDA', 'SAMARINDA ILIR', 'laki-laki', '0813 1260 3334', 'Adambarori03@gmail.com', '', 'PERSON', 'XL', 'WAKIL MUDA/I', 'MUBALLIGH SETEMPAT', '2018-06-30 04:22:10', '2018-06-30 04:22:10'),
(79, 'MUH ROIHAN', 27, '1998-06-14', 'KOWIOHA', 'SAMARINDA ILIR', 'laki-laki', '0822 5291 9846', 'Muhammad. Roihan@gmail.com', '', 'KIRIMAN', 'M', 'MT', 'MUBALLIGH TUGASAN', '2018-06-30 04:22:10', '2018-06-30 04:22:10'),
(80, 'MUHAMMAD RIZKY FITRIANSYAH', 25, '1994-07-10', 'SAMARINDA', 'SAMBUTAN', 'laki-laki', '0813 8902 7737', 'rezky.mochi@gmail.com', '', 'KIRIMAN', 'L', 'MT', 'MUBALLIGH SETEMPAT', '2018-06-30 04:22:11', '2018-06-30 04:22:11'),
(81, 'ELHAM ALVI WIJAYA', 4, '2002-04-06', 'SAMARINDA', 'SAMARINDA ULU', 'laki-laki', '-', '-', '', 'KIRIMAN', 'L', 'WAKIL MUMI KELOMPOK', 'PELAJAR', '2018-06-30 04:22:11', '2018-06-30 04:22:11'),
(82, 'ROYAN HIDAYATULLAH', 11, '2003-01-15', 'LOA DURI', 'SAMARINDA SEBERANG', 'laki-laki', '0857 5375 0206', '-', '', 'PERSON', 'L', '-', 'PELAJAR', '2018-06-30 04:22:11', '2018-06-30 04:22:11'),
(83, 'DINAR TARATIH WULANDARI', 7, '2004-05-05', 'JOMBANG', 'SAMARINDA ILIR', 'perempuan', '0852 5050 7793', '-', '', 'KIRIMAN', 'M', '-', '-', '2018-06-30 04:22:11', '2018-06-30 04:22:11'),
(84, 'ABDUL MANAN', 23, NULL, '-', '-', '-', '-', '-', '', '-', '-', '-', '-', '2018-06-30 04:22:11', '2018-06-30 04:22:11'),
(85, 'ABDULLAH FURQON A.', 23, NULL, '-', '-', '-', '-', '-', '', '-', '-', '-', '-', '2018-06-30 04:22:11', '2018-06-30 04:22:11'),
(86, 'ADI SETIAWAN', 23, NULL, '-', '-', '-', '-', '-', '', '-', '-', '-', '-', '2018-06-30 04:22:11', '2018-06-30 04:22:11'),
(87, 'AIZZAH MAYLA NUR BAITY', 23, NULL, '-', '-', '-', '-', '-', '', '-', '-', '-', '-', '2018-06-30 04:22:11', '2018-06-30 04:22:11'),
(88, 'ALUNG SETYO UTOMO', 23, NULL, '-', '-', '-', '-', '-', '', '-', '-', '-', '-', '2018-06-30 04:22:11', '2018-06-30 04:22:11'),
(89, 'AMANDA ZULFALAH', 23, NULL, '-', '-', '-', '-', '-', '', '-', '-', '-', '-', '2018-06-30 04:22:11', '2018-06-30 04:22:11'),
(90, 'ANSHORUDDIN ABDILLAH', 23, NULL, '-', '-', '-', '-', '-', '', '-', '-', '-', '-', '2018-06-30 04:22:11', '2018-06-30 04:22:11'),
(91, 'BAGAS AHMIL NURFALAH', 23, NULL, '-', '-', '-', '-', '-', '', '-', '-', '-', '-', '2018-06-30 04:22:11', '2018-06-30 04:22:11'),
(92, 'BIMA SETIYAWAN', 23, NULL, '-', '-', '-', '-', '-', '', '-', '-', '-', '-', '2018-06-30 04:22:11', '2018-06-30 04:22:11'),
(93, 'BUNYANU LINUWIH', 23, NULL, '-', '-', '-', '-', '-', '', '-', '-', '-', '-', '2018-06-30 04:22:11', '2018-06-30 04:22:11'),
(94, 'DEWI NUR FADILLAH', 23, NULL, '-', '-', '-', '-', '-', '', '-', '-', '-', '-', '2018-06-30 04:22:11', '2018-06-30 04:22:11'),
(95, 'EKA RAHMAWATI', 23, NULL, '-', '-', '-', '-', '-', '', '-', '-', '-', '-', '2018-06-30 04:22:11', '2018-06-30 04:22:11'),
(96, 'FAZA FIRDAYANTI', 23, NULL, '-', '-', '-', '-', '-', '', '-', '-', '-', '-', '2018-06-30 04:22:11', '2018-06-30 04:22:11'),
(97, 'HELMALIA PUTRI SYAIFFUDDIN', 23, NULL, '-', '-', '-', '-', '-', '', '-', '-', '-', '-', '2018-06-30 04:22:11', '2018-06-30 04:22:11'),
(98, 'IKLASUL AMAL', 23, NULL, '-', '-', '-', '-', '-', '', '-', '-', '-', '-', '2018-06-30 04:22:11', '2018-06-30 04:22:11'),
(99, 'IRVAN ANDHY M.', 23, NULL, '-', '-', '-', '-', '-', '', '-', '-', '-', '-', '2018-06-30 04:22:11', '2018-06-30 04:22:11'),
(100, 'LIA SAFITRI', 23, NULL, '-', '-', '-', '-', '-', '', '-', '-', '-', '-', '2018-06-30 04:22:11', '2018-06-30 04:22:11'),
(101, 'M. ABDUL MAJID', 23, NULL, '-', '-', '-', '-', '-', '', '-', '-', '-', '-', '2018-06-30 04:22:11', '2018-06-30 04:22:11'),
(102, 'M. HAFID', 23, NULL, '-', '-', '-', '-', '-', '', '-', '-', '-', '-', '2018-06-30 04:22:11', '2018-06-30 04:22:11'),
(103, 'M. INDRA MAULANA', 23, NULL, '-', '-', '-', '-', '-', '', '-', '-', '-', '-', '2018-06-30 04:22:11', '2018-06-30 04:22:11'),
(104, 'M. NUR HASAN W.', 23, NULL, '-', '-', '-', '-', '-', '', '-', '-', '-', '-', '2018-06-30 04:22:11', '2018-06-30 04:22:11'),
(105, 'M. RIDHO', 23, NULL, '-', '-', '-', '-', '-', '', '-', '-', '-', '-', '2018-06-30 04:22:11', '2018-06-30 04:22:11'),
(106, 'M. RIZKY FAJAR', 23, NULL, '-', '-', '-', '-', '-', '', '-', '-', '-', '-', '2018-06-30 04:22:11', '2018-06-30 04:22:11'),
(107, 'MULYADI ACHMAD', 23, NULL, '-', '-', '-', '-', '-', '', '-', '-', '-', '-', '2018-06-30 04:22:12', '2018-06-30 04:22:12'),
(108, 'PUPUT SRI HARTANTI', 23, NULL, '-', '-', '-', '-', '-', '', '-', '-', '-', '-', '2018-06-30 04:22:12', '2018-06-30 04:22:12'),
(109, 'PUTRI AULIA SHOLIHAH', 23, NULL, '-', '-', '-', '-', '-', '', '-', '-', '-', '-', '2018-06-30 04:22:12', '2018-06-30 04:22:12'),
(110, 'PUTRI SOFIANTI', 23, NULL, '-', '-', '-', '-', '-', '', '-', '-', '-', '-', '2018-06-30 04:22:12', '2018-06-30 04:22:12'),
(111, 'RIO WAHYU FERDIANSYAH', 23, NULL, '-', '-', '-', '-', '-', '', '-', '-', '-', '-', '2018-06-30 04:22:12', '2018-06-30 04:22:12'),
(112, 'SITI SUBHIYATI', 23, NULL, '-', '-', '-', '-', '-', '', '-', '-', '-', '-', '2018-06-30 04:22:12', '2018-06-30 04:22:12'),
(113, 'THORIQUL NURJANNAH', 23, NULL, '-', '-', '-', '-', '-', '', '-', '-', '-', '-', '2018-06-30 04:22:12', '2018-06-30 04:22:12'),
(114, 'TRIADEVI MUTIARA HADI', 23, NULL, '-', '-', '-', '-', '-', '', '-', '-', '-', '-', '2018-06-30 04:22:12', '2018-06-30 04:22:12'),
(115, 'UMI HANIK FIFI NAHARIN', 23, NULL, '-', '-', '-', '-', '-', '', '-', '-', '-', '-', '2018-06-30 04:22:12', '2018-06-30 04:22:12'),
(116, 'ZULFA NISA ROHMAH', 23, NULL, '-', '-', '-', '-', '-', '', '-', '-', '-', '-', '2018-06-30 04:22:12', '2018-06-30 04:22:12'),
(117, 'WILDAN IRSAT NURDIN', 23, NULL, '-', '-', '-', '-', '-', '', '-', '-', '-', '-', '2018-06-30 04:22:12', '2018-06-30 04:22:12'),
(118, 'AL MUARIFAH', 23, NULL, '-', '-', '-', '-', '-', '', '-', '-', '-', '-', '2018-06-30 04:22:12', '2018-06-30 04:22:12'),
(119, 'AMELIA CANDRA SARI', 23, NULL, '-', '-', '-', '-', '-', '', '-', '-', '-', '-', '2018-06-30 04:22:12', '2018-06-30 04:22:12'),
(120, 'ANISA KHOIRIYANI', 23, NULL, '-', '-', '-', '-', '-', '', '-', '-', '-', '-', '2018-06-30 04:22:12', '2018-06-30 04:22:12'),
(121, 'ARIS DA PRASTIYO', 23, NULL, '-', '-', '-', '-', '-', '', '-', '-', '-', '-', '2018-06-30 04:22:12', '2018-06-30 04:22:12'),
(122, 'CHOIRIA NURUL AZIZAH', 23, NULL, '-', '-', '-', '-', '-', '', '-', '-', '-', '-', '2018-06-30 04:22:12', '2018-06-30 04:22:12'),
(123, 'DHEVANDRA RICKY PUTRA P', 23, NULL, '-', '-', '-', '-', '-', '', '-', '-', '-', '-', '2018-06-30 04:22:12', '2018-06-30 04:22:12'),
(124, 'DIAN ANGGRIANI', 23, NULL, '-', '-', '-', '-', '-', '', '-', '-', '-', '-', '2018-06-30 04:22:12', '2018-06-30 04:22:12'),
(125, 'LULU LIKAYANITA', 23, NULL, '-', '-', '-', '-', '-', '', '-', '-', '-', '-', '2018-06-30 04:22:12', '2018-06-30 04:22:12'),
(126, 'M. PUTRA ANDRIANTO', 23, NULL, '-', '-', '-', '-', '-', '', '-', '-', '-', '-', '2018-06-30 04:22:12', '2018-06-30 04:22:12'),
(127, 'M. RIDUAN', 23, NULL, '-', '-', '-', '-', '-', '', '-', '-', '-', '-', '2018-06-30 04:22:12', '2018-06-30 04:22:12'),
(128, 'M. SANDI PUTRA SAIDI', 23, NULL, '-', '-', '-', '-', '-', '', '-', '-', '-', '-', '2018-06-30 04:22:12', '2018-06-30 04:22:12'),
(129, 'MELLRISTA RAMDANA', 23, NULL, '-', '-', '-', '-', '-', '', '-', '-', '-', '-', '2018-06-30 04:22:12', '2018-06-30 04:22:12'),
(130, 'NINNA NUR ANNISA', 23, NULL, '-', '-', '-', '-', '-', '', '-', '-', '-', '-', '2018-06-30 04:22:12', '2018-06-30 04:22:12'),
(131, 'NURUL ANNISA', 23, NULL, '-', '-', '-', '-', '-', '', '-', '-', '-', '-', '2018-06-30 04:22:12', '2018-06-30 04:22:12'),
(132, 'RINI MISTIASARI', 23, NULL, '-', '-', '-', '-', '-', '', '-', '-', '-', '-', '2018-06-30 04:22:12', '2018-06-30 04:22:12'),
(133, 'RIZKIA RAMADANTI', 23, NULL, '-', '-', '-', '-', '-', '', '-', '-', '-', '-', '2018-06-30 04:22:12', '2018-06-30 04:22:12'),
(134, 'SITI MURNI NURHASANAH', 23, NULL, '-', '-', '-', '-', '-', '', '-', '-', '-', '-', '2018-06-30 04:22:12', '2018-06-30 04:22:12'),
(135, 'VITA ARDIANA', 23, NULL, '-', '-', '-', '-', '-', '', '-', '-', '-', '-', '2018-06-30 04:22:13', '2018-06-30 04:22:13'),
(136, 'YUNAN ABIMANYU', 23, NULL, '-', '-', '-', '-', '-', '', '-', '-', '-', '-', '2018-06-30 04:22:13', '2018-06-30 04:22:13'),
(137, 'YOGI BERLIAWAN', 23, NULL, '-', '-', '-', '-', '-', '', '-', '-', '-', '-', '2018-06-30 04:22:13', '2018-06-30 04:22:13'),
(138, 'ASYFI HANA RAHMA S', 23, NULL, '-', '-', '-', '-', '-', '', '-', '-', '-', '-', '2018-06-30 04:22:13', '2018-06-30 04:22:13'),
(139, 'ADAM PRIMA HARUM', 23, NULL, '-', '-', '-', '-', '-', '', '-', '-', '-', '-', '2018-06-30 04:22:13', '2018-06-30 04:22:13'),
(140, 'AGUS DARMANSYAH', 23, NULL, '-', '-', '-', '-', '-', '', '-', '-', '-', '-', '2018-06-30 04:22:13', '2018-06-30 04:22:13'),
(141, 'AJI FAHMI PAKUBUMI', 23, NULL, '-', '-', '-', '-', '-', '', '-', '-', '-', '-', '2018-06-30 04:22:13', '2018-06-30 04:22:13'),
(142, 'AKIF AL GHIFARI ROBBANI', 23, NULL, '-', '-', '-', '-', '-', '', '-', '-', '-', '-', '2018-06-30 04:22:13', '2018-06-30 04:22:13'),
(143, 'ALDI AL UBAIDAH', 23, NULL, '-', '-', '-', '-', '-', '', '-', '-', '-', '-', '2018-06-30 04:22:13', '2018-06-30 04:22:13'),
(144, 'ARYA IKHWANUN SHOLIH', 23, NULL, '-', '-', '-', '-', '-', '', '-', '-', '-', '-', '2018-06-30 04:22:13', '2018-06-30 04:22:13'),
(145, 'AULIA HADI', 23, NULL, '-', '-', '-', '-', '-', '', '-', '-', '-', '-', '2018-06-30 04:22:13', '2018-06-30 04:22:13'),
(146, 'BAYU ABDI SAPUTRA', 23, NULL, '-', '-', '-', '-', '-', '', '-', '-', '-', '-', '2018-06-30 04:22:13', '2018-06-30 04:22:13'),
(147, 'BENING ANGRAENI', 23, NULL, '-', '-', '-', '-', '-', '', '-', '-', '-', '-', '2018-06-30 04:22:13', '2018-06-30 04:22:13'),
(148, 'DAWUD AHMAD RIDWAN', 23, NULL, '-', '-', '-', '-', '-', '', '-', '-', '-', '-', '2018-06-30 04:22:13', '2018-06-30 04:22:13'),
(149, 'FARIKHA PUTRI SALSABILA', 23, NULL, '-', '-', '-', '-', '-', '', '-', '-', '-', '-', '2018-06-30 04:22:13', '2018-06-30 04:22:13'),
(150, 'FENDI NURDIANZAH', 23, NULL, '-', '-', '-', '-', '-', '', '-', '-', '-', '-', '2018-06-30 04:22:13', '2018-06-30 04:22:13'),
(151, 'GADING CHEMPAKADEWI', 23, NULL, '-', '-', '-', '-', '-', '', '-', '-', '-', '-', '2018-06-30 04:22:13', '2018-06-30 04:22:13'),
(152, 'GUNAWAN MUHAMAD R.', 23, NULL, '-', '-', '-', '-', '-', '', '-', '-', '-', '-', '2018-06-30 04:22:13', '2018-06-30 04:22:13'),
(153, 'ICA AMALIA HAFITS', 23, NULL, '-', '-', '-', '-', '-', '', '-', '-', '-', '-', '2018-06-30 04:22:13', '2018-06-30 04:22:13'),
(154, 'IRWAN GUNTUR ASADULLOH', 23, NULL, '-', '-', '-', '-', '-', '', '-', '-', '-', '-', '2018-06-30 04:22:13', '2018-06-30 04:22:13'),
(155, 'KAMILA WULANDARI', 23, NULL, '-', '-', '-', '-', '-', '', '-', '-', '-', '-', '2018-06-30 04:22:13', '2018-06-30 04:22:13'),
(156, 'M. ARIEF MAULANA', 23, NULL, '-', '-', '-', '-', '-', '', '-', '-', '-', '-', '2018-06-30 04:22:13', '2018-06-30 04:22:13'),
(157, 'M. ARIP SHODIQIN', 23, NULL, '-', '-', '-', '-', '-', '', '-', '-', '-', '-', '2018-06-30 04:22:13', '2018-06-30 04:22:13'),
(158, 'M. RAMADHANI', 23, NULL, '-', '-', '-', '-', '-', '', '-', '-', '-', '-', '2018-06-30 04:22:13', '2018-06-30 04:22:13'),
(159, 'MOCH REFO HERLAMBANG', 23, NULL, '-', '-', '-', '-', '-', '', '-', '-', '-', '-', '2018-06-30 04:22:13', '2018-06-30 04:22:13'),
(160, 'MUFIDATURRIZQY FADILA', 23, NULL, '-', '-', '-', '-', '-', '', '-', '-', '-', '-', '2018-06-30 04:22:13', '2018-06-30 04:22:13'),
(161, 'NASHRULLOH AL GHIFARI', 23, NULL, '-', '-', '-', '-', '-', '', '-', '-', '-', '-', '2018-06-30 04:22:13', '2018-06-30 04:22:13'),
(162, 'NATASYA DEVA SURYANI', 23, NULL, '-', '-', '-', '-', '-', '', '-', '-', '-', '-', '2018-06-30 04:22:14', '2018-06-30 04:22:14'),
(163, 'NOVANSYA AULIA RAMADHINI', 23, NULL, '-', '-', '-', '-', '-', '', '-', '-', '-', '-', '2018-06-30 04:22:14', '2018-06-30 04:22:14'),
(164, 'NUR SABILA MIFTAKHUL J.', 23, NULL, '-', '-', '-', '-', '-', '', '-', '-', '-', '-', '2018-06-30 04:22:14', '2018-06-30 04:22:14'),
(165, 'RAHMAT HIDAYAT', 23, NULL, '-', '-', '-', '-', '-', '', '-', '-', '-', '-', '2018-06-30 04:22:14', '2018-06-30 04:22:14'),
(166, 'RIDHO KHOIRREZA', 23, NULL, '-', '-', '-', '-', '-', '', '-', '-', '-', '-', '2018-06-30 04:22:14', '2018-06-30 04:22:14'),
(167, 'ROYAN YUSUF REYMADAN', 23, NULL, '-', '-', '-', '-', '-', '', '-', '-', '-', '-', '2018-06-30 04:22:14', '2018-06-30 04:22:14'),
(168, 'SULESTYANING HASTUTI', 23, NULL, '-', '-', '-', '-', '-', '', '-', '-', '-', '-', '2018-06-30 04:22:14', '2018-06-30 04:22:14'),
(169, 'THALITA GINA ALMIRA YURDIKA', 23, NULL, '-', '-', '-', '-', '-', '', '-', '-', '-', '-', '2018-06-30 04:22:14', '2018-06-30 04:22:14'),
(170, 'WINDY FEBRIANY SYUHADA', 23, NULL, '-', '-', '-', '-', '-', '', '-', '-', '-', '-', '2018-06-30 04:22:14', '2018-06-30 04:22:14'),
(171, 'ZAKIYYA NUR KUSUMANINGRUM', 23, NULL, '-', '-', '-', '-', '-', '', '-', '-', '-', '-', '2018-06-30 04:22:14', '2018-06-30 04:22:14'),
(172, 'ANNISA MAULIDINA ALNI', 23, NULL, '-', '-', '-', '-', '-', '', '-', '-', '-', '-', '2018-06-30 04:22:14', '2018-06-30 04:22:14'),
(173, 'ADINA RAHMA', 23, NULL, '-', '-', '-', '-', '-', '', '-', '-', '-', '-', '2018-06-30 04:22:14', '2018-06-30 04:22:14'),
(174, 'AULIA ZAINUN FAKIHA', 23, NULL, '-', '-', '-', '-', '-', '', '-', '-', '-', '-', '2018-06-30 04:22:14', '2018-06-30 04:22:14'),
(175, 'BAGAS RANANDA P', 23, NULL, '-', '-', '-', '-', '-', '', '-', '-', '-', '-', '2018-06-30 04:22:14', '2018-06-30 04:22:14'),
(176, 'DANUR WENDRA Z.', 23, NULL, '-', '-', '-', '-', '-', '', '-', '-', '-', '-', '2018-06-30 04:22:14', '2018-06-30 04:22:14'),
(177, 'EMILYA PUTERI', 23, NULL, '-', '-', '-', '-', '-', '', '-', '-', '-', '-', '2018-06-30 04:22:14', '2018-06-30 04:22:14'),
(178, 'FAIRUS FIRDAUSIA', 23, NULL, '-', '-', '-', '-', '-', '', '-', '-', '-', '-', '2018-06-30 04:22:14', '2018-06-30 04:22:14'),
(179, 'FARADILA USWATUN HASANAH', 23, NULL, '-', '-', '-', '-', '-', '', '-', '-', '-', '-', '2018-06-30 04:22:14', '2018-06-30 04:22:14'),
(180, 'FARIDA TRI M.', 23, NULL, '-', '-', '-', '-', '-', '', '-', '-', '-', '-', '2018-06-30 04:22:14', '2018-06-30 04:22:14'),
(181, 'HASWENDA RASYID', 23, NULL, '-', '-', '-', '-', '-', '', '-', '-', '-', '-', '2018-06-30 04:22:14', '2018-06-30 04:22:14'),
(182, 'INDRI SAFITRI', 23, NULL, '-', '-', '-', '-', '-', '', '-', '-', '-', '-', '2018-06-30 04:22:14', '2018-06-30 04:22:14'),
(183, 'INTAN N MUKHASANATIN', 23, NULL, '-', '-', '-', '-', '-', '', '-', '-', '-', '-', '2018-06-30 04:22:14', '2018-06-30 04:22:14'),
(184, 'KHURIN\'IN SHIFATUL JANNAH', 23, NULL, '-', '-', '-', '-', '-', '', '-', '-', '-', '-', '2018-06-30 04:22:14', '2018-06-30 04:22:14'),
(185, 'M. AZHAR MUBARROQ', 23, NULL, '-', '-', '-', '-', '-', '', '-', '-', '-', '-', '2018-06-30 04:22:14', '2018-06-30 04:22:14'),
(186, 'M. ROFI\' SAPUTRO', 23, NULL, '-', '-', '-', '-', '-', '', '-', '-', '-', '-', '2018-06-30 04:22:14', '2018-06-30 04:22:14'),
(187, 'MIFTAHHUL ROSITA', 23, NULL, '-', '-', '-', '-', '-', '', '-', '-', '-', '-', '2018-06-30 04:22:15', '2018-06-30 04:22:15'),
(188, 'MOCHAMMAD RIFI A.', 23, NULL, '-', '-', '-', '-', '-', '', '-', '-', '-', '-', '2018-06-30 04:22:15', '2018-06-30 04:22:15'),
(189, 'NUR LISA', 23, NULL, '-', '-', '-', '-', '-', '', '-', '-', '-', '-', '2018-06-30 04:22:15', '2018-06-30 04:22:15'),
(190, 'RIKA NUR PADILLA', 23, NULL, '-', '-', '-', '-', '-', '', '-', '-', '-', '-', '2018-06-30 04:22:15', '2018-06-30 04:22:15'),
(191, 'RUSDI SABILA NOOR S.', 23, NULL, '-', '-', '-', '-', '-', '', '-', '-', '-', '-', '2018-06-30 04:22:15', '2018-06-30 04:22:15'),
(192, 'SARAH AYUNINGTYAS', 23, NULL, '-', '-', '-', '-', '-', '', '-', '-', '-', '-', '2018-06-30 04:22:15', '2018-06-30 04:22:15'),
(193, 'SELLA MUTHIAH', 23, NULL, '-', '-', '-', '-', '-', '', '-', '-', '-', '-', '2018-06-30 04:22:15', '2018-06-30 04:22:15'),
(194, 'SHERLI RISMA PANGESTU', 23, NULL, '-', '-', '-', '-', '-', '', '-', '-', '-', '-', '2018-06-30 04:22:15', '2018-06-30 04:22:15'),
(195, 'SILVIA NUR AZMI', 23, NULL, '-', '-', '-', '-', '-', '', '-', '-', '-', '-', '2018-06-30 04:22:15', '2018-06-30 04:22:15'),
(196, 'SORAYA NABILA', 23, NULL, '-', '-', '-', '-', '-', '', '-', '-', '-', '-', '2018-06-30 04:22:15', '2018-06-30 04:22:15'),
(197, 'URISTNA GADIS NIRWANA', 23, NULL, '-', '-', '-', '-', '-', '', '-', '-', '-', '-', '2018-06-30 04:22:15', '2018-06-30 04:22:15'),
(198, 'YUSRIZAL  SAIFUL M.', 23, NULL, '-', '-', '-', '-', '-', '', '-', '-', '-', '-', '2018-06-30 04:22:15', '2018-06-30 04:22:15'),
(199, 'AFRIDA HABIBAH ADINA', 24, NULL, '-', '-', '-', '-', '-', '', '-', '-', '-', '-', '2018-06-30 04:22:15', '2018-06-30 04:22:15'),
(200, 'AINUN TIARANINGTIAS L.', 24, NULL, '-', '-', '-', '-', '-', '', '-', '-', '-', '-', '2018-06-30 04:22:15', '2018-06-30 04:22:15'),
(201, 'APRILLIA AYUWANINGSIH', 24, NULL, '-', '-', '-', '-', '-', '', '-', '-', '-', '-', '2018-06-30 04:22:15', '2018-06-30 04:22:15'),
(202, 'AULIYA RATUNGGA', 24, NULL, '-', '-', '-', '-', '-', '', '-', '-', '-', '-', '2018-06-30 04:22:15', '2018-06-30 04:22:15'),
(203, 'AZKANITA WULIDA H. ', 24, NULL, '-', '-', '-', '-', '-', '', '-', '-', '-', '-', '2018-06-30 04:22:15', '2018-06-30 04:22:15'),
(204, 'CAHYASRI SICHA S. D', 24, NULL, '-', '-', '-', '-', '-', '', '-', '-', '-', '-', '2018-06-30 04:22:15', '2018-06-30 04:22:15'),
(205, 'CAHYASRI SOCHA S. D', 24, NULL, '-', '-', '-', '-', '-', '', '-', '-', '-', '-', '2018-06-30 04:22:15', '2018-06-30 04:22:15'),
(206, 'DESWITA SALSABILA', 24, NULL, '-', '-', '-', '-', '-', '', '-', '-', '-', '-', '2018-06-30 04:22:15', '2018-06-30 04:22:15'),
(207, 'DINI NUR ABIDA AULIA', 24, NULL, '-', '-', '-', '-', '-', '', '-', '-', '-', '-', '2018-06-30 04:22:15', '2018-06-30 04:22:15'),
(208, 'ELIS SEKAR PRATIWI', 24, NULL, '-', '-', '-', '-', '-', '', '-', '-', '-', '-', '2018-06-30 04:22:16', '2018-06-30 04:22:16'),
(209, 'FAHIM NUR AMALIA', 24, NULL, '-', '-', '-', '-', '-', '', '-', '-', '-', '-', '2018-06-30 04:22:16', '2018-06-30 04:22:16'),
(210, 'HANI RAHMAWATI', 24, NULL, '-', '-', '-', '-', '-', '', '-', '-', '-', '-', '2018-06-30 04:22:16', '2018-06-30 04:22:16'),
(211, 'HILYATUL HUSNA', 24, NULL, '-', '-', '-', '-', '-', '', '-', '-', '-', '-', '2018-06-30 04:22:16', '2018-06-30 04:22:16'),
(212, 'IZZATULLAH H. ULYA', 24, NULL, '-', '-', '-', '-', '-', '', '-', '-', '-', '-', '2018-06-30 04:22:16', '2018-06-30 04:22:16'),
(213, 'KARINA AUDI DESI S.', 24, NULL, '-', '-', '-', '-', '-', '', '-', '-', '-', '-', '2018-06-30 04:22:16', '2018-06-30 04:22:16'),
(214, 'KEISHA HAYFA V.', 24, NULL, '-', '-', '-', '-', '-', '', '-', '-', '-', '-', '2018-06-30 04:22:16', '2018-06-30 04:22:16'),
(215, 'NIDA AFIFAH', 24, NULL, '-', '-', '-', '-', '-', '', '-', '-', '-', '-', '2018-06-30 04:22:16', '2018-06-30 04:22:16'),
(216, 'RINI FLORA AGRIPINA C.', 24, NULL, '-', '-', '-', '-', '-', '', '-', '-', '-', '-', '2018-06-30 04:22:16', '2018-06-30 04:22:16'),
(217, 'RIZKI NUR FADILLAH', 24, NULL, '-', '-', '-', '-', '-', '', '-', '-', '-', '-', '2018-06-30 04:22:16', '2018-06-30 04:22:16'),
(218, 'SAIZIAH AZZA A.', 24, NULL, '-', '-', '-', '-', '-', '', '-', '-', '-', '-', '2018-06-30 04:22:16', '2018-06-30 04:22:16'),
(219, 'TIARA SAPUTRI', 24, NULL, '-', '-', '-', '-', '-', '', '-', '-', '-', '-', '2018-06-30 04:22:16', '2018-06-30 04:22:16'),
(220, 'ABDUL MALIK ', 24, NULL, '-', '-', '-', '-', '-', '', '-', '-', '-', '-', '2018-06-30 04:22:16', '2018-06-30 04:22:16'),
(221, 'ADE SIDDIQ AL\'AMIN', 24, NULL, '-', '-', '-', '-', '-', '', '-', '-', '-', '-', '2018-06-30 04:22:16', '2018-06-30 04:22:16'),
(222, 'ADZAN ALMAHDI N.R', 24, NULL, '-', '-', '-', '-', '-', '', '-', '-', '-', '-', '2018-06-30 04:22:16', '2018-06-30 04:22:16'),
(223, 'AHMAD SANDY NOOR ', 24, NULL, '-', '-', '-', '-', '-', '', '-', '-', '-', '-', '2018-06-30 04:22:16', '2018-06-30 04:22:16'),
(224, 'AKBAR ALHADI N.R', 24, NULL, '-', '-', '-', '-', '-', '', '-', '-', '-', '-', '2018-06-30 04:22:16', '2018-06-30 04:22:16'),
(225, 'ANGGA KAKA LIQO', 24, NULL, '-', '-', '-', '-', '-', '', '-', '-', '-', '-', '2018-06-30 04:22:16', '2018-06-30 04:22:16'),
(226, 'DEVIN RADITYA F', 24, NULL, '-', '-', '-', '-', '-', '', '-', '-', '-', '-', '2018-06-30 04:22:17', '2018-06-30 04:22:17'),
(227, 'DHIMAS ILMAL YAKIN', 24, NULL, '-', '-', '-', '-', '-', '', '-', '-', '-', '-', '2018-06-30 04:22:17', '2018-06-30 04:22:17'),
(228, 'DIMAS WAHYU R.', 24, NULL, '-', '-', '-', '-', '-', '', '-', '-', '-', '-', '2018-06-30 04:22:17', '2018-06-30 04:22:17'),
(229, 'EGI REKA PRASOJO', 24, NULL, '-', '-', '-', '-', '-', '', '-', '-', '-', '-', '2018-06-30 04:22:17', '2018-06-30 04:22:17'),
(230, 'HANDIKA IKHWANA P.', 24, NULL, '-', '-', '-', '-', '-', '', '-', '-', '-', '-', '2018-06-30 04:22:17', '2018-06-30 04:22:17'),
(231, 'IRKHAM FAZA ISNADA', 24, NULL, '-', '-', '-', '-', '-', '', '-', '-', '-', '-', '2018-06-30 04:22:17', '2018-06-30 04:22:17'),
(232, 'JAKA ROYANA', 24, NULL, '-', '-', '-', '-', '-', '', '-', '-', '-', '-', '2018-06-30 04:22:17', '2018-06-30 04:22:17'),
(233, 'MARZUKI MULYANA', 24, NULL, '-', '-', '-', '-', '-', '', '-', '-', '-', '-', '2018-06-30 04:22:17', '2018-06-30 04:22:17'),
(234, 'MOCHAMMAD MUSTHOFA', 24, NULL, '-', '-', '-', '-', '-', '', '-', '-', '-', '-', '2018-06-30 04:22:17', '2018-06-30 04:22:17'),
(235, 'MOCHAMMAD RYAN A.', 24, NULL, '-', '-', '-', '-', '-', '', '-', '-', '-', '-', '2018-06-30 04:22:17', '2018-06-30 04:22:17'),
(236, 'M. DIVA AULIA HADI', 24, NULL, '-', '-', '-', '-', '-', '', '-', '-', '-', '-', '2018-06-30 04:22:17', '2018-06-30 04:22:17'),
(237, 'M. IKHWAN HAFIZH H.', 24, NULL, '-', '-', '-', '-', '-', '', '-', '-', '-', '-', '2018-06-30 04:22:17', '2018-06-30 04:22:17'),
(238, 'M. LUTFI NUR LATIF', 24, NULL, '-', '-', '-', '-', '-', '', '-', '-', '-', '-', '2018-06-30 04:22:17', '2018-06-30 04:22:17'),
(239, 'M. NOOR FAKIH', 24, NULL, '-', '-', '-', '-', '-', '', '-', '-', '-', '-', '2018-06-30 04:22:17', '2018-06-30 04:22:17'),
(240, 'MUHAMMAD RAKHA\'', 24, NULL, '-', '-', '-', '-', '-', '', '-', '-', '-', '-', '2018-06-30 04:22:17', '2018-06-30 04:22:17'),
(241, 'M. REHAL SA\'AD FINABAN', 24, NULL, '-', '-', '-', '-', '-', '', '-', '-', '-', '-', '2018-06-30 04:22:17', '2018-06-30 04:22:17'),
(242, 'MUHAMMAD RIDWAN', 24, NULL, '-', '-', '-', '-', '-', '', '-', '-', '-', '-', '2018-06-30 04:22:17', '2018-06-30 04:22:17'),
(243, 'M. ROFIQ HARIRI ', 24, NULL, '-', '-', '-', '-', '-', '', '-', '-', '-', '-', '2018-06-30 04:22:17', '2018-06-30 04:22:17'),
(244, 'RAHMAD CANDRA K.', 24, NULL, '-', '-', '-', '-', '-', '', '-', '-', '-', '-', '2018-06-30 04:22:18', '2018-06-30 04:22:18'),
(245, 'RIYADI ATSIRUDDIN A.', 24, NULL, '-', '-', '-', '-', '-', '', '-', '-', '-', '-', '2018-06-30 04:22:18', '2018-06-30 04:22:18'),
(246, 'SATRIA NURHUDA', 24, NULL, '-', '-', '-', '-', '-', '', '-', '-', '-', '-', '2018-06-30 04:22:18', '2018-06-30 04:22:18'),
(247, 'M. THORIQUL J.', 24, NULL, '-', '-', '-', '-', '-', '', '-', '-', '-', '-', '2018-06-30 04:22:18', '2018-06-30 04:22:18'),
(248, 'Zulfikar Machi Afanillah ', 18, NULL, '-', '-', '-', '-', '-', '', '-', '-', '-', '-', '2018-06-30 04:22:18', '2018-06-30 04:22:18'),
(249, 'Anggun Naja Fadhila Wardani ', 18, NULL, '-', '-', '-', '-', '-', '', '-', '-', '-', '-', '2018-06-30 04:22:18', '2018-06-30 04:22:18'),
(250, 'Putri Bilqis Ambar Zuroya Ridwan ', 18, NULL, '-', '-', '-', '-', '-', '', '-', '-', '-', '-', '2018-06-30 04:22:18', '2018-06-30 04:22:18'),
(251, 'Putri Khusnul Cahya ', 18, NULL, '-', '-', '-', '-', '-', '', '-', '-', '-', '-', '2018-06-30 04:22:18', '2018-06-30 04:22:18'),
(252, 'Fitri Ayu Wulandari ', 18, NULL, '-', '-', '-', '-', '-', '', '-', '-', '-', '-', '2018-06-30 04:22:18', '2018-06-30 04:22:18'),
(253, 'Afni Ilman Nafiah ', 18, NULL, '-', '-', '-', '-', '-', '', '-', '-', '-', '-', '2018-06-30 04:22:18', '2018-06-30 04:22:18'),
(254, 'Nouva Vazhyra Aulia Febriana ', 18, NULL, '-', '-', '-', '-', '-', '', '-', '-', '-', '-', '2018-06-30 04:22:18', '2018-06-30 04:22:18'),
(255, 'Dinfisa Putri Nindi Sahara ', 18, NULL, '-', '-', '-', '-', '-', '', '-', '-', '-', '-', '2018-06-30 04:22:18', '2018-06-30 04:22:18'),
(256, 'Ibrohim Alban Pamungkas ', 18, NULL, '-', '-', '-', '-', '-', '', '-', '-', '-', '-', '2018-06-30 04:22:18', '2018-06-30 04:22:18'),
(257, 'Melati', 18, NULL, '-', '-', '-', '-', '-', '', '-', '-', '-', '-', '2018-06-30 04:22:18', '2018-06-30 04:22:18'),
(258, 'Axel Setia Dirda ', 18, NULL, '-', '-', '-', '-', '-', '', '-', '-', '-', '-', '2018-06-30 04:22:19', '2018-06-30 04:22:19'),
(259, 'Muhammad Nurzen Zidan ', 18, NULL, '-', '-', '-', '-', '-', '', '-', '-', '-', '-', '2018-06-30 04:22:19', '2018-06-30 04:22:19'),
(260, 'Agus Fajar Fambudi ', 18, NULL, '-', '-', '-', '-', '-', '', '-', '-', '-', '-', '2018-06-30 04:22:19', '2018-06-30 04:22:19'),
(261, 'Alfito Deanova ', 18, NULL, '-', '-', '-', '-', '-', '', '-', '-', '-', '-', '2018-06-30 04:22:19', '2018-06-30 04:22:19'),
(262, 'Dimas Tegar Abdillah ', 18, NULL, '-', '-', '-', '-', '-', '', '-', '-', '-', '-', '2018-06-30 04:22:19', '2018-06-30 04:22:19'),
(263, 'Sulthon Aulia Fathul Kubar ', 18, NULL, '-', '-', '-', '-', '-', '', '-', '-', '-', '-', '2018-06-30 04:22:19', '2018-06-30 04:22:19'),
(264, 'Diva Aulia Tridayana ', 18, NULL, '-', '-', '-', '-', '-', '', '-', '-', '-', '-', '2018-06-30 04:22:19', '2018-06-30 04:22:19'),
(265, 'Felisya Della Suryani ', 18, NULL, '-', '-', '-', '-', '-', '', '-', '-', '-', '-', '2018-06-30 04:22:19', '2018-06-30 04:22:19'),
(266, 'Wahyu Agung Fauzi Mukhid ', 18, NULL, '-', '-', '-', '-', '-', '', '-', '-', '-', '-', '2018-06-30 04:22:19', '2018-06-30 04:22:19'),
(267, 'Muhammad Fatkhu Royan Firomadani', 18, NULL, '-', '-', '-', '-', '-', '', '-', '-', '-', '-', '2018-06-30 04:22:19', '2018-06-30 04:22:19'),
(268, 'Mochammad Abdul Aziz ', 18, NULL, '-', '-', '-', '-', '-', '', '-', '-', '-', '-', '2018-06-30 04:22:19', '2018-06-30 04:22:19'),
(269, 'Cantika Dewi Ratna Putri ', 18, NULL, '-', '-', '-', '-', '-', '', '-', '-', '-', '-', '2018-06-30 04:22:19', '2018-06-30 04:22:19'),
(270, 'Putri Nur Habiyani Suwarno', 18, NULL, '-', '-', '-', '-', '-', '', '-', '-', '-', '-', '2018-06-30 04:22:19', '2018-06-30 04:22:19'),
(271, 'Baihaqi Ebinsabela ', 18, NULL, '-', '-', '-', '-', '-', '', '-', '-', '-', '-', '2018-06-30 04:22:19', '2018-06-30 04:22:19'),
(272, 'Dimas Maulana', 18, NULL, '-', '-', '-', '-', '-', '', '-', '-', '-', '-', '2018-06-30 04:22:19', '2018-06-30 04:22:19'),
(273, 'Abdul Rizal Pratama ', 18, NULL, '-', '-', '-', '-', '-', '', '-', '-', '-', '-', '2018-06-30 04:22:19', '2018-06-30 04:22:19'),
(274, 'Shabrina Azzahra Ananda ', 18, NULL, '-', '-', '-', '-', '-', '', '-', '-', '-', '-', '2018-06-30 04:22:19', '2018-06-30 04:22:19'),
(275, 'Rahma Maulida Arnanti ', 18, NULL, '-', '-', '-', '-', '-', '', '-', '-', '-', '-', '2018-06-30 04:22:19', '2018-06-30 04:22:19'),
(276, 'Ahmad Fadly Maulana ', 18, NULL, '-', '-', '-', '-', '-', '', '-', '-', '-', '-', '2018-06-30 04:22:20', '2018-06-30 04:22:20'),
(277, 'Depi Puspita Sari ', 18, NULL, '-', '-', '-', '-', '-', '', '-', '-', '-', '-', '2018-06-30 04:22:20', '2018-06-30 04:22:20'),
(278, 'Sri Wahyuni', 18, NULL, '-', '-', '-', '-', '-', '', '-', '-', '-', '-', '2018-06-30 04:22:20', '2018-06-30 04:22:20'),
(279, 'Mutiara Rezki Fajrany ', 18, NULL, '-', '-', '-', '-', '-', '', '-', '-', '-', '-', '2018-06-30 04:22:20', '2018-06-30 04:22:20'),
(280, 'Muhammad Dani Lesa Putra ', 18, NULL, '-', '-', '-', '-', '-', '', '-', '-', '-', '-', '2018-06-30 04:22:20', '2018-06-30 04:22:20'),
(281, 'Vetty Khasanah ', 18, NULL, '-', '-', '-', '-', '-', '', '-', '-', '-', '-', '2018-06-30 04:22:20', '2018-06-30 04:22:20'),
(282, 'Rindi Nubaisyah ', 18, NULL, '-', '-', '-', '-', '-', '', '-', '-', '-', '-', '2018-06-30 04:22:20', '2018-06-30 04:22:20'),
(283, 'Kholifah Qisti Rosada ', 18, NULL, '-', '-', '-', '-', '-', '', '-', '-', '-', '-', '2018-06-30 04:22:20', '2018-06-30 04:22:20'),
(284, 'Alfiyakusna', 18, NULL, '-', '-', '-', '-', '-', '', '-', '-', '-', '-', '2018-06-30 04:22:20', '2018-06-30 04:22:20'),
(285, 'Khusnul Tiwi Wijayanti ', 18, NULL, '-', '-', '-', '-', '-', '', '-', '-', '-', '-', '2018-06-30 04:22:20', '2018-06-30 04:22:20'),
(286, 'Ibnu Fadhillah Abdurohman ', 18, NULL, '-', '-', '-', '-', '-', '', '-', '-', '-', '-', '2018-06-30 04:22:20', '2018-06-30 04:22:20'),
(287, 'Ayu Mega Maulidya ', 18, NULL, '-', '-', '-', '-', '-', '', '-', '-', '-', '-', '2018-06-30 04:22:21', '2018-06-30 04:22:21'),
(288, 'Khairunisa', 18, NULL, '-', '-', '-', '-', '-', '', '-', '-', '-', '-', '2018-06-30 04:22:21', '2018-06-30 04:22:21'),
(289, 'Fina Amalia Jamil ', 18, NULL, '-', '-', '-', '-', '-', '', '-', '-', '-', '-', '2018-06-30 04:22:21', '2018-06-30 04:22:21'),
(290, 'Andi Muhammad Zaki ', 18, NULL, '-', '-', '-', '-', '-', '', '-', '-', '-', '-', '2018-06-30 04:22:21', '2018-06-30 04:22:21'),
(291, 'Muhammad Aden Bryantama Saputra', 18, NULL, '-', '-', '-', '-', '-', '', '-', '-', '-', '-', '2018-06-30 04:22:21', '2018-06-30 04:22:21'),
(292, 'Fadilah Ramadani ', 18, NULL, '-', '-', '-', '-', '-', '', '-', '-', '-', '-', '2018-06-30 04:22:21', '2018-06-30 04:22:21'),
(293, 'Dwi Fatmawati Ningtias ', 18, NULL, '-', '-', '-', '-', '-', '', '-', '-', '-', '-', '2018-06-30 04:22:21', '2018-06-30 04:22:21'),
(294, 'Intan Fitriani ', 18, NULL, '-', '-', '-', '-', '-', '', '-', '-', '-', '-', '2018-06-30 04:22:21', '2018-06-30 04:22:21'),
(295, 'Sukma Nurhayati ', 18, NULL, '-', '-', '-', '-', '-', '', '-', '-', '-', '-', '2018-06-30 04:22:21', '2018-06-30 04:22:21'),
(296, 'Muhammad Faqih Nurfauzan ', 18, NULL, '-', '-', '-', '-', '-', '', '-', '-', '-', '-', '2018-06-30 04:22:21', '2018-06-30 04:22:21'),
(297, 'Fahrur Rosi ', 18, NULL, '-', '-', '-', '-', '-', '', '-', '-', '-', '-', '2018-06-30 04:22:21', '2018-06-30 04:22:21'),
(298, 'Affan Maulana ', 18, NULL, '-', '-', '-', '-', '-', '', '-', '-', '-', '-', '2018-06-30 04:22:21', '2018-06-30 04:22:21'),
(299, 'Muhammad Alif Ary Hakim ', 18, NULL, '-', '-', '-', '-', '-', '', '-', '-', '-', '-', '2018-06-30 04:22:21', '2018-06-30 04:22:21'),
(300, 'Ibnu Azis As Sahab ', 18, NULL, '-', '-', '-', '-', '-', '', '-', '-', '-', '-', '2018-06-30 04:22:21', '2018-06-30 04:22:21'),
(301, 'Andi Aqil Ajrun Adhim ', 18, NULL, '-', '-', '-', '-', '-', '', '-', '-', '-', '-', '2018-06-30 04:22:21', '2018-06-30 04:22:21'),
(302, 'Kayyisa Fadhlillah Ardhy Sejati ', 18, NULL, '-', '-', '-', '-', '-', '', '-', '-', '-', '-', '2018-06-30 04:22:22', '2018-06-30 04:22:22'),
(303, 'Farah Anifah Urdhiah ', 18, NULL, '-', '-', '-', '-', '-', '', '-', '-', '-', '-', '2018-06-30 04:22:22', '2018-06-30 04:22:22'),
(304, 'Hamam Pancer Jagad ', 18, NULL, '-', '-', '-', '-', '-', '', '-', '-', '-', '-', '2018-06-30 04:22:22', '2018-06-30 04:22:22'),
(305, 'Lisa Handayani ', 18, NULL, '-', '-', '-', '-', '-', '', '-', '-', '-', '-', '2018-06-30 04:22:22', '2018-06-30 04:22:22'),
(306, 'Hugo Adriano Isnaeni ', 18, NULL, '-', '-', '-', '-', '-', '', '-', '-', '-', '-', '2018-06-30 04:22:22', '2018-06-30 04:22:22'),
(307, 'Dzulkarnain Akbar Benda ', 18, NULL, '-', '-', '-', '-', '-', '', '-', '-', '-', '-', '2018-06-30 04:22:22', '2018-06-30 04:22:22'),
(308, 'Aulia Catur Wulandari ', 18, NULL, '-', '-', '-', '-', '-', '', '-', '-', '-', '-', '2018-06-30 04:22:22', '2018-06-30 04:22:22'),
(309, 'Vonny Widyaningsih ', 18, NULL, '-', '-', '-', '-', '-', '', '-', '-', '-', '-', '2018-06-30 04:22:22', '2018-06-30 04:22:22'),
(310, 'Aan Hendin Wahyudaulloh ', 18, NULL, '-', '-', '-', '-', '-', '', '-', '-', '-', '-', '2018-06-30 04:22:22', '2018-06-30 04:22:22'),
(311, 'Amalia Rahmi Oktavia ', 18, NULL, '-', '-', '-', '-', '-', '', '-', '-', '-', '-', '2018-06-30 04:22:22', '2018-06-30 04:22:22'),
(312, 'Bagus Eka Firdaus ', 18, NULL, '-', '-', '-', '-', '-', '', '-', '-', '-', '-', '2018-06-30 04:22:22', '2018-06-30 04:22:22'),
(313, 'Raisa Safwa Ammara ', 18, NULL, '-', '-', '-', '-', '-', '', '-', '-', '-', '-', '2018-06-30 04:22:22', '2018-06-30 04:22:22'),
(314, 'Choirul Fitriani ', 18, NULL, '-', '-', '-', '-', '-', '', '-', '-', '-', '-', '2018-06-30 04:22:23', '2018-06-30 04:22:23'),
(315, 'Dian Achmad Ninata ', 18, NULL, '-', '-', '-', '-', '-', '', '-', '-', '-', '-', '2018-06-30 04:22:23', '2018-06-30 04:22:23'),
(316, 'Bani Adam Al-Fauzi ', 18, NULL, '-', '-', '-', '-', '-', '', '-', '-', '-', '-', '2018-06-30 04:22:23', '2018-06-30 04:22:23'),
(317, 'Najelia Ayu Nurosida ', 18, NULL, '-', '-', '-', '-', '-', '', '-', '-', '-', '-', '2018-06-30 04:22:23', '2018-06-30 04:22:23'),
(318, 'Huda Firdaus ', 18, NULL, '-', '-', '-', '-', '-', '', '-', '-', '-', '-', '2018-06-30 04:22:23', '2018-06-30 04:22:23'),
(319, 'Triana Maya Wulandari', 18, NULL, '-', '-', '-', '-', '-', '', '-', '-', '-', '-', '2018-06-30 04:22:23', '2018-06-30 04:22:23'),
(320, 'Zidan Faqih Zanuar Reza', 18, NULL, '-', '-', '-', '-', '-', '', '-', '-', '-', '-', '2018-06-30 04:22:23', '2018-06-30 04:22:23'),
(321, 'Faqih Alidonia ', 18, NULL, '-', '-', '-', '-', '-', '', '-', '-', '-', '-', '2018-06-30 04:22:23', '2018-06-30 04:22:23'),
(322, 'Sabrina Aurora M', 18, NULL, '-', '-', '-', '-', '-', '', '-', '-', '-', '-', '2018-06-30 04:22:23', '2018-06-30 04:22:23'),
(323, 'Annisa Rifdah Maharani ', 18, NULL, '-', '-', '-', '-', '-', '', '-', '-', '-', '-', '2018-06-30 04:22:23', '2018-06-30 04:22:23'),
(324, 'Alfina ', 18, NULL, '-', '-', '-', '-', '-', '', '-', '-', '-', '-', '2018-06-30 04:22:23', '2018-06-30 04:22:23');
INSERT INTO `anggota` (`id_anggota`, `nama_anggota`, `id_kelompok`, `tgl_lahir`, `tempat_lahir`, `desa`, `jenis_kelamin`, `no_telepon`, `email`, `alamat`, `ket_peserta`, `ukuran_baju`, `dapukan`, `status_peserta`, `created_at`, `updated_at`) VALUES
(325, 'Abdul Ghoni Syakur ', 18, NULL, '-', '-', '-', '-', '-', '', '-', '-', '-', '-', '2018-06-30 04:22:23', '2018-06-30 04:22:23'),
(326, 'Muhammad Firdaus Ubaydullah', 18, NULL, '-', '-', '-', '-', '-', '', '-', '-', '-', '-', '2018-06-30 04:22:23', '2018-06-30 04:22:23'),
(327, 'Amanda Lathifa Khonif ', 18, NULL, '-', '-', '-', '-', '-', '', '-', '-', '-', '-', '2018-06-30 04:22:24', '2018-06-30 04:22:24'),
(328, 'Puspita Ayu Fitrianita ', 18, NULL, '-', '-', '-', '-', '-', '', '-', '-', '-', '-', '2018-06-30 04:22:24', '2018-06-30 04:22:24'),
(329, 'Nurhidayah Putri Nabila ', 18, NULL, '-', '-', '-', '-', '-', '', '-', '-', '-', '-', '2018-06-30 04:22:24', '2018-06-30 04:22:24'),
(330, 'Lia Ana Kholifah ', 18, NULL, '-', '-', '-', '-', '-', '', '-', '-', '-', '-', '2018-06-30 04:22:24', '2018-06-30 04:22:24'),
(331, 'Imroani Khafidah ', 18, NULL, '-', '-', '-', '-', '-', '', '-', '-', '-', '-', '2018-06-30 04:22:24', '2018-06-30 04:22:24'),
(332, 'Muhammad Daffa Abi Presdiawan ', 18, NULL, '-', '-', '-', '-', '-', '', '-', '-', '-', '-', '2018-06-30 04:22:24', '2018-06-30 04:22:24'),
(333, 'Mohammad Ismail ', 18, NULL, '-', '-', '-', '-', '-', '', '-', '-', '-', '-', '2018-06-30 04:22:25', '2018-06-30 04:22:25'),
(334, 'Fenita Meisya Nandini ', 18, NULL, '-', '-', '-', '-', '-', '', '-', '-', '-', '-', '2018-06-30 04:22:25', '2018-06-30 04:22:25'),
(335, 'Salsabila Royani Putri Ramadhani ', 18, NULL, '-', '-', '-', '-', '-', '', '-', '-', '-', '-', '2018-06-30 04:22:25', '2018-06-30 04:22:25'),
(336, 'Tiara Kayla R', 18, NULL, '-', '-', '-', '-', '-', '', '-', '-', '-', '-', '2018-06-30 04:22:25', '2018-06-30 04:22:25'),
(337, 'Habib Ali Ramadani', 18, NULL, '-', '-', '-', '-', '-', '', '-', '-', '-', '-', '2018-06-30 04:22:25', '2018-06-30 04:22:25'),
(338, 'Juliana Karita Effendi ', 18, NULL, '-', '-', '-', '-', '-', '', '-', '-', '-', '-', '2018-06-30 04:22:26', '2018-06-30 04:22:26'),
(339, 'Asiah ', 18, NULL, '-', '-', '-', '-', '-', '', '-', '-', '-', '-', '2018-06-30 04:22:26', '2018-06-30 04:22:26'),
(340, 'Anis Adelia Putri Salsabila ', 18, NULL, '-', '-', '-', '-', '-', '', '-', '-', '-', '-', '2018-06-30 04:22:26', '2018-06-30 04:22:26'),
(341, 'Bagas Putro Sejati ', 18, NULL, '-', '-', '-', '-', '-', '', '-', '-', '-', '-', '2018-06-30 04:22:26', '2018-06-30 04:22:26'),
(342, 'Adinda Deskia Nabila ', 18, NULL, '-', '-', '-', '-', '-', '', '-', '-', '-', '-', '2018-06-30 04:22:26', '2018-06-30 04:22:26'),
(343, 'Afrigo Alena Rusdy', 18, NULL, '-', '-', '-', '-', '-', '', '-', '-', '-', '-', '2018-06-30 04:22:27', '2018-06-30 04:22:27'),
(344, 'Igo ', 18, NULL, '-', '-', '-', '-', '-', '', '-', '-', '-', '-', '2018-06-30 04:22:27', '2018-06-30 04:22:27'),
(345, 'Melin', 18, NULL, '-', '-', '-', '-', '-', '', '-', '-', '-', '-', '2018-06-30 04:22:27', '2018-06-30 04:22:27'),
(346, 'Diah Anggi Rizkyana ', 18, NULL, '-', '-', '-', '-', '-', '', '-', '-', '-', '-', '2018-06-30 04:22:27', '2018-06-30 04:22:27'),
(347, 'Linda Miftakhul Rizka ', 18, NULL, '-', '-', '-', '-', '-', '', '-', '-', '-', '-', '2018-06-30 04:22:27', '2018-06-30 04:22:27'),
(348, 'Dwi Amalinda Listi', 18, NULL, '-', '-', '-', '-', '-', '', '-', '-', '-', '-', '2018-06-30 04:22:27', '2018-06-30 04:22:27'),
(349, 'Fadel Fiqhi Al Hadis ', 18, NULL, '-', '-', '-', '-', '-', '', '-', '-', '-', '-', '2018-06-30 04:22:28', '2018-06-30 04:22:28'),
(350, 'Rahman Rahul Maulana ', 18, NULL, '-', '-', '-', '-', '-', '', '-', '-', '-', '-', '2018-06-30 04:22:28', '2018-06-30 04:22:28'),
(351, 'Yogi Fernanda ', 18, NULL, '-', '-', '-', '-', '-', '', '-', '-', '-', '-', '2018-06-30 04:22:28', '2018-06-30 04:22:28'),
(352, 'Rahel Maralatha ', 18, NULL, '-', '-', '-', '-', '-', '', '-', '-', '-', '-', '2018-06-30 04:22:28', '2018-06-30 04:22:28'),
(353, 'Mukhsonatin Nisa ', 18, NULL, '-', '-', '-', '-', '-', '', '-', '-', '-', '-', '2018-06-30 04:22:28', '2018-06-30 04:22:28'),
(354, 'Ilham Dedi', 18, NULL, '-', '-', '-', '-', '-', '', '-', '-', '-', '-', '2018-06-30 04:22:28', '2018-06-30 04:22:28'),
(355, 'ADITYA FATAHU ROHMAN', 19, NULL, '-', '-', '-', '-', '-', '', '-', '-', '-', '-', '2018-06-30 04:22:28', '2018-06-30 04:22:28'),
(356, 'AGENG SILMI PINASTI', 19, NULL, '-', '-', '-', '-', '-', '', '-', '-', '-', '-', '2018-06-30 04:22:28', '2018-06-30 04:22:28'),
(357, 'AHYA SUNAN AL ALIF', 19, NULL, '-', '-', '-', '-', '-', '', '-', '-', '-', '-', '2018-06-30 04:22:28', '2018-06-30 04:22:28'),
(358, 'AKHSAN NUR FALAKHI ', 19, NULL, '-', '-', '-', '-', '-', '', '-', '-', '-', '-', '2018-06-30 04:22:28', '2018-06-30 04:22:28'),
(359, 'AKSAN BANY MUQODDAS', 19, NULL, '-', '-', '-', '-', '-', '', '-', '-', '-', '-', '2018-06-30 04:22:28', '2018-06-30 04:22:28'),
(360, 'ALAN ARDIANSYAH', 19, NULL, '-', '-', '-', '-', '-', '', '-', '-', '-', '-', '2018-06-30 04:22:28', '2018-06-30 04:22:28'),
(361, 'ALIF GIBRAN SHIDDIQ', 19, NULL, '-', '-', '-', '-', '-', '', '-', '-', '-', '-', '2018-06-30 04:22:29', '2018-06-30 04:22:29'),
(362, 'AMAR MUSTHOFAINAL ACHAR', 19, NULL, '-', '-', '-', '-', '-', '', '-', '-', '-', '-', '2018-06-30 04:22:29', '2018-06-30 04:22:29'),
(363, 'ANI NURTIKASARI', 19, NULL, '-', '-', '-', '-', '-', '', '-', '-', '-', '-', '2018-06-30 04:22:29', '2018-06-30 04:22:29'),
(364, 'ANIS SUSIATI', 19, NULL, '-', '-', '-', '-', '-', '', '-', '-', '-', '-', '2018-06-30 04:22:29', '2018-06-30 04:22:29'),
(365, 'APRILLIA ANTIKA DEWI', 19, NULL, '-', '-', '-', '-', '-', '', '-', '-', '-', '-', '2018-06-30 04:22:29', '2018-06-30 04:22:29'),
(366, 'ARYA MUHAMAD RIZKI ', 19, NULL, '-', '-', '-', '-', '-', '', '-', '-', '-', '-', '2018-06-30 04:22:29', '2018-06-30 04:22:29'),
(367, 'ASHABI KHOIRUR RIZAL ', 19, NULL, '-', '-', '-', '-', '-', '', '-', '-', '-', '-', '2018-06-30 04:22:29', '2018-06-30 04:22:29'),
(368, 'AYU DWI LESTARI', 19, NULL, '-', '-', '-', '-', '-', '', '-', '-', '-', '-', '2018-06-30 04:22:29', '2018-06-30 04:22:29'),
(369, 'BERLIANA', 19, NULL, '-', '-', '-', '-', '-', '', '-', '-', '-', '-', '2018-06-30 04:22:29', '2018-06-30 04:22:29'),
(370, 'CHAIRUNNISA SJAHRANIE', 19, NULL, '-', '-', '-', '-', '-', '', '-', '-', '-', '-', '2018-06-30 04:22:29', '2018-06-30 04:22:29'),
(371, 'DARA RAHMA CALISTA ', 19, NULL, '-', '-', '-', '-', '-', '', '-', '-', '-', '-', '2018-06-30 04:22:29', '2018-06-30 04:22:29'),
(372, 'DEFITA SARI WULANDARI', 19, NULL, '-', '-', '-', '-', '-', '', '-', '-', '-', '-', '2018-06-30 04:22:29', '2018-06-30 04:22:29'),
(373, 'DIANI ROYHANA HAJAR', 19, NULL, '-', '-', '-', '-', '-', '', '-', '-', '-', '-', '2018-06-30 04:22:29', '2018-06-30 04:22:29'),
(374, 'DIMAS FATRA MAULANA', 19, NULL, '-', '-', '-', '-', '-', '', '-', '-', '-', '-', '2018-06-30 04:22:29', '2018-06-30 04:22:29'),
(375, 'DIVYA DEALOVA PUTRI', 19, NULL, '-', '-', '-', '-', '-', '', '-', '-', '-', '-', '2018-06-30 04:22:29', '2018-06-30 04:22:29'),
(376, 'ENDRI APRILIA', 19, NULL, '-', '-', '-', '-', '-', '', '-', '-', '-', '-', '2018-06-30 04:22:29', '2018-06-30 04:22:29'),
(377, 'FARHAN ZUDITIA RAHMAN', 19, NULL, '-', '-', '-', '-', '-', '', '-', '-', '-', '-', '2018-06-30 04:22:29', '2018-06-30 04:22:29'),
(378, 'FATAN NAUFAL RASIKH', 19, NULL, '-', '-', '-', '-', '-', '', '-', '-', '-', '-', '2018-06-30 04:22:29', '2018-06-30 04:22:29'),
(379, 'FATHUL ARIS NURMANTO', 19, NULL, '-', '-', '-', '-', '-', '', '-', '-', '-', '-', '2018-06-30 04:22:29', '2018-06-30 04:22:29'),
(380, 'HASBI ALLAHU NUR R. ', 19, NULL, '-', '-', '-', '-', '-', '', '-', '-', '-', '-', '2018-06-30 04:22:30', '2018-06-30 04:22:30'),
(381, 'HILYA', 19, NULL, '-', '-', '-', '-', '-', '', '-', '-', '-', '-', '2018-06-30 04:22:30', '2018-06-30 04:22:30'),
(382, 'HUTOMO ABDULLAH ', 19, NULL, '-', '-', '-', '-', '-', '', '-', '-', '-', '-', '2018-06-30 04:22:30', '2018-06-30 04:22:30'),
(383, 'ICHWAN B I L', 19, NULL, '-', '-', '-', '-', '-', '', '-', '-', '-', '-', '2018-06-30 04:22:30', '2018-06-30 04:22:30'),
(384, 'INDAH MELATI', 19, NULL, '-', '-', '-', '-', '-', '', '-', '-', '-', '-', '2018-06-30 04:22:30', '2018-06-30 04:22:30'),
(385, 'INDAH SEPTIANI', 19, NULL, '-', '-', '-', '-', '-', '', '-', '-', '-', '-', '2018-06-30 04:22:30', '2018-06-30 04:22:30'),
(386, 'IZZAZAVA AZ ZAHIRA ', 19, NULL, '-', '-', '-', '-', '-', '', '-', '-', '-', '-', '2018-06-30 04:22:30', '2018-06-30 04:22:30'),
(387, 'JEVANA RUSVA AZZAHRA', 19, NULL, '-', '-', '-', '-', '-', '', '-', '-', '-', '-', '2018-06-30 04:22:30', '2018-06-30 04:22:30'),
(388, 'JORQUIN JULIANO C. R ', 19, NULL, '-', '-', '-', '-', '-', '', '-', '-', '-', '-', '2018-06-30 04:22:30', '2018-06-30 04:22:30'),
(389, 'LAILA DELA MARETA', 19, NULL, '-', '-', '-', '-', '-', '', '-', '-', '-', '-', '2018-06-30 04:22:30', '2018-06-30 04:22:30'),
(390, 'LU\'LU\'IM MASFUFAH', 19, NULL, '-', '-', '-', '-', '-', '', '-', '-', '-', '-', '2018-06-30 04:22:30', '2018-06-30 04:22:30'),
(391, 'LUTHFI DZULFIQAR ', 19, NULL, '-', '-', '-', '-', '-', '', '-', '-', '-', '-', '2018-06-30 04:22:30', '2018-06-30 04:22:30'),
(392, 'MUHAMMAD ANNAS', 19, NULL, '-', '-', '-', '-', '-', '', '-', '-', '-', '-', '2018-06-30 04:22:30', '2018-06-30 04:22:30'),
(393, 'MUHAMMAD AZALEA V. ', 19, NULL, '-', '-', '-', '-', '-', '', '-', '-', '-', '-', '2018-06-30 04:22:30', '2018-06-30 04:22:30'),
(394, 'MUHAMMAD HALIM', 19, NULL, '-', '-', '-', '-', '-', '', '-', '-', '-', '-', '2018-06-30 04:22:30', '2018-06-30 04:22:30'),
(395, 'MUHAMMAD NAZIDAN H.', 19, NULL, '-', '-', '-', '-', '-', '', '-', '-', '-', '-', '2018-06-30 04:22:30', '2018-06-30 04:22:30'),
(396, 'MUHAMMAD PAHALA JAYA ', 19, NULL, '-', '-', '-', '-', '-', '', '-', '-', '-', '-', '2018-06-30 04:22:30', '2018-06-30 04:22:30'),
(397, 'MUHAMMAD ROYAN TOUHURI ', 19, NULL, '-', '-', '-', '-', '-', '', '-', '-', '-', '-', '2018-06-30 04:22:30', '2018-06-30 04:22:30'),
(398, 'MUHAMMAD SYAHRI R. ', 19, NULL, '-', '-', '-', '-', '-', '', '-', '-', '-', '-', '2018-06-30 04:22:30', '2018-06-30 04:22:30'),
(399, 'MUHAMMAD WAHYU HIDAYATULLAH', 19, NULL, '-', '-', '-', '-', '-', '', '-', '-', '-', '-', '2018-06-30 04:22:31', '2018-06-30 04:22:31'),
(400, 'MUHAMMAD ZACKY', 19, NULL, '-', '-', '-', '-', '-', '', '-', '-', '-', '-', '2018-06-30 04:22:31', '2018-06-30 04:22:31'),
(401, 'MUHAMMAD ZAKKI S.L', 19, NULL, '-', '-', '-', '-', '-', '', '-', '-', '-', '-', '2018-06-30 04:22:31', '2018-06-30 04:22:31'),
(402, 'NADIRA QISHA', 19, NULL, '-', '-', '-', '-', '-', '', '-', '-', '-', '-', '2018-06-30 04:22:31', '2018-06-30 04:22:31'),
(403, 'NARAYA WIRA DHARMA', 19, NULL, '-', '-', '-', '-', '-', '', '-', '-', '-', '-', '2018-06-30 04:22:31', '2018-06-30 04:22:31'),
(404, 'NASYA AURELLIA PUTRI M ', 19, NULL, '-', '-', '-', '-', '-', '', '-', '-', '-', '-', '2018-06-30 04:22:31', '2018-06-30 04:22:31'),
(405, 'OVAN NATHAN ', 19, NULL, '-', '-', '-', '-', '-', '', '-', '-', '-', '-', '2018-06-30 04:22:31', '2018-06-30 04:22:31'),
(406, 'RANGGA GALIH SAPUTRA ', 19, NULL, '-', '-', '-', '-', '-', '', '-', '-', '-', '-', '2018-06-30 04:22:31', '2018-06-30 04:22:31'),
(407, 'RANGGA WAHYU SAPUTRA ', 19, NULL, '-', '-', '-', '-', '-', '', '-', '-', '-', '-', '2018-06-30 04:22:31', '2018-06-30 04:22:31'),
(408, 'REVI AMANDANIA ', 19, NULL, '-', '-', '-', '-', '-', '', '-', '-', '-', '-', '2018-06-30 04:22:31', '2018-06-30 04:22:31'),
(409, 'REYZA AKBAR AL-HAFIDH', 19, NULL, '-', '-', '-', '-', '-', '', '-', '-', '-', '-', '2018-06-30 04:22:31', '2018-06-30 04:22:31'),
(410, 'RICKA AULIA AZZAKIAH', 19, NULL, '-', '-', '-', '-', '-', '', '-', '-', '-', '-', '2018-06-30 04:22:31', '2018-06-30 04:22:31'),
(411, 'RINA ASTUTI', 19, NULL, '-', '-', '-', '-', '-', '', '-', '-', '-', '-', '2018-06-30 04:22:31', '2018-06-30 04:22:31'),
(412, 'RIZKI DION NASRULLOH ', 19, NULL, '-', '-', '-', '-', '-', '', '-', '-', '-', '-', '2018-06-30 04:22:31', '2018-06-30 04:22:31'),
(413, 'RIZQY ONE SAPUTRE', 19, NULL, '-', '-', '-', '-', '-', '', '-', '-', '-', '-', '2018-06-30 04:22:31', '2018-06-30 04:22:31'),
(414, 'SATRIAWAN DWI SANTOSO', 19, NULL, '-', '-', '-', '-', '-', '', '-', '-', '-', '-', '2018-06-30 04:22:31', '2018-06-30 04:22:31'),
(415, 'SYAIFUL ANWAR IBRAHIM ', 19, NULL, '-', '-', '-', '-', '-', '', '-', '-', '-', '-', '2018-06-30 04:22:31', '2018-06-30 04:22:31'),
(416, 'SYIFA ZAHRA AULIA', 19, NULL, '-', '-', '-', '-', '-', '', '-', '-', '-', '-', '2018-06-30 04:22:31', '2018-06-30 04:22:31'),
(417, 'TAUFIK NUR HIDAYAT', 19, NULL, '-', '-', '-', '-', '-', '', '-', '-', '-', '-', '2018-06-30 04:22:31', '2018-06-30 04:22:31'),
(418, 'TIARA DWI CAHYANI', 19, NULL, '-', '-', '-', '-', '-', '', '-', '-', '-', '-', '2018-06-30 04:22:31', '2018-06-30 04:22:31'),
(419, 'TIBERT RADJASHAA BE', 19, NULL, '-', '-', '-', '-', '-', '', '-', '-', '-', '-', '2018-06-30 04:22:32', '2018-06-30 04:22:32'),
(420, 'TIRTA AHMAD FIONALDO ', 19, NULL, '-', '-', '-', '-', '-', '', '-', '-', '-', '-', '2018-06-30 04:22:32', '2018-06-30 04:22:32'),
(421, 'TOSY BIMA ASADULLOH M ', 19, NULL, '-', '-', '-', '-', '-', '', '-', '-', '-', '-', '2018-06-30 04:22:32', '2018-06-30 04:22:32'),
(422, 'VANESSA AURELIA R', 19, NULL, '-', '-', '-', '-', '-', '', '-', '-', '-', '-', '2018-06-30 04:22:32', '2018-06-30 04:22:32'),
(423, 'VERLITA IRAWATI ', 19, NULL, '-', '-', '-', '-', '-', '', '-', '-', '-', '-', '2018-06-30 04:22:32', '2018-06-30 04:22:32'),
(424, 'WILLY YULIANSYAH M.', 19, NULL, '-', '-', '-', '-', '-', '', '-', '-', '-', '-', '2018-06-30 04:22:32', '2018-06-30 04:22:32'),
(425, 'YENITA RASYID', 19, NULL, '-', '-', '-', '-', '-', '', '-', '-', '-', '-', '2018-06-30 04:22:32', '2018-06-30 04:22:32'),
(426, 'YOGI UMAR', 19, NULL, '-', '-', '-', '-', '-', '', '-', '-', '-', '-', '2018-06-30 04:22:32', '2018-06-30 04:22:32'),
(427, 'YOURDAN FARIS ALKAYISA ', 19, NULL, '-', '-', '-', '-', '-', '', '-', '-', '-', '-', '2018-06-30 04:22:32', '2018-06-30 04:22:32'),
(428, 'ADAM', 17, NULL, '-', '-', '-', '-', '-', '', '-', '-', '-', '-', '2018-06-30 04:22:32', '2018-06-30 04:22:32'),
(429, 'ARIS', 17, NULL, '-', '-', '-', '-', '-', '', '-', '-', '-', '-', '2018-06-30 04:22:32', '2018-06-30 04:22:32'),
(430, 'ABDULLOH', 17, NULL, '-', '-', '-', '-', '-', '', '-', '-', '-', '-', '2018-06-30 04:22:32', '2018-06-30 04:22:32'),
(431, 'HAFID', 17, NULL, '-', '-', '-', '-', '-', '', '-', '-', '-', '-', '2018-06-30 04:22:32', '2018-06-30 04:22:32'),
(432, 'RIDWAN', 17, NULL, '-', '-', '-', '-', '-', '', '-', '-', '-', '-', '2018-06-30 04:22:33', '2018-06-30 04:22:33'),
(433, 'QORI', 17, NULL, '-', '-', '-', '-', '-', '', '-', '-', '-', '-', '2018-06-30 04:22:33', '2018-06-30 04:22:33'),
(434, 'RIZKI Q', 17, NULL, '-', '-', '-', '-', '-', '', '-', '-', '-', '-', '2018-06-30 04:22:33', '2018-06-30 04:22:33'),
(435, 'RIZKI S', 17, NULL, '-', '-', '-', '-', '-', '', '-', '-', '-', '-', '2018-06-30 04:22:33', '2018-06-30 04:22:33'),
(436, 'EFAN', 17, NULL, '-', '-', '-', '-', '-', '', '-', '-', '-', '-', '2018-06-30 04:22:33', '2018-06-30 04:22:33'),
(437, 'AULIA', 17, NULL, '-', '-', '-', '-', '-', '', '-', '-', '-', '-', '2018-06-30 04:22:33', '2018-06-30 04:22:33'),
(438, 'DIMAS', 17, NULL, '-', '-', '-', '-', '-', '', '-', '-', '-', '-', '2018-06-30 04:22:33', '2018-06-30 04:22:33'),
(439, 'FAUZAN', 17, NULL, '-', '-', '-', '-', '-', '', '-', '-', '-', '-', '2018-06-30 04:22:33', '2018-06-30 04:22:33'),
(440, 'HUDA FIRDAUS', 17, NULL, '-', '-', '-', '-', '-', '', '-', '-', '-', '-', '2018-06-30 04:22:33', '2018-06-30 04:22:33'),
(441, 'KHOIRUL HUDA', 17, NULL, '-', '-', '-', '-', '-', '', '-', '-', '-', '-', '2018-06-30 04:22:33', '2018-06-30 04:22:33'),
(442, 'IRFAN ', 17, NULL, '-', '-', '-', '-', '-', '', '-', '-', '-', '-', '2018-06-30 04:22:33', '2018-06-30 04:22:33'),
(443, 'DELLA', 17, NULL, '-', '-', '-', '-', '-', '', '-', '-', '-', '-', '2018-06-30 04:22:33', '2018-06-30 04:22:33'),
(444, 'LIA', 17, NULL, '-', '-', '-', '-', '-', '', '-', '-', '-', '-', '2018-06-30 04:22:33', '2018-06-30 04:22:33'),
(445, 'DINDA', 17, NULL, '-', '-', '-', '-', '-', '', '-', '-', '-', '-', '2018-06-30 04:22:33', '2018-06-30 04:22:33'),
(446, 'NISA', 17, NULL, '-', '-', '-', '-', '-', '', '-', '-', '-', '-', '2018-06-30 04:22:33', '2018-06-30 04:22:33'),
(447, 'ANJANI', 17, NULL, '-', '-', '-', '-', '-', '', '-', '-', '-', '-', '2018-06-30 04:22:33', '2018-06-30 04:22:33'),
(448, 'FITRIA', 17, NULL, '-', '-', '-', '-', '-', '', '-', '-', '-', '-', '2018-06-30 04:22:34', '2018-06-30 04:22:34'),
(449, 'INTAN ', 17, NULL, '-', '-', '-', '-', '-', '', '-', '-', '-', '-', '2018-06-30 04:22:34', '2018-06-30 04:22:34'),
(450, 'ANNA', 17, NULL, '-', '-', '-', '-', '-', '', '-', '-', '-', '-', '2018-06-30 04:22:34', '2018-06-30 04:22:34'),
(451, 'ANNIE', 17, NULL, '-', '-', '-', '-', '-', '', '-', '-', '-', '-', '2018-06-30 04:22:34', '2018-06-30 04:22:34'),
(452, 'ATIM', 17, NULL, '-', '-', '-', '-', '-', '', '-', '-', '-', '-', '2018-06-30 04:22:34', '2018-06-30 04:22:34'),
(453, 'CHINTIA', 17, NULL, '-', '-', '-', '-', '-', '', '-', '-', '-', '-', '2018-06-30 04:22:34', '2018-06-30 04:22:34'),
(454, 'DILLA', 17, NULL, '-', '-', '-', '-', '-', '', '-', '-', '-', '-', '2018-06-30 04:22:34', '2018-06-30 04:22:34'),
(455, 'DITHA', 17, NULL, '-', '-', '-', '-', '-', '', '-', '-', '-', '-', '2018-06-30 04:22:34', '2018-06-30 04:22:34'),
(456, 'IRMA', 17, NULL, '-', '-', '-', '-', '-', '', '-', '-', '-', '-', '2018-06-30 04:22:34', '2018-06-30 04:22:34'),
(457, 'HIDA', 17, NULL, '-', '-', '-', '-', '-', '', '-', '-', '-', '-', '2018-06-30 04:22:34', '2018-06-30 04:22:34'),
(458, 'IDA', 17, NULL, '-', '-', '-', '-', '-', '', '-', '-', '-', '-', '2018-06-30 04:22:34', '2018-06-30 04:22:34'),
(459, 'NIA', 17, NULL, '-', '-', '-', '-', '-', '', '-', '-', '-', '-', '2018-06-30 04:22:34', '2018-06-30 04:22:34'),
(460, 'PUPUT', 17, NULL, '-', '-', '-', '-', '-', '', '-', '-', '-', '-', '2018-06-30 04:22:34', '2018-06-30 04:22:34'),
(461, 'PUSPA', 17, NULL, '-', '-', '-', '-', '-', '', '-', '-', '-', '-', '2018-06-30 04:22:34', '2018-06-30 04:22:34'),
(462, 'SISKA', 17, NULL, '-', '-', '-', '-', '-', '', '-', '-', '-', '-', '2018-06-30 04:22:34', '2018-06-30 04:22:34'),
(463, 'TITIN', 17, NULL, '-', '-', '-', '-', '-', '', '-', '-', '-', '-', '2018-06-30 04:22:34', '2018-06-30 04:22:34'),
(464, 'WITA', 17, NULL, '-', '-', '-', '-', '-', '', '-', '-', '-', '-', '2018-06-30 04:22:34', '2018-06-30 04:22:34'),
(465, 'ANI', 17, NULL, '-', '-', '-', '-', '-', '', '-', '-', '-', '-', '2018-06-30 04:22:35', '2018-06-30 04:22:35'),
(466, 'ABI', 17, NULL, '-', '-', '-', '-', '-', '', '-', '-', '-', '-', '2018-06-30 04:22:35', '2018-06-30 04:22:35'),
(467, 'FURQON', 17, NULL, '-', '-', '-', '-', '-', '', '-', '-', '-', '-', '2018-06-30 04:22:35', '2018-06-30 04:22:35'),
(468, 'ISMAIL', 17, NULL, '-', '-', '-', '-', '-', '', '-', '-', '-', '-', '2018-06-30 04:22:35', '2018-06-30 04:22:35'),
(469, 'IZZA', 17, NULL, '-', '-', '-', '-', '-', '', '-', '-', '-', '-', '2018-06-30 04:22:35', '2018-06-30 04:22:35'),
(470, 'WANDA', 17, NULL, '-', '-', '-', '-', '-', '', '-', '-', '-', '-', '2018-06-30 04:22:35', '2018-06-30 04:22:35'),
(471, 'HADI', 17, NULL, '-', '-', '-', '-', '-', '', '-', '-', '-', '-', '2018-06-30 04:22:35', '2018-06-30 04:22:35'),
(472, 'RUAN', 17, NULL, '-', '-', '-', '-', '-', '', '-', '-', '-', '-', '2018-06-30 04:22:35', '2018-06-30 04:22:35'),
(473, 'SHOLIKIN', 17, NULL, '-', '-', '-', '-', '-', '', '-', '-', '-', '-', '2018-06-30 04:22:35', '2018-06-30 04:22:35'),
(474, 'RIZAL', 17, NULL, '-', '-', '-', '-', '-', '', '-', '-', '-', '-', '2018-06-30 04:22:35', '2018-06-30 04:22:35'),
(475, 'AHSAN', 17, NULL, '-', '-', '-', '-', '-', '', '-', '-', '-', '-', '2018-06-30 04:22:35', '2018-06-30 04:22:35'),
(476, 'LAILA', 17, NULL, '-', '-', '-', '-', '-', '', '-', '-', '-', '-', '2018-06-30 04:22:35', '2018-06-30 04:22:35'),
(477, 'OLIV', 17, NULL, '-', '-', '-', '-', '-', '', '-', '-', '-', '-', '2018-06-30 04:22:35', '2018-06-30 04:22:35'),
(478, 'LUTHFI', 17, NULL, '-', '-', '-', '-', '-', '', '-', '-', '-', '-', '2018-06-30 04:22:35', '2018-06-30 04:22:35'),
(479, 'AYU', 17, NULL, '-', '-', '-', '-', '-', '', '-', '-', '-', '-', '2018-06-30 04:22:35', '2018-06-30 04:22:35'),
(480, 'UMI', 20, NULL, '-', '-', '-', '-', '-', '', '-', '-', '-', '-', '2018-06-30 04:22:35', '2018-06-30 04:22:35'),
(481, 'NOPI', 20, NULL, '-', '-', '-', '-', '-', '', '-', '-', '-', '-', '2018-06-30 04:22:35', '2018-06-30 04:22:35'),
(482, 'INDAH', 20, NULL, '-', '-', '-', '-', '-', '', '-', '-', '-', '-', '2018-06-30 04:22:36', '2018-06-30 04:22:36'),
(483, 'YUS\'A', 20, NULL, '-', '-', '-', '-', '-', '', '-', '-', '-', '-', '2018-06-30 04:22:36', '2018-06-30 04:22:36'),
(484, 'DILA', 20, NULL, '-', '-', '-', '-', '-', '', '-', '-', '-', '-', '2018-06-30 04:22:36', '2018-06-30 04:22:36'),
(485, 'HUSNA', 20, NULL, '-', '-', '-', '-', '-', '', '-', '-', '-', '-', '2018-06-30 04:22:36', '2018-06-30 04:22:36'),
(486, 'TATA', 20, NULL, '-', '-', '-', '-', '-', '', '-', '-', '-', '-', '2018-06-30 04:22:36', '2018-06-30 04:22:36'),
(487, 'AZIZAH', 20, NULL, '-', '-', '-', '-', '-', '', '-', '-', '-', '-', '2018-06-30 04:22:36', '2018-06-30 04:22:36'),
(488, 'TIARA', 20, NULL, '-', '-', '-', '-', '-', '', '-', '-', '-', '-', '2018-06-30 04:22:36', '2018-06-30 04:22:36'),
(489, 'LUTFI', 20, NULL, '-', '-', '-', '-', '-', '', '-', '-', '-', '-', '2018-06-30 04:22:36', '2018-06-30 04:22:36'),
(490, 'FAUZUN', 20, NULL, '-', '-', '-', '-', '-', '', '-', '-', '-', '-', '2018-06-30 04:22:36', '2018-06-30 04:22:36'),
(491, 'OCI', 20, NULL, '-', '-', '-', '-', '-', '', '-', '-', '-', '-', '2018-06-30 04:22:36', '2018-06-30 04:22:36'),
(492, 'ARINI', 20, NULL, '-', '-', '-', '-', '-', '', '-', '-', '-', '-', '2018-06-30 04:22:36', '2018-06-30 04:22:36'),
(493, 'NAY', 20, NULL, '-', '-', '-', '-', '-', '', '-', '-', '-', '-', '2018-06-30 04:22:36', '2018-06-30 04:22:36'),
(494, 'RINDY', 20, NULL, '-', '-', '-', '-', '-', '', '-', '-', '-', '-', '2018-06-30 04:22:36', '2018-06-30 04:22:36'),
(495, 'TIWI', 20, NULL, '-', '-', '-', '-', '-', '', '-', '-', '-', '-', '2018-06-30 04:22:36', '2018-06-30 04:22:36'),
(496, 'LAILA', 20, NULL, '-', '-', '-', '-', '-', '', '-', '-', '-', '-', '2018-06-30 04:22:36', '2018-06-30 04:22:36'),
(497, 'LAILI', 20, NULL, '-', '-', '-', '-', '-', '', '-', '-', '-', '-', '2018-06-30 04:22:36', '2018-06-30 04:22:36'),
(498, 'WULAN', 20, NULL, '-', '-', '-', '-', '-', '', '-', '-', '-', '-', '2018-06-30 04:22:36', '2018-06-30 04:22:36'),
(499, 'NURUL', 20, NULL, '-', '-', '-', '-', '-', '', '-', '-', '-', '-', '2018-06-30 04:22:36', '2018-06-30 04:22:36'),
(500, 'ADE', 20, NULL, '-', '-', '-', '-', '-', '', '-', '-', '-', '-', '2018-06-30 04:22:36', '2018-06-30 04:22:36'),
(501, 'THALIA', 20, NULL, '-', '-', '-', '-', '-', '', '-', '-', '-', '-', '2018-06-30 04:22:36', '2018-06-30 04:22:36'),
(502, 'GISTA', 20, NULL, '-', '-', '-', '-', '-', '', '-', '-', '-', '-', '2018-06-30 04:22:36', '2018-06-30 04:22:36'),
(503, 'ANE', 20, NULL, '-', '-', '-', '-', '-', '', '-', '-', '-', '-', '2018-06-30 04:22:36', '2018-06-30 04:22:36'),
(504, 'ADE BONTANG', 20, NULL, '-', '-', '-', '-', '-', '', '-', '-', '-', '-', '2018-06-30 04:22:36', '2018-06-30 04:22:36'),
(505, 'YAYAN', 20, NULL, '-', '-', '-', '-', '-', '', '-', '-', '-', '-', '2018-06-30 04:22:36', '2018-06-30 04:22:36'),
(506, 'IRFAN', 20, NULL, '-', '-', '-', '-', '-', '', '-', '-', '-', '-', '2018-06-30 04:22:37', '2018-06-30 04:22:37'),
(507, 'WILDAN', 20, NULL, '-', '-', '-', '-', '-', '', '-', '-', '-', '-', '2018-06-30 04:22:37', '2018-06-30 04:22:37'),
(508, 'CHANDRA', 20, NULL, '-', '-', '-', '-', '-', '', '-', '-', '-', '-', '2018-06-30 04:22:37', '2018-06-30 04:22:37'),
(509, 'PRAS', 20, NULL, '-', '-', '-', '-', '-', '', '-', '-', '-', '-', '2018-06-30 04:22:37', '2018-06-30 04:22:37'),
(510, 'ROFIQ', 20, NULL, '-', '-', '-', '-', '-', '', '-', '-', '-', '-', '2018-06-30 04:22:37', '2018-06-30 04:22:37'),
(511, 'UNCUY', 20, NULL, '-', '-', '-', '-', '-', '', '-', '-', '-', '-', '2018-06-30 04:22:37', '2018-06-30 04:22:37'),
(512, 'ILHAM', 20, NULL, '-', '-', '-', '-', '-', '', '-', '-', '-', '-', '2018-06-30 04:22:37', '2018-06-30 04:22:37'),
(513, 'SHIDIQ', 20, NULL, '-', '-', '-', '-', '-', '', '-', '-', '-', '-', '2018-06-30 04:22:37', '2018-06-30 04:22:37'),
(514, 'ABIT KASMAL', 20, NULL, '-', '-', '-', '-', '-', '', '-', '-', '-', '-', '2018-06-30 04:22:37', '2018-06-30 04:22:37'),
(515, 'ARIS', 20, NULL, '-', '-', '-', '-', '-', '', '-', '-', '-', '-', '2018-06-30 04:22:37', '2018-06-30 04:22:37'),
(516, 'AHMAD', 20, NULL, '-', '-', '-', '-', '-', '', '-', '-', '-', '-', '2018-06-30 04:22:37', '2018-06-30 04:22:37'),
(517, 'SYARUDIN', 20, NULL, '-', '-', '-', '-', '-', '', '-', '-', '-', '-', '2018-06-30 04:22:37', '2018-06-30 04:22:37'),
(518, 'RIKO IBAD ABDULLOH', 20, NULL, '-', '-', '-', '-', '-', '', '-', '-', '-', '-', '2018-06-30 04:22:37', '2018-06-30 04:22:37'),
(519, 'FAHMI ABDUL HADID RAZAK', 20, NULL, '-', '-', '-', '-', '-', '', '-', '-', '-', '-', '2018-06-30 04:22:37', '2018-06-30 04:22:37'),
(520, 'DIMDIM', 20, NULL, '-', '-', '-', '-', '-', '', '-', '-', '-', '-', '2018-06-30 04:22:37', '2018-06-30 04:22:37'),
(521, 'ERIS SBL', 20, NULL, '-', '-', '-', '-', '-', '', '-', '-', '-', '-', '2018-06-30 04:22:37', '2018-06-30 04:22:37'),
(522, 'YOVI', 20, NULL, '-', '-', '-', '-', '-', '', '-', '-', '-', '-', '2018-06-30 04:22:37', '2018-06-30 04:22:37'),
(523, 'ABDI', 20, NULL, '-', '-', '-', '-', '-', '', '-', '-', '-', '-', '2018-06-30 04:22:37', '2018-06-30 04:22:37'),
(524, 'IRSYAD', 20, NULL, '-', '-', '-', '-', '-', '', '-', '-', '-', '-', '2018-06-30 04:22:37', '2018-06-30 04:22:37'),
(525, 'DILAN', 20, NULL, '-', '-', '-', '-', '-', '', '-', '-', '-', '-', '2018-06-30 04:22:37', '2018-06-30 04:22:37'),
(526, 'SANDHI', 20, NULL, '-', '-', '-', '-', '-', '', '-', '-', '-', '-', '2018-06-30 04:22:37', '2018-06-30 04:22:37'),
(527, 'ARYA', 20, NULL, '-', '-', '-', '-', '-', '', '-', '-', '-', '-', '2018-06-30 04:22:37', '2018-06-30 04:22:37'),
(528, 'DAVID', 20, NULL, '-', '-', '-', '-', '-', '', '-', '-', '-', '-', '2018-06-30 04:22:37', '2018-06-30 04:22:37'),
(529, 'GATRA', 20, NULL, '-', '-', '-', '-', '-', '', '-', '-', '-', '-', '2018-06-30 04:22:37', '2018-06-30 04:22:37'),
(530, 'RIJAL', 20, NULL, '-', '-', '-', '-', '-', '', '-', '-', '-', '-', '2018-06-30 04:22:37', '2018-06-30 04:22:37'),
(531, 'AQIB', 20, NULL, '-', '-', '-', '-', '-', '', '-', '-', '-', '-', '2018-06-30 04:22:38', '2018-06-30 04:22:38'),
(532, 'KHOIRULLI NURUL FATIMAH', 21, '2001-02-16', 'SAMARINDA', 'SAMBUTAN', 'perempuan', '081250349394', 'khoirullinurul.41@gmail.com', 'PERUM SAMBUTAN IDAMAN PERMAI PELITA 7 BLOK H4 NO.42 RT 30', '-', 'L', 'KEPUTRIAN KELOMPOK', 'PELAJAR', '2018-06-30 08:56:11', '2018-06-30 08:56:11'),
(533, 'SULTHON AULIA', 21, '2000-11-15', 'SAMARINDA', 'SAMBUTAN', 'laki-laki', '081258143385', 'tes@gmail.com', '-', '-', '-', 'TIM IT DAERAH', '-', '2018-06-30 17:04:39', '2018-06-30 09:04:39');

-- --------------------------------------------------------

--
-- Table structure for table `jadwal`
--

CREATE TABLE `jadwal` (
  `id_jadwal` int(11) NOT NULL,
  `id_kegiatan` int(11) NOT NULL,
  `nama_jadwal` varchar(50) NOT NULL,
  `hari` varchar(35) NOT NULL,
  `keterangan` text NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `jadwal`
--

INSERT INTO `jadwal` (`id_jadwal`, `id_kegiatan`, `nama_jadwal`, `hari`, `keterangan`, `created_at`, `updated_at`) VALUES
(1, 1, 'Pagi', 'Sabtu, 30 Juni 2018', 'Pemateri lorem ipsum', '2018-06-30 05:19:21', '2018-06-30 05:19:21');

-- --------------------------------------------------------

--
-- Table structure for table `kegiatan`
--

CREATE TABLE `kegiatan` (
  `id_kegiatan` int(11) NOT NULL,
  `nama_kegiatan` varchar(70) NOT NULL,
  `tanggal_kegiatan` date NOT NULL,
  `lokasi_kegiatan` text NOT NULL,
  `status_kegiatan` int(1) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `kegiatan`
--

INSERT INTO `kegiatan` (`id_kegiatan`, `nama_kegiatan`, `tanggal_kegiatan`, `lokasi_kegiatan`, `status_kegiatan`, `created_at`, `updated_at`) VALUES
(1, 'CINTA ALAM INDONESIA', '2018-07-01', 'Ponpes Al-Aziziah', 1, '2018-06-30 04:56:48', '2018-07-01 00:15:50');

-- --------------------------------------------------------

--
-- Table structure for table `kegiatan_detail`
--

CREATE TABLE `kegiatan_detail` (
  `id_detail` int(11) NOT NULL,
  `id_kegiatan` int(11) NOT NULL,
  `code_barcode` varchar(100) NOT NULL,
  `id_anggota` int(11) NOT NULL,
  `ket` varchar(30) NOT NULL,
  `id_users` int(3) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `kegiatan_detail`
--

INSERT INTO `kegiatan_detail` (`id_detail`, `id_kegiatan`, `code_barcode`, `id_anggota`, `ket`, `id_users`, `created_at`, `updated_at`) VALUES
(1, 1, '2941533150001', 26, 'peserta', 1, '2018-06-30 04:58:19', '2018-06-30 04:58:19'),
(2, 1, '2941533150002', 27, 'peserta', 1, '2018-06-30 04:58:19', '2018-06-30 04:58:19'),
(3, 1, '2941533150003', 41, 'peserta', 1, '2018-06-30 04:58:19', '2018-06-30 04:58:19'),
(4, 1, '2941533150004', 32, 'peserta', 1, '2018-06-30 05:00:00', '2018-06-30 05:00:00'),
(5, 1, '2941533150005', 33, 'peserta', 1, '2018-06-30 05:00:00', '2018-06-30 05:00:00'),
(6, 1, '2941533150006', 34, 'peserta', 1, '2018-06-30 05:00:00', '2018-06-30 05:00:00'),
(7, 1, '2941533150007', 1, 'peserta', 1, '2018-06-30 05:01:36', '2018-06-30 05:01:36'),
(8, 1, '2941533150008', 2, 'peserta', 1, '2018-06-30 05:01:36', '2018-06-30 05:01:36'),
(9, 1, '2941533150009', 3, 'peserta', 1, '2018-06-30 05:01:36', '2018-06-30 05:01:36'),
(10, 1, '2941533150010', 60, 'peserta', 1, '2018-06-30 05:02:10', '2018-06-30 05:02:10'),
(11, 1, '2941533150011', 62, 'peserta', 1, '2018-06-30 05:02:10', '2018-06-30 05:02:10'),
(12, 1, '2941533150012', 81, 'peserta', 1, '2018-06-30 05:02:10', '2018-06-30 05:02:10'),
(13, 1, '2941533150013', 38, 'peserta', 1, '2018-06-30 05:02:48', '2018-06-30 05:02:48'),
(14, 1, '2941533150014', 39, 'peserta', 1, '2018-06-30 05:02:48', '2018-06-30 05:02:48'),
(15, 1, '2941533150015', 40, 'peserta', 1, '2018-06-30 05:02:48', '2018-06-30 05:02:48'),
(16, 1, '2941533150016', 59, 'peserta', 1, '2018-06-30 05:02:49', '2018-06-30 05:02:49'),
(17, 1, '2941533150017', 53, 'peserta', 1, '2018-06-30 05:04:24', '2018-06-30 05:04:24'),
(18, 1, '2941533150018', 54, 'peserta', 1, '2018-06-30 05:04:24', '2018-06-30 05:04:24'),
(19, 1, '2941533150019', 55, 'peserta', 1, '2018-06-30 05:04:24', '2018-06-30 05:04:24'),
(20, 1, '2941533150020', 56, 'peserta', 1, '2018-06-30 05:04:24', '2018-06-30 05:04:24'),
(21, 1, '2941533150021', 57, 'peserta', 1, '2018-06-30 05:04:24', '2018-06-30 05:04:24'),
(22, 1, '2941533150022', 24, 'peserta', 1, '2018-06-30 05:04:46', '2018-06-30 05:04:46'),
(23, 1, '2941533150023', 25, 'peserta', 1, '2018-06-30 05:04:46', '2018-06-30 05:04:46'),
(24, 1, '2941533150024', 35, 'peserta', 1, '2018-06-30 05:04:46', '2018-06-30 05:04:46'),
(25, 1, '2941533150025', 83, 'peserta', 1, '2018-06-30 05:04:46', '2018-06-30 05:04:46'),
(26, 1, '2941533150026', 8, 'peserta', 1, '2018-06-30 05:05:09', '2018-06-30 05:05:09'),
(27, 1, '2941533150027', 9, 'peserta', 1, '2018-06-30 05:05:09', '2018-06-30 05:05:09'),
(28, 1, '2941533150028', 10, 'peserta', 1, '2018-06-30 05:05:09', '2018-06-30 05:05:09'),
(30, 1, '2941533150029', 65, 'peserta', 1, '2018-06-30 08:19:20', '2018-06-30 08:19:20'),
(31, 1, '2941533150030', 71, 'peserta', 1, '2018-06-30 08:19:20', '2018-06-30 08:19:20'),
(32, 1, '2941533150031', 31, 'peserta', 1, '2018-06-30 08:22:22', '2018-06-30 08:22:22'),
(33, 1, '2941533150032', 42, 'peserta', 1, '2018-06-30 08:22:22', '2018-06-30 08:22:22'),
(34, 1, '2941533150033', 43, 'peserta', 1, '2018-06-30 08:22:22', '2018-06-30 08:22:22'),
(35, 1, '2941533150034', 44, 'peserta', 1, '2018-06-30 08:22:22', '2018-06-30 08:22:22'),
(36, 1, '2941533150035', 82, 'peserta', 1, '2018-06-30 08:22:22', '2018-06-30 08:22:22'),
(37, 1, '2941533150036', 61, 'peserta', 1, '2018-06-30 08:22:40', '2018-06-30 08:22:40'),
(38, 1, '2941533150037', 63, 'peserta', 1, '2018-06-30 08:22:41', '2018-06-30 08:22:41'),
(39, 1, '2941533150038', 64, 'peserta', 1, '2018-06-30 08:22:41', '2018-06-30 08:22:41'),
(40, 1, '2941533150039', 15, 'peserta', 1, '2018-06-30 08:22:56', '2018-06-30 08:22:56'),
(41, 1, '2941533150040', 16, 'peserta', 1, '2018-06-30 08:22:56', '2018-06-30 08:22:56'),
(42, 1, '2941533150041', 18, 'peserta', 1, '2018-06-30 08:22:57', '2018-06-30 08:22:57'),
(43, 1, '2941533150042', 36, 'peserta', 1, '2018-06-30 08:23:19', '2018-06-30 08:23:19'),
(44, 1, '2941533150043', 37, 'peserta', 1, '2018-06-30 08:23:19', '2018-06-30 08:23:19'),
(45, 1, '2941533150044', 45, 'peserta', 1, '2018-06-30 08:23:19', '2018-06-30 08:23:19'),
(46, 1, '2941533150045', 13, 'peserta', 1, '2018-06-30 08:23:39', '2018-06-30 08:23:39'),
(47, 1, '2941533150046', 14, 'peserta', 1, '2018-06-30 08:23:39', '2018-06-30 08:23:39'),
(48, 1, '2941533150047', 17, 'peserta', 1, '2018-06-30 08:23:39', '2018-06-30 08:23:39'),
(49, 1, '2941533150048', 19, 'peserta', 1, '2018-06-30 08:23:39', '2018-06-30 08:23:39'),
(50, 1, '2941533150049', 21, 'peserta', 1, '2018-06-30 08:23:56', '2018-06-30 08:23:56'),
(51, 1, '2941533150050', 22, 'peserta', 1, '2018-06-30 08:23:56', '2018-06-30 08:23:56'),
(52, 1, '2941533150051', 66, 'peserta', 1, '2018-06-30 08:23:56', '2018-06-30 08:23:56'),
(53, 1, '2941533150052', 67, 'peserta', 1, '2018-06-30 08:31:17', '2018-06-30 08:31:17'),
(54, 1, '2941533150053', 68, 'peserta', 1, '2018-06-30 08:31:17', '2018-06-30 08:31:17'),
(55, 1, '2941533150054', 69, 'peserta', 1, '2018-06-30 08:31:17', '2018-06-30 08:31:17'),
(56, 1, '2941533150055', 70, 'peserta', 1, '2018-06-30 08:31:17', '2018-06-30 08:31:17'),
(57, 1, '2941533150056', 72, 'peserta', 1, '2018-06-30 08:31:17', '2018-06-30 08:31:17'),
(58, 1, '2941533150057', 428, 'peserta', 1, '2018-06-30 08:32:30', '2018-06-30 08:32:30'),
(59, 1, '2941533150058', 429, 'peserta', 1, '2018-06-30 08:32:30', '2018-06-30 08:32:30'),
(60, 1, '2941533150059', 430, 'peserta', 1, '2018-06-30 08:32:30', '2018-06-30 08:32:30'),
(61, 1, '2941533150060', 431, 'peserta', 1, '2018-06-30 08:32:30', '2018-06-30 08:32:30'),
(62, 1, '2941533150061', 432, 'peserta', 1, '2018-06-30 08:32:30', '2018-06-30 08:32:30'),
(63, 1, '2941533150062', 433, 'peserta', 1, '2018-06-30 08:32:30', '2018-06-30 08:32:30'),
(64, 1, '2941533150063', 434, 'peserta', 1, '2018-06-30 08:32:31', '2018-06-30 08:32:31'),
(65, 1, '2941533150064', 435, 'peserta', 1, '2018-06-30 08:32:31', '2018-06-30 08:32:31'),
(66, 1, '2941533150065', 436, 'peserta', 1, '2018-06-30 08:32:31', '2018-06-30 08:32:31'),
(67, 1, '2941533150066', 437, 'peserta', 1, '2018-06-30 08:32:31', '2018-06-30 08:32:31'),
(68, 1, '2941533150067', 438, 'peserta', 1, '2018-06-30 08:32:31', '2018-06-30 08:32:31'),
(69, 1, '2941533150068', 439, 'peserta', 1, '2018-06-30 08:32:31', '2018-06-30 08:32:31'),
(70, 1, '2941533150069', 440, 'peserta', 1, '2018-06-30 08:32:31', '2018-06-30 08:32:31'),
(71, 1, '2941533150070', 441, 'peserta', 1, '2018-06-30 08:32:31', '2018-06-30 08:32:31'),
(72, 1, '2941533150071', 442, 'peserta', 1, '2018-06-30 08:32:31', '2018-06-30 08:32:31'),
(73, 1, '2941533150072', 443, 'peserta', 1, '2018-06-30 08:32:31', '2018-06-30 08:32:31'),
(74, 1, '2941533150073', 444, 'peserta', 1, '2018-06-30 08:32:31', '2018-06-30 08:32:31'),
(75, 1, '2941533150074', 445, 'peserta', 1, '2018-06-30 08:32:31', '2018-06-30 08:32:31'),
(76, 1, '2941533150075', 446, 'peserta', 1, '2018-06-30 08:32:31', '2018-06-30 08:32:31'),
(77, 1, '2941533150076', 447, 'peserta', 1, '2018-06-30 08:32:32', '2018-06-30 08:32:32'),
(78, 1, '2941533150077', 448, 'peserta', 1, '2018-06-30 08:32:32', '2018-06-30 08:32:32'),
(79, 1, '2941533150078', 449, 'peserta', 1, '2018-06-30 08:32:32', '2018-06-30 08:32:32'),
(80, 1, '2941533150079', 450, 'peserta', 1, '2018-06-30 08:32:32', '2018-06-30 08:32:32'),
(81, 1, '2941533150080', 451, 'peserta', 1, '2018-06-30 08:32:32', '2018-06-30 08:32:32'),
(82, 1, '2941533150081', 452, 'peserta', 1, '2018-06-30 08:32:32', '2018-06-30 08:32:32'),
(83, 1, '2941533150082', 453, 'peserta', 1, '2018-06-30 08:32:32', '2018-06-30 08:32:32'),
(84, 1, '2941533150083', 454, 'peserta', 1, '2018-06-30 08:32:32', '2018-06-30 08:32:32'),
(85, 1, '2941533150084', 455, 'peserta', 1, '2018-06-30 08:32:32', '2018-06-30 08:32:32'),
(86, 1, '2941533150085', 456, 'peserta', 1, '2018-06-30 08:32:32', '2018-06-30 08:32:32'),
(87, 1, '2941533150086', 457, 'peserta', 1, '2018-06-30 08:32:32', '2018-06-30 08:32:32'),
(88, 1, '2941533150087', 458, 'peserta', 1, '2018-06-30 08:32:32', '2018-06-30 08:32:32'),
(89, 1, '2941533150088', 459, 'peserta', 1, '2018-06-30 08:32:32', '2018-06-30 08:32:32'),
(90, 1, '2941533150089', 460, 'peserta', 1, '2018-06-30 08:32:32', '2018-06-30 08:32:32'),
(91, 1, '2941533150090', 461, 'peserta', 1, '2018-06-30 08:32:32', '2018-06-30 08:32:32'),
(92, 1, '2941533150091', 462, 'peserta', 1, '2018-06-30 08:32:32', '2018-06-30 08:32:32'),
(93, 1, '2941533150092', 463, 'peserta', 1, '2018-06-30 08:32:32', '2018-06-30 08:32:32'),
(94, 1, '2941533150093', 464, 'peserta', 1, '2018-06-30 08:32:32', '2018-06-30 08:32:32'),
(95, 1, '2941533150094', 465, 'peserta', 1, '2018-06-30 08:32:32', '2018-06-30 08:32:32'),
(96, 1, '2941533150095', 466, 'peserta', 1, '2018-06-30 08:32:32', '2018-06-30 08:32:32'),
(97, 1, '2941533150096', 467, 'peserta', 1, '2018-06-30 08:32:32', '2018-06-30 08:32:32'),
(98, 1, '2941533150097', 468, 'peserta', 1, '2018-06-30 08:32:32', '2018-06-30 08:32:32'),
(99, 1, '2941533150098', 469, 'peserta', 1, '2018-06-30 08:32:32', '2018-06-30 08:32:32'),
(100, 1, '2941533150099', 470, 'peserta', 1, '2018-06-30 08:32:33', '2018-06-30 08:32:33'),
(101, 1, '2941533150100', 471, 'peserta', 1, '2018-06-30 08:32:33', '2018-06-30 08:32:33'),
(102, 1, '2941533150101', 472, 'peserta', 1, '2018-06-30 08:32:33', '2018-06-30 08:32:33'),
(103, 1, '2941533150102', 473, 'peserta', 1, '2018-06-30 08:32:33', '2018-06-30 08:32:33'),
(104, 1, '2941533150103', 474, 'peserta', 1, '2018-06-30 08:32:33', '2018-06-30 08:32:33'),
(105, 1, '2941533150104', 475, 'peserta', 1, '2018-06-30 08:32:33', '2018-06-30 08:32:33'),
(106, 1, '2941533150105', 476, 'peserta', 1, '2018-06-30 08:32:33', '2018-06-30 08:32:33'),
(107, 1, '2941533150106', 477, 'peserta', 1, '2018-06-30 08:32:33', '2018-06-30 08:32:33'),
(108, 1, '2941533150107', 478, 'peserta', 1, '2018-06-30 08:32:33', '2018-06-30 08:32:33'),
(109, 1, '2941533150108', 479, 'peserta', 1, '2018-06-30 08:32:33', '2018-06-30 08:32:33'),
(110, 1, '2941533150109', 248, 'peserta', 1, '2018-06-30 08:34:06', '2018-06-30 08:34:06'),
(111, 1, '2941533150110', 249, 'peserta', 1, '2018-06-30 08:34:06', '2018-06-30 08:34:06'),
(112, 1, '2941533150111', 250, 'peserta', 1, '2018-06-30 08:34:06', '2018-06-30 08:34:06'),
(113, 1, '2941533150112', 251, 'peserta', 1, '2018-06-30 08:34:07', '2018-06-30 08:34:07'),
(114, 1, '2941533150113', 252, 'peserta', 1, '2018-06-30 08:34:07', '2018-06-30 08:34:07'),
(115, 1, '2941533150114', 253, 'peserta', 1, '2018-06-30 08:34:07', '2018-06-30 08:34:07'),
(116, 1, '2941533150115', 254, 'peserta', 1, '2018-06-30 08:34:07', '2018-06-30 08:34:07'),
(117, 1, '2941533150116', 255, 'peserta', 1, '2018-06-30 08:34:07', '2018-06-30 08:34:07'),
(118, 1, '2941533150117', 256, 'peserta', 1, '2018-06-30 08:34:07', '2018-06-30 08:34:07'),
(119, 1, '2941533150118', 257, 'peserta', 1, '2018-06-30 08:34:07', '2018-06-30 08:34:07'),
(120, 1, '2941533150119', 258, 'peserta', 1, '2018-06-30 08:34:07', '2018-06-30 08:34:07'),
(121, 1, '2941533150120', 259, 'peserta', 1, '2018-06-30 08:34:07', '2018-06-30 08:34:07'),
(122, 1, '2941533150121', 260, 'peserta', 1, '2018-06-30 08:34:07', '2018-06-30 08:34:07'),
(123, 1, '2941533150122', 261, 'peserta', 1, '2018-06-30 08:34:07', '2018-06-30 08:34:07'),
(124, 1, '2941533150123', 262, 'peserta', 1, '2018-06-30 08:34:07', '2018-06-30 08:34:07'),
(125, 1, '2941533150124', 263, 'peserta', 1, '2018-06-30 08:34:07', '2018-06-30 08:34:07'),
(126, 1, '2941533150125', 264, 'peserta', 1, '2018-06-30 08:34:07', '2018-06-30 08:34:07'),
(127, 1, '2941533150126', 265, 'peserta', 1, '2018-06-30 08:34:07', '2018-06-30 08:34:07'),
(128, 1, '2941533150127', 266, 'peserta', 1, '2018-06-30 08:34:07', '2018-06-30 08:34:07'),
(129, 1, '2941533150128', 267, 'peserta', 1, '2018-06-30 08:34:07', '2018-06-30 08:34:07'),
(130, 1, '2941533150129', 268, 'peserta', 1, '2018-06-30 08:34:07', '2018-06-30 08:34:07'),
(131, 1, '2941533150130', 269, 'peserta', 1, '2018-06-30 08:34:08', '2018-06-30 08:34:08'),
(132, 1, '2941533150131', 270, 'peserta', 1, '2018-06-30 08:34:08', '2018-06-30 08:34:08'),
(133, 1, '2941533150132', 271, 'peserta', 1, '2018-06-30 08:34:08', '2018-06-30 08:34:08'),
(134, 1, '2941533150133', 272, 'peserta', 1, '2018-06-30 08:34:08', '2018-06-30 08:34:08'),
(135, 1, '2941533150134', 273, 'peserta', 1, '2018-06-30 08:34:08', '2018-06-30 08:34:08'),
(136, 1, '2941533150135', 274, 'peserta', 1, '2018-06-30 08:34:08', '2018-06-30 08:34:08'),
(137, 1, '2941533150136', 275, 'peserta', 1, '2018-06-30 08:34:08', '2018-06-30 08:34:08'),
(138, 1, '2941533150137', 276, 'peserta', 1, '2018-06-30 08:34:08', '2018-06-30 08:34:08'),
(139, 1, '2941533150138', 277, 'peserta', 1, '2018-06-30 08:34:08', '2018-06-30 08:34:08'),
(140, 1, '2941533150139', 278, 'peserta', 1, '2018-06-30 08:34:08', '2018-06-30 08:34:08'),
(141, 1, '2941533150140', 279, 'peserta', 1, '2018-06-30 08:34:08', '2018-06-30 08:34:08'),
(142, 1, '2941533150141', 280, 'peserta', 1, '2018-06-30 08:34:08', '2018-06-30 08:34:08'),
(143, 1, '2941533150142', 281, 'peserta', 1, '2018-06-30 08:34:08', '2018-06-30 08:34:08'),
(144, 1, '2941533150143', 282, 'peserta', 1, '2018-06-30 08:34:08', '2018-06-30 08:34:08'),
(145, 1, '2941533150144', 283, 'peserta', 1, '2018-06-30 08:34:08', '2018-06-30 08:34:08'),
(146, 1, '2941533150145', 284, 'peserta', 1, '2018-06-30 08:34:08', '2018-06-30 08:34:08'),
(147, 1, '2941533150146', 285, 'peserta', 1, '2018-06-30 08:34:08', '2018-06-30 08:34:08'),
(148, 1, '2941533150147', 286, 'peserta', 1, '2018-06-30 08:34:08', '2018-06-30 08:34:08'),
(149, 1, '2941533150148', 287, 'peserta', 1, '2018-06-30 08:34:08', '2018-06-30 08:34:08'),
(150, 1, '2941533150149', 288, 'peserta', 1, '2018-06-30 08:34:08', '2018-06-30 08:34:08'),
(151, 1, '2941533150150', 289, 'peserta', 1, '2018-06-30 08:34:08', '2018-06-30 08:34:08'),
(152, 1, '2941533150151', 290, 'peserta', 1, '2018-06-30 08:34:08', '2018-06-30 08:34:08'),
(153, 1, '2941533150152', 291, 'peserta', 1, '2018-06-30 08:34:08', '2018-06-30 08:34:08'),
(154, 1, '2941533150153', 292, 'peserta', 1, '2018-06-30 08:34:08', '2018-06-30 08:34:08'),
(155, 1, '2941533150154', 293, 'peserta', 1, '2018-06-30 08:34:08', '2018-06-30 08:34:08'),
(156, 1, '2941533150155', 294, 'peserta', 1, '2018-06-30 08:34:08', '2018-06-30 08:34:08'),
(157, 1, '2941533150156', 295, 'peserta', 1, '2018-06-30 08:34:09', '2018-06-30 08:34:09'),
(158, 1, '2941533150157', 296, 'peserta', 1, '2018-06-30 08:34:09', '2018-06-30 08:34:09'),
(159, 1, '2941533150158', 297, 'peserta', 1, '2018-06-30 08:34:09', '2018-06-30 08:34:09'),
(160, 1, '2941533150159', 298, 'peserta', 1, '2018-06-30 08:34:09', '2018-06-30 08:34:09'),
(161, 1, '2941533150160', 299, 'peserta', 1, '2018-06-30 08:34:09', '2018-06-30 08:34:09'),
(162, 1, '2941533150161', 300, 'peserta', 1, '2018-06-30 08:34:09', '2018-06-30 08:34:09'),
(163, 1, '2941533150162', 301, 'peserta', 1, '2018-06-30 08:34:09', '2018-06-30 08:34:09'),
(164, 1, '2941533150163', 302, 'peserta', 1, '2018-06-30 08:34:09', '2018-06-30 08:34:09'),
(165, 1, '2941533150164', 303, 'peserta', 1, '2018-06-30 08:34:09', '2018-06-30 08:34:09'),
(166, 1, '2941533150165', 304, 'peserta', 1, '2018-06-30 08:34:09', '2018-06-30 08:34:09'),
(167, 1, '2941533150166', 305, 'peserta', 1, '2018-06-30 08:34:09', '2018-06-30 08:34:09'),
(168, 1, '2941533150167', 306, 'peserta', 1, '2018-06-30 08:34:09', '2018-06-30 08:34:09'),
(169, 1, '2941533150168', 307, 'peserta', 1, '2018-06-30 08:34:09', '2018-06-30 08:34:09'),
(170, 1, '2941533150169', 308, 'peserta', 1, '2018-06-30 08:34:09', '2018-06-30 08:34:09'),
(171, 1, '2941533150170', 309, 'peserta', 1, '2018-06-30 08:34:09', '2018-06-30 08:34:09'),
(172, 1, '2941533150171', 310, 'peserta', 1, '2018-06-30 08:34:09', '2018-06-30 08:34:09'),
(173, 1, '2941533150172', 311, 'peserta', 1, '2018-06-30 08:34:09', '2018-06-30 08:34:09'),
(174, 1, '2941533150173', 312, 'peserta', 1, '2018-06-30 08:34:09', '2018-06-30 08:34:09'),
(175, 1, '2941533150174', 313, 'peserta', 1, '2018-06-30 08:34:09', '2018-06-30 08:34:09'),
(176, 1, '2941533150175', 314, 'peserta', 1, '2018-06-30 08:34:09', '2018-06-30 08:34:09'),
(177, 1, '2941533150176', 315, 'peserta', 1, '2018-06-30 08:34:09', '2018-06-30 08:34:09'),
(178, 1, '2941533150177', 316, 'peserta', 1, '2018-06-30 08:34:09', '2018-06-30 08:34:09'),
(179, 1, '2941533150178', 317, 'peserta', 1, '2018-06-30 08:34:09', '2018-06-30 08:34:09'),
(180, 1, '2941533150179', 318, 'peserta', 1, '2018-06-30 08:34:09', '2018-06-30 08:34:09'),
(181, 1, '2941533150180', 319, 'peserta', 1, '2018-06-30 08:34:09', '2018-06-30 08:34:09'),
(182, 1, '2941533150181', 320, 'peserta', 1, '2018-06-30 08:34:10', '2018-06-30 08:34:10'),
(183, 1, '2941533150182', 321, 'peserta', 1, '2018-06-30 08:34:10', '2018-06-30 08:34:10'),
(184, 1, '2941533150183', 322, 'peserta', 1, '2018-06-30 08:34:10', '2018-06-30 08:34:10'),
(185, 1, '2941533150184', 323, 'peserta', 1, '2018-06-30 08:34:10', '2018-06-30 08:34:10'),
(186, 1, '2941533150185', 324, 'peserta', 1, '2018-06-30 08:34:10', '2018-06-30 08:34:10'),
(187, 1, '2941533150186', 325, 'peserta', 1, '2018-06-30 08:34:10', '2018-06-30 08:34:10'),
(188, 1, '2941533150187', 326, 'peserta', 1, '2018-06-30 08:34:10', '2018-06-30 08:34:10'),
(189, 1, '2941533150188', 327, 'peserta', 1, '2018-06-30 08:34:10', '2018-06-30 08:34:10'),
(190, 1, '2941533150189', 328, 'peserta', 1, '2018-06-30 08:34:10', '2018-06-30 08:34:10'),
(191, 1, '2941533150190', 329, 'peserta', 1, '2018-06-30 08:34:10', '2018-06-30 08:34:10'),
(192, 1, '2941533150191', 330, 'peserta', 1, '2018-06-30 08:34:10', '2018-06-30 08:34:10'),
(193, 1, '2941533150192', 331, 'peserta', 1, '2018-06-30 08:34:10', '2018-06-30 08:34:10'),
(194, 1, '2941533150193', 332, 'peserta', 1, '2018-06-30 08:34:10', '2018-06-30 08:34:10'),
(195, 1, '2941533150194', 333, 'peserta', 1, '2018-06-30 08:34:10', '2018-06-30 08:34:10'),
(196, 1, '2941533150195', 334, 'peserta', 1, '2018-06-30 08:34:10', '2018-06-30 08:34:10'),
(197, 1, '2941533150196', 335, 'peserta', 1, '2018-06-30 08:34:10', '2018-06-30 08:34:10'),
(198, 1, '2941533150197', 336, 'peserta', 1, '2018-06-30 08:34:10', '2018-06-30 08:34:10'),
(199, 1, '2941533150198', 337, 'peserta', 1, '2018-06-30 08:34:10', '2018-06-30 08:34:10'),
(200, 1, '2941533150199', 338, 'peserta', 1, '2018-06-30 08:34:10', '2018-06-30 08:34:10'),
(201, 1, '2941533150200', 339, 'peserta', 1, '2018-06-30 08:34:10', '2018-06-30 08:34:10'),
(202, 1, '2941533150201', 340, 'peserta', 1, '2018-06-30 08:34:10', '2018-06-30 08:34:10'),
(203, 1, '2941533150202', 341, 'peserta', 1, '2018-06-30 08:34:10', '2018-06-30 08:34:10'),
(204, 1, '2941533150203', 342, 'peserta', 1, '2018-06-30 08:34:10', '2018-06-30 08:34:10'),
(205, 1, '2941533150204', 343, 'peserta', 1, '2018-06-30 08:34:10', '2018-06-30 08:34:10'),
(206, 1, '2941533150205', 344, 'peserta', 1, '2018-06-30 08:34:10', '2018-06-30 08:34:10'),
(207, 1, '2941533150206', 345, 'peserta', 1, '2018-06-30 08:34:10', '2018-06-30 08:34:10'),
(208, 1, '2941533150207', 346, 'peserta', 1, '2018-06-30 08:34:11', '2018-06-30 08:34:11'),
(209, 1, '2941533150208', 347, 'peserta', 1, '2018-06-30 08:34:11', '2018-06-30 08:34:11'),
(210, 1, '2941533150209', 348, 'peserta', 1, '2018-06-30 08:34:11', '2018-06-30 08:34:11'),
(211, 1, '2941533150210', 349, 'peserta', 1, '2018-06-30 08:34:11', '2018-06-30 08:34:11'),
(212, 1, '2941533150211', 350, 'peserta', 1, '2018-06-30 08:34:11', '2018-06-30 08:34:11'),
(213, 1, '2941533150212', 351, 'peserta', 1, '2018-06-30 08:34:11', '2018-06-30 08:34:11'),
(214, 1, '2941533150213', 352, 'peserta', 1, '2018-06-30 08:34:11', '2018-06-30 08:34:11'),
(215, 1, '2941533150214', 353, 'peserta', 1, '2018-06-30 08:34:11', '2018-06-30 08:34:11'),
(216, 1, '2941533150215', 354, 'peserta', 1, '2018-06-30 08:34:11', '2018-06-30 08:34:11'),
(217, 1, '2941533150216', 355, 'peserta', 1, '2018-06-30 08:35:07', '2018-06-30 08:35:07'),
(218, 1, '2941533150217', 356, 'peserta', 1, '2018-06-30 08:35:07', '2018-06-30 08:35:07'),
(219, 1, '2941533150218', 357, 'peserta', 1, '2018-06-30 08:35:07', '2018-06-30 08:35:07'),
(220, 1, '2941533150219', 358, 'peserta', 1, '2018-06-30 08:35:07', '2018-06-30 08:35:07'),
(221, 1, '2941533150220', 359, 'peserta', 1, '2018-06-30 08:35:07', '2018-06-30 08:35:07'),
(222, 1, '2941533150221', 360, 'peserta', 1, '2018-06-30 08:35:07', '2018-06-30 08:35:07'),
(223, 1, '2941533150222', 361, 'peserta', 1, '2018-06-30 08:35:07', '2018-06-30 08:35:07'),
(224, 1, '2941533150223', 362, 'peserta', 1, '2018-06-30 08:35:07', '2018-06-30 08:35:07'),
(225, 1, '2941533150224', 363, 'peserta', 1, '2018-06-30 08:35:07', '2018-06-30 08:35:07'),
(226, 1, '2941533150225', 364, 'peserta', 1, '2018-06-30 08:35:07', '2018-06-30 08:35:07'),
(227, 1, '2941533150226', 365, 'peserta', 1, '2018-06-30 08:35:07', '2018-06-30 08:35:07'),
(228, 1, '2941533150227', 366, 'peserta', 1, '2018-06-30 08:35:07', '2018-06-30 08:35:07'),
(229, 1, '2941533150228', 367, 'peserta', 1, '2018-06-30 08:35:07', '2018-06-30 08:35:07'),
(230, 1, '2941533150229', 368, 'peserta', 1, '2018-06-30 08:35:07', '2018-06-30 08:35:07'),
(231, 1, '2941533150230', 369, 'peserta', 1, '2018-06-30 08:35:07', '2018-06-30 08:35:07'),
(232, 1, '2941533150231', 370, 'peserta', 1, '2018-06-30 08:35:07', '2018-06-30 08:35:07'),
(233, 1, '2941533150232', 371, 'peserta', 1, '2018-06-30 08:35:07', '2018-06-30 08:35:07'),
(234, 1, '2941533150233', 372, 'peserta', 1, '2018-06-30 08:35:07', '2018-06-30 08:35:07'),
(235, 1, '2941533150234', 373, 'peserta', 1, '2018-06-30 08:35:07', '2018-06-30 08:35:07'),
(236, 1, '2941533150235', 374, 'peserta', 1, '2018-06-30 08:35:08', '2018-06-30 08:35:08'),
(237, 1, '2941533150236', 375, 'peserta', 1, '2018-06-30 08:35:08', '2018-06-30 08:35:08'),
(238, 1, '2941533150237', 376, 'peserta', 1, '2018-06-30 08:35:08', '2018-06-30 08:35:08'),
(239, 1, '2941533150238', 377, 'peserta', 1, '2018-06-30 08:35:08', '2018-06-30 08:35:08'),
(240, 1, '2941533150239', 378, 'peserta', 1, '2018-06-30 08:35:08', '2018-06-30 08:35:08'),
(241, 1, '2941533150240', 379, 'peserta', 1, '2018-06-30 08:35:08', '2018-06-30 08:35:08'),
(242, 1, '2941533150241', 380, 'peserta', 1, '2018-06-30 08:35:08', '2018-06-30 08:35:08'),
(243, 1, '2941533150242', 381, 'peserta', 1, '2018-06-30 08:35:08', '2018-06-30 08:35:08'),
(244, 1, '2941533150243', 382, 'peserta', 1, '2018-06-30 08:35:08', '2018-06-30 08:35:08'),
(245, 1, '2941533150244', 383, 'peserta', 1, '2018-06-30 08:35:08', '2018-06-30 08:35:08'),
(246, 1, '2941533150245', 384, 'peserta', 1, '2018-06-30 08:35:08', '2018-06-30 08:35:08'),
(247, 1, '2941533150246', 385, 'peserta', 1, '2018-06-30 08:35:08', '2018-06-30 08:35:08'),
(248, 1, '2941533150247', 386, 'peserta', 1, '2018-06-30 08:35:08', '2018-06-30 08:35:08'),
(249, 1, '2941533150248', 387, 'peserta', 1, '2018-06-30 08:35:08', '2018-06-30 08:35:08'),
(250, 1, '2941533150249', 388, 'peserta', 1, '2018-06-30 08:35:08', '2018-06-30 08:35:08'),
(251, 1, '2941533150250', 389, 'peserta', 1, '2018-06-30 08:35:08', '2018-06-30 08:35:08'),
(252, 1, '2941533150251', 390, 'peserta', 1, '2018-06-30 08:35:08', '2018-06-30 08:35:08'),
(253, 1, '2941533150252', 391, 'peserta', 1, '2018-06-30 08:35:08', '2018-06-30 08:35:08'),
(254, 1, '2941533150253', 392, 'peserta', 1, '2018-06-30 08:35:08', '2018-06-30 08:35:08'),
(255, 1, '2941533150254', 393, 'peserta', 1, '2018-06-30 08:35:09', '2018-06-30 08:35:09'),
(256, 1, '2941533150255', 394, 'peserta', 1, '2018-06-30 08:35:09', '2018-06-30 08:35:09'),
(257, 1, '2941533150256', 395, 'peserta', 1, '2018-06-30 08:35:09', '2018-06-30 08:35:09'),
(258, 1, '2941533150257', 396, 'peserta', 1, '2018-06-30 08:35:09', '2018-06-30 08:35:09'),
(259, 1, '2941533150258', 397, 'peserta', 1, '2018-06-30 08:35:09', '2018-06-30 08:35:09'),
(260, 1, '2941533150259', 398, 'peserta', 1, '2018-06-30 08:35:09', '2018-06-30 08:35:09'),
(261, 1, '2941533150260', 399, 'peserta', 1, '2018-06-30 08:35:09', '2018-06-30 08:35:09'),
(262, 1, '2941533150261', 400, 'peserta', 1, '2018-06-30 08:35:09', '2018-06-30 08:35:09'),
(263, 1, '2941533150262', 401, 'peserta', 1, '2018-06-30 08:35:09', '2018-06-30 08:35:09'),
(264, 1, '2941533150263', 402, 'peserta', 1, '2018-06-30 08:35:09', '2018-06-30 08:35:09'),
(265, 1, '2941533150264', 403, 'peserta', 1, '2018-06-30 08:35:09', '2018-06-30 08:35:09'),
(266, 1, '2941533150265', 404, 'peserta', 1, '2018-06-30 08:35:09', '2018-06-30 08:35:09'),
(267, 1, '2941533150266', 405, 'peserta', 1, '2018-06-30 08:35:09', '2018-06-30 08:35:09'),
(268, 1, '2941533150267', 406, 'peserta', 1, '2018-06-30 08:35:09', '2018-06-30 08:35:09'),
(269, 1, '2941533150268', 407, 'peserta', 1, '2018-06-30 08:35:09', '2018-06-30 08:35:09'),
(270, 1, '2941533150269', 408, 'peserta', 1, '2018-06-30 08:35:09', '2018-06-30 08:35:09'),
(271, 1, '2941533150270', 409, 'peserta', 1, '2018-06-30 08:35:09', '2018-06-30 08:35:09'),
(272, 1, '2941533150271', 410, 'peserta', 1, '2018-06-30 08:35:09', '2018-06-30 08:35:09'),
(273, 1, '2941533150272', 411, 'peserta', 1, '2018-06-30 08:35:09', '2018-06-30 08:35:09'),
(274, 1, '2941533150273', 412, 'peserta', 1, '2018-06-30 08:35:09', '2018-06-30 08:35:09'),
(275, 1, '2941533150274', 413, 'peserta', 1, '2018-06-30 08:35:09', '2018-06-30 08:35:09'),
(276, 1, '2941533150275', 414, 'peserta', 1, '2018-06-30 08:35:09', '2018-06-30 08:35:09'),
(277, 1, '2941533150276', 415, 'peserta', 1, '2018-06-30 08:35:09', '2018-06-30 08:35:09'),
(278, 1, '2941533150277', 416, 'peserta', 1, '2018-06-30 08:35:09', '2018-06-30 08:35:09'),
(279, 1, '2941533150278', 417, 'peserta', 1, '2018-06-30 08:35:09', '2018-06-30 08:35:09'),
(280, 1, '2941533150279', 418, 'peserta', 1, '2018-06-30 08:35:09', '2018-06-30 08:35:09'),
(281, 1, '2941533150280', 419, 'peserta', 1, '2018-06-30 08:35:09', '2018-06-30 08:35:09'),
(282, 1, '2941533150281', 420, 'peserta', 1, '2018-06-30 08:35:10', '2018-06-30 08:35:10'),
(283, 1, '2941533150282', 421, 'peserta', 1, '2018-06-30 08:35:10', '2018-06-30 08:35:10'),
(284, 1, '2941533150283', 422, 'peserta', 1, '2018-06-30 08:35:10', '2018-06-30 08:35:10'),
(285, 1, '2941533150284', 423, 'peserta', 1, '2018-06-30 08:35:10', '2018-06-30 08:35:10'),
(286, 1, '2941533150285', 424, 'peserta', 1, '2018-06-30 08:35:10', '2018-06-30 08:35:10'),
(287, 1, '2941533150286', 425, 'peserta', 1, '2018-06-30 08:35:10', '2018-06-30 08:35:10'),
(288, 1, '2941533150287', 426, 'peserta', 1, '2018-06-30 08:35:10', '2018-06-30 08:35:10'),
(289, 1, '2941533150288', 427, 'peserta', 1, '2018-06-30 08:35:10', '2018-06-30 08:35:10'),
(290, 1, '2941533150289', 480, 'peserta', 1, '2018-06-30 08:36:03', '2018-06-30 08:36:03'),
(291, 1, '2941533150290', 481, 'peserta', 1, '2018-06-30 08:36:03', '2018-06-30 08:36:03'),
(292, 1, '2941533150291', 482, 'peserta', 1, '2018-06-30 08:36:03', '2018-06-30 08:36:03'),
(293, 1, '2941533150292', 483, 'peserta', 1, '2018-06-30 08:36:03', '2018-06-30 08:36:03'),
(294, 1, '2941533150293', 484, 'peserta', 1, '2018-06-30 08:36:03', '2018-06-30 08:36:03'),
(295, 1, '2941533150294', 485, 'peserta', 1, '2018-06-30 08:36:03', '2018-06-30 08:36:03'),
(296, 1, '2941533150295', 486, 'peserta', 1, '2018-06-30 08:36:03', '2018-06-30 08:36:03'),
(297, 1, '2941533150296', 487, 'peserta', 1, '2018-06-30 08:36:03', '2018-06-30 08:36:03'),
(298, 1, '2941533150297', 488, 'peserta', 1, '2018-06-30 08:36:04', '2018-06-30 08:36:04'),
(299, 1, '2941533150298', 489, 'peserta', 1, '2018-06-30 08:36:04', '2018-06-30 08:36:04'),
(300, 1, '2941533150299', 490, 'peserta', 1, '2018-06-30 08:36:04', '2018-06-30 08:36:04'),
(301, 1, '2941533150300', 491, 'peserta', 1, '2018-06-30 08:36:04', '2018-06-30 08:36:04'),
(302, 1, '2941533150301', 492, 'peserta', 1, '2018-06-30 08:36:04', '2018-06-30 08:36:04'),
(303, 1, '2941533150302', 493, 'peserta', 1, '2018-06-30 08:36:04', '2018-06-30 08:36:04'),
(304, 1, '2941533150303', 494, 'peserta', 1, '2018-06-30 08:36:04', '2018-06-30 08:36:04'),
(305, 1, '2941533150304', 495, 'peserta', 1, '2018-06-30 08:36:04', '2018-06-30 08:36:04'),
(306, 1, '2941533150305', 496, 'peserta', 1, '2018-06-30 08:36:04', '2018-06-30 08:36:04'),
(307, 1, '2941533150306', 497, 'peserta', 1, '2018-06-30 08:36:04', '2018-06-30 08:36:04'),
(308, 1, '2941533150307', 498, 'peserta', 1, '2018-06-30 08:36:04', '2018-06-30 08:36:04'),
(309, 1, '2941533150308', 499, 'peserta', 1, '2018-06-30 08:36:04', '2018-06-30 08:36:04'),
(310, 1, '2941533150309', 500, 'peserta', 1, '2018-06-30 08:36:04', '2018-06-30 08:36:04'),
(311, 1, '2941533150310', 501, 'peserta', 1, '2018-06-30 08:36:04', '2018-06-30 08:36:04'),
(312, 1, '2941533150311', 502, 'peserta', 1, '2018-06-30 08:36:04', '2018-06-30 08:36:04'),
(313, 1, '2941533150312', 503, 'peserta', 1, '2018-06-30 08:36:04', '2018-06-30 08:36:04'),
(314, 1, '2941533150313', 504, 'peserta', 1, '2018-06-30 08:36:04', '2018-06-30 08:36:04'),
(315, 1, '2941533150314', 505, 'peserta', 1, '2018-06-30 08:36:04', '2018-06-30 08:36:04'),
(316, 1, '2941533150315', 506, 'peserta', 1, '2018-06-30 08:36:04', '2018-06-30 08:36:04'),
(317, 1, '2941533150316', 507, 'peserta', 1, '2018-06-30 08:36:04', '2018-06-30 08:36:04'),
(318, 1, '2941533150317', 508, 'peserta', 1, '2018-06-30 08:36:04', '2018-06-30 08:36:04'),
(319, 1, '2941533150318', 509, 'peserta', 1, '2018-06-30 08:36:04', '2018-06-30 08:36:04'),
(320, 1, '2941533150319', 510, 'peserta', 1, '2018-06-30 08:36:04', '2018-06-30 08:36:04'),
(321, 1, '2941533150320', 511, 'peserta', 1, '2018-06-30 08:36:04', '2018-06-30 08:36:04'),
(322, 1, '2941533150321', 512, 'peserta', 1, '2018-06-30 08:36:04', '2018-06-30 08:36:04'),
(323, 1, '2941533150322', 513, 'peserta', 1, '2018-06-30 08:36:04', '2018-06-30 08:36:04'),
(324, 1, '2941533150323', 514, 'peserta', 1, '2018-06-30 08:36:04', '2018-06-30 08:36:04'),
(325, 1, '2941533150324', 515, 'peserta', 1, '2018-06-30 08:36:05', '2018-06-30 08:36:05'),
(326, 1, '2941533150325', 516, 'peserta', 1, '2018-06-30 08:36:05', '2018-06-30 08:36:05'),
(327, 1, '2941533150326', 517, 'peserta', 1, '2018-06-30 08:36:05', '2018-06-30 08:36:05'),
(328, 1, '2941533150327', 518, 'peserta', 1, '2018-06-30 08:36:05', '2018-06-30 08:36:05'),
(329, 1, '2941533150328', 519, 'peserta', 1, '2018-06-30 08:36:05', '2018-06-30 08:36:05'),
(330, 1, '2941533150329', 520, 'peserta', 1, '2018-06-30 08:36:05', '2018-06-30 08:36:05'),
(331, 1, '2941533150330', 521, 'peserta', 1, '2018-06-30 08:36:05', '2018-06-30 08:36:05'),
(332, 1, '2941533150331', 522, 'peserta', 1, '2018-06-30 08:36:05', '2018-06-30 08:36:05'),
(333, 1, '2941533150332', 523, 'peserta', 1, '2018-06-30 08:36:05', '2018-06-30 08:36:05'),
(334, 1, '2941533150333', 524, 'peserta', 1, '2018-06-30 08:36:05', '2018-06-30 08:36:05'),
(335, 1, '2941533150334', 525, 'peserta', 1, '2018-06-30 08:36:05', '2018-06-30 08:36:05'),
(336, 1, '2941533150335', 526, 'peserta', 1, '2018-06-30 08:36:05', '2018-06-30 08:36:05'),
(337, 1, '2941533150336', 527, 'peserta', 1, '2018-06-30 08:36:05', '2018-06-30 08:36:05'),
(338, 1, '2941533150337', 528, 'peserta', 1, '2018-06-30 08:36:05', '2018-06-30 08:36:05'),
(339, 1, '2941533150338', 529, 'peserta', 1, '2018-06-30 08:36:05', '2018-06-30 08:36:05'),
(340, 1, '2941533150339', 530, 'peserta', 1, '2018-06-30 08:36:05', '2018-06-30 08:36:05'),
(341, 1, '2941533150340', 531, 'peserta', 1, '2018-06-30 08:36:05', '2018-06-30 08:36:05'),
(342, 1, '2941533150341', 4, 'peserta', 1, '2018-06-30 08:36:23', '2018-06-30 08:36:23'),
(343, 1, '2941533150342', 5, 'peserta', 1, '2018-06-30 08:36:23', '2018-06-30 08:36:23'),
(344, 1, '2941533150343', 6, 'peserta', 1, '2018-06-30 08:36:23', '2018-06-30 08:36:23'),
(345, 1, '2941533150344', 7, 'peserta', 1, '2018-06-30 08:36:23', '2018-06-30 08:36:23'),
(346, 1, '2941533150345', 12, 'peserta', 1, '2018-06-30 08:36:23', '2018-06-30 08:36:23'),
(347, 1, '2941533150346', 58, 'peserta', 1, '2018-06-30 08:36:41', '2018-06-30 08:36:41'),
(348, 1, '2941533150347', 84, 'peserta', 1, '2018-06-30 08:38:09', '2018-06-30 08:38:09'),
(349, 1, '2941533150348', 85, 'peserta', 1, '2018-06-30 08:38:09', '2018-06-30 08:38:09'),
(350, 1, '2941533150349', 86, 'peserta', 1, '2018-06-30 08:38:09', '2018-06-30 08:38:09'),
(351, 1, '2941533150350', 87, 'peserta', 1, '2018-06-30 08:38:09', '2018-06-30 08:38:09'),
(352, 1, '2941533150351', 88, 'peserta', 1, '2018-06-30 08:38:09', '2018-06-30 08:38:09'),
(353, 1, '2941533150352', 89, 'peserta', 1, '2018-06-30 08:38:09', '2018-06-30 08:38:09'),
(354, 1, '2941533150353', 90, 'peserta', 1, '2018-06-30 08:38:09', '2018-06-30 08:38:09'),
(355, 1, '2941533150354', 91, 'peserta', 1, '2018-06-30 08:38:09', '2018-06-30 08:38:09'),
(356, 1, '2941533150355', 92, 'peserta', 1, '2018-06-30 08:38:09', '2018-06-30 08:38:09'),
(357, 1, '2941533150356', 93, 'peserta', 1, '2018-06-30 08:38:09', '2018-06-30 08:38:09'),
(358, 1, '2941533150357', 94, 'peserta', 1, '2018-06-30 08:38:09', '2018-06-30 08:38:09'),
(359, 1, '2941533150358', 95, 'peserta', 1, '2018-06-30 08:38:09', '2018-06-30 08:38:09'),
(360, 1, '2941533150359', 96, 'peserta', 1, '2018-06-30 08:38:09', '2018-06-30 08:38:09'),
(361, 1, '2941533150360', 97, 'peserta', 1, '2018-06-30 08:38:09', '2018-06-30 08:38:09'),
(362, 1, '2941533150361', 98, 'peserta', 1, '2018-06-30 08:38:10', '2018-06-30 08:38:10'),
(363, 1, '2941533150362', 99, 'peserta', 1, '2018-06-30 08:38:10', '2018-06-30 08:38:10'),
(364, 1, '2941533150363', 100, 'peserta', 1, '2018-06-30 08:38:10', '2018-06-30 08:38:10'),
(365, 1, '2941533150364', 101, 'peserta', 1, '2018-06-30 08:38:10', '2018-06-30 08:38:10'),
(366, 1, '2941533150365', 102, 'peserta', 1, '2018-06-30 08:38:10', '2018-06-30 08:38:10'),
(367, 1, '2941533150366', 103, 'peserta', 1, '2018-06-30 08:38:10', '2018-06-30 08:38:10'),
(368, 1, '2941533150367', 104, 'peserta', 1, '2018-06-30 08:38:10', '2018-06-30 08:38:10'),
(369, 1, '2941533150368', 105, 'peserta', 1, '2018-06-30 08:38:10', '2018-06-30 08:38:10'),
(370, 1, '2941533150369', 106, 'peserta', 1, '2018-06-30 08:38:10', '2018-06-30 08:38:10'),
(371, 1, '2941533150370', 107, 'peserta', 1, '2018-06-30 08:38:10', '2018-06-30 08:38:10'),
(372, 1, '2941533150371', 108, 'peserta', 1, '2018-06-30 08:38:10', '2018-06-30 08:38:10'),
(373, 1, '2941533150372', 109, 'peserta', 1, '2018-06-30 08:38:10', '2018-06-30 08:38:10'),
(374, 1, '2941533150373', 110, 'peserta', 1, '2018-06-30 08:38:10', '2018-06-30 08:38:10'),
(375, 1, '2941533150374', 111, 'peserta', 1, '2018-06-30 08:38:10', '2018-06-30 08:38:10'),
(376, 1, '2941533150375', 112, 'peserta', 1, '2018-06-30 08:38:10', '2018-06-30 08:38:10'),
(377, 1, '2941533150376', 113, 'peserta', 1, '2018-06-30 08:38:10', '2018-06-30 08:38:10'),
(378, 1, '2941533150377', 114, 'peserta', 1, '2018-06-30 08:38:10', '2018-06-30 08:38:10'),
(379, 1, '2941533150378', 115, 'peserta', 1, '2018-06-30 08:38:10', '2018-06-30 08:38:10'),
(380, 1, '2941533150379', 116, 'peserta', 1, '2018-06-30 08:38:10', '2018-06-30 08:38:10'),
(381, 1, '2941533150380', 117, 'peserta', 1, '2018-06-30 08:38:10', '2018-06-30 08:38:10'),
(382, 1, '2941533150381', 118, 'peserta', 1, '2018-06-30 08:38:10', '2018-06-30 08:38:10'),
(383, 1, '2941533150382', 119, 'peserta', 1, '2018-06-30 08:38:10', '2018-06-30 08:38:10'),
(384, 1, '2941533150383', 120, 'peserta', 1, '2018-06-30 08:38:10', '2018-06-30 08:38:10'),
(385, 1, '2941533150384', 121, 'peserta', 1, '2018-06-30 08:38:10', '2018-06-30 08:38:10'),
(386, 1, '2941533150385', 122, 'peserta', 1, '2018-06-30 08:38:10', '2018-06-30 08:38:10'),
(387, 1, '2941533150386', 123, 'peserta', 1, '2018-06-30 08:38:10', '2018-06-30 08:38:10'),
(388, 1, '2941533150387', 124, 'peserta', 1, '2018-06-30 08:38:10', '2018-06-30 08:38:10'),
(389, 1, '2941533150388', 125, 'peserta', 1, '2018-06-30 08:38:11', '2018-06-30 08:38:11'),
(390, 1, '2941533150389', 126, 'peserta', 1, '2018-06-30 08:38:11', '2018-06-30 08:38:11'),
(391, 1, '2941533150390', 127, 'peserta', 1, '2018-06-30 08:38:11', '2018-06-30 08:38:11'),
(392, 1, '2941533150391', 128, 'peserta', 1, '2018-06-30 08:38:11', '2018-06-30 08:38:11'),
(393, 1, '2941533150392', 129, 'peserta', 1, '2018-06-30 08:38:11', '2018-06-30 08:38:11'),
(394, 1, '2941533150393', 130, 'peserta', 1, '2018-06-30 08:38:11', '2018-06-30 08:38:11'),
(395, 1, '2941533150394', 131, 'peserta', 1, '2018-06-30 08:38:11', '2018-06-30 08:38:11'),
(396, 1, '2941533150395', 132, 'peserta', 1, '2018-06-30 08:38:11', '2018-06-30 08:38:11'),
(397, 1, '2941533150396', 133, 'peserta', 1, '2018-06-30 08:38:11', '2018-06-30 08:38:11'),
(398, 1, '2941533150397', 134, 'peserta', 1, '2018-06-30 08:38:11', '2018-06-30 08:38:11'),
(399, 1, '2941533150398', 135, 'peserta', 1, '2018-06-30 08:38:11', '2018-06-30 08:38:11'),
(400, 1, '2941533150399', 136, 'peserta', 1, '2018-06-30 08:38:11', '2018-06-30 08:38:11'),
(401, 1, '2941533150400', 137, 'peserta', 1, '2018-06-30 08:38:11', '2018-06-30 08:38:11'),
(402, 1, '2941533150401', 138, 'peserta', 1, '2018-06-30 08:38:11', '2018-06-30 08:38:11'),
(403, 1, '2941533150402', 139, 'peserta', 1, '2018-06-30 08:38:11', '2018-06-30 08:38:11'),
(404, 1, '2941533150403', 140, 'peserta', 1, '2018-06-30 08:38:11', '2018-06-30 08:38:11'),
(405, 1, '2941533150404', 141, 'peserta', 1, '2018-06-30 08:38:11', '2018-06-30 08:38:11'),
(406, 1, '2941533150405', 142, 'peserta', 1, '2018-06-30 08:38:11', '2018-06-30 08:38:11'),
(407, 1, '2941533150406', 143, 'peserta', 1, '2018-06-30 08:38:11', '2018-06-30 08:38:11'),
(408, 1, '2941533150407', 144, 'peserta', 1, '2018-06-30 08:38:11', '2018-06-30 08:38:11'),
(409, 1, '2941533150408', 145, 'peserta', 1, '2018-06-30 08:38:11', '2018-06-30 08:38:11'),
(410, 1, '2941533150409', 146, 'peserta', 1, '2018-06-30 08:38:11', '2018-06-30 08:38:11'),
(411, 1, '2941533150410', 147, 'peserta', 1, '2018-06-30 08:38:11', '2018-06-30 08:38:11'),
(412, 1, '2941533150411', 148, 'peserta', 1, '2018-06-30 08:38:11', '2018-06-30 08:38:11'),
(413, 1, '2941533150412', 149, 'peserta', 1, '2018-06-30 08:38:11', '2018-06-30 08:38:11'),
(414, 1, '2941533150413', 150, 'peserta', 1, '2018-06-30 08:38:11', '2018-06-30 08:38:11'),
(415, 1, '2941533150414', 151, 'peserta', 1, '2018-06-30 08:38:11', '2018-06-30 08:38:11'),
(416, 1, '2941533150415', 152, 'peserta', 1, '2018-06-30 08:38:11', '2018-06-30 08:38:11'),
(417, 1, '2941533150416', 153, 'peserta', 1, '2018-06-30 08:38:12', '2018-06-30 08:38:12'),
(418, 1, '2941533150417', 154, 'peserta', 1, '2018-06-30 08:38:12', '2018-06-30 08:38:12'),
(419, 1, '2941533150418', 155, 'peserta', 1, '2018-06-30 08:38:12', '2018-06-30 08:38:12'),
(420, 1, '2941533150419', 156, 'peserta', 1, '2018-06-30 08:38:12', '2018-06-30 08:38:12'),
(421, 1, '2941533150420', 157, 'peserta', 1, '2018-06-30 08:38:12', '2018-06-30 08:38:12'),
(422, 1, '2941533150421', 158, 'peserta', 1, '2018-06-30 08:38:12', '2018-06-30 08:38:12'),
(423, 1, '2941533150422', 159, 'peserta', 1, '2018-06-30 08:38:12', '2018-06-30 08:38:12'),
(424, 1, '2941533150423', 160, 'peserta', 1, '2018-06-30 08:38:12', '2018-06-30 08:38:12'),
(425, 1, '2941533150424', 161, 'peserta', 1, '2018-06-30 08:38:12', '2018-06-30 08:38:12'),
(426, 1, '2941533150425', 162, 'peserta', 1, '2018-06-30 08:38:12', '2018-06-30 08:38:12'),
(427, 1, '2941533150426', 163, 'peserta', 1, '2018-06-30 08:38:12', '2018-06-30 08:38:12'),
(428, 1, '2941533150427', 164, 'peserta', 1, '2018-06-30 08:38:12', '2018-06-30 08:38:12'),
(429, 1, '2941533150428', 165, 'peserta', 1, '2018-06-30 08:38:12', '2018-06-30 08:38:12'),
(430, 1, '2941533150429', 166, 'peserta', 1, '2018-06-30 08:38:12', '2018-06-30 08:38:12'),
(431, 1, '2941533150430', 167, 'peserta', 1, '2018-06-30 08:38:12', '2018-06-30 08:38:12'),
(432, 1, '2941533150431', 168, 'peserta', 1, '2018-06-30 08:38:12', '2018-06-30 08:38:12'),
(433, 1, '2941533150432', 169, 'peserta', 1, '2018-06-30 08:38:12', '2018-06-30 08:38:12'),
(434, 1, '2941533150433', 170, 'peserta', 1, '2018-06-30 08:38:12', '2018-06-30 08:38:12'),
(435, 1, '2941533150434', 171, 'peserta', 1, '2018-06-30 08:38:12', '2018-06-30 08:38:12'),
(436, 1, '2941533150435', 172, 'peserta', 1, '2018-06-30 08:38:12', '2018-06-30 08:38:12'),
(437, 1, '2941533150436', 173, 'peserta', 1, '2018-06-30 08:38:12', '2018-06-30 08:38:12'),
(438, 1, '2941533150437', 174, 'peserta', 1, '2018-06-30 08:38:12', '2018-06-30 08:38:12'),
(439, 1, '2941533150438', 175, 'peserta', 1, '2018-06-30 08:38:12', '2018-06-30 08:38:12'),
(440, 1, '2941533150439', 176, 'peserta', 1, '2018-06-30 08:38:12', '2018-06-30 08:38:12'),
(441, 1, '2941533150440', 177, 'peserta', 1, '2018-06-30 08:38:12', '2018-06-30 08:38:12'),
(442, 1, '2941533150441', 178, 'peserta', 1, '2018-06-30 08:38:12', '2018-06-30 08:38:12'),
(443, 1, '2941533150442', 179, 'peserta', 1, '2018-06-30 08:38:12', '2018-06-30 08:38:12'),
(444, 1, '2941533150443', 180, 'peserta', 1, '2018-06-30 08:38:12', '2018-06-30 08:38:12'),
(445, 1, '2941533150444', 181, 'peserta', 1, '2018-06-30 08:38:13', '2018-06-30 08:38:13'),
(446, 1, '2941533150445', 182, 'peserta', 1, '2018-06-30 08:38:13', '2018-06-30 08:38:13'),
(447, 1, '2941533150446', 183, 'peserta', 1, '2018-06-30 08:38:13', '2018-06-30 08:38:13'),
(448, 1, '2941533150447', 184, 'peserta', 1, '2018-06-30 08:38:13', '2018-06-30 08:38:13'),
(449, 1, '2941533150448', 185, 'peserta', 1, '2018-06-30 08:38:13', '2018-06-30 08:38:13'),
(450, 1, '2941533150449', 186, 'peserta', 1, '2018-06-30 08:38:13', '2018-06-30 08:38:13'),
(451, 1, '2941533150450', 187, 'peserta', 1, '2018-06-30 08:38:13', '2018-06-30 08:38:13'),
(452, 1, '2941533150451', 188, 'peserta', 1, '2018-06-30 08:38:13', '2018-06-30 08:38:13'),
(453, 1, '2941533150452', 189, 'peserta', 1, '2018-06-30 08:38:13', '2018-06-30 08:38:13'),
(454, 1, '2941533150453', 190, 'peserta', 1, '2018-06-30 08:38:13', '2018-06-30 08:38:13'),
(455, 1, '2941533150454', 191, 'peserta', 1, '2018-06-30 08:38:13', '2018-06-30 08:38:13'),
(456, 1, '2941533150455', 192, 'peserta', 1, '2018-06-30 08:38:13', '2018-06-30 08:38:13'),
(457, 1, '2941533150456', 193, 'peserta', 1, '2018-06-30 08:38:13', '2018-06-30 08:38:13'),
(458, 1, '2941533150457', 194, 'peserta', 1, '2018-06-30 08:38:13', '2018-06-30 08:38:13'),
(459, 1, '2941533150458', 195, 'peserta', 1, '2018-06-30 08:38:13', '2018-06-30 08:38:13'),
(460, 1, '2941533150459', 196, 'peserta', 1, '2018-06-30 08:38:13', '2018-06-30 08:38:13'),
(461, 1, '2941533150460', 197, 'peserta', 1, '2018-06-30 08:38:13', '2018-06-30 08:38:13'),
(462, 1, '2941533150461', 198, 'peserta', 1, '2018-06-30 08:38:13', '2018-06-30 08:38:13'),
(463, 1, '2941533150462', 199, 'peserta', 1, '2018-06-30 08:39:09', '2018-06-30 08:39:09'),
(464, 1, '2941533150463', 200, 'peserta', 1, '2018-06-30 08:39:09', '2018-06-30 08:39:09'),
(465, 1, '2941533150464', 201, 'peserta', 1, '2018-06-30 08:39:09', '2018-06-30 08:39:09'),
(466, 1, '2941533150465', 202, 'peserta', 1, '2018-06-30 08:39:09', '2018-06-30 08:39:09'),
(467, 1, '2941533150466', 203, 'peserta', 1, '2018-06-30 08:39:09', '2018-06-30 08:39:09'),
(468, 1, '2941533150467', 204, 'peserta', 1, '2018-06-30 08:39:09', '2018-06-30 08:39:09'),
(469, 1, '2941533150468', 205, 'peserta', 1, '2018-06-30 08:39:09', '2018-06-30 08:39:09'),
(470, 1, '2941533150469', 206, 'peserta', 1, '2018-06-30 08:39:09', '2018-06-30 08:39:09'),
(471, 1, '2941533150470', 207, 'peserta', 1, '2018-06-30 08:39:09', '2018-06-30 08:39:09'),
(472, 1, '2941533150471', 208, 'peserta', 1, '2018-06-30 08:39:09', '2018-06-30 08:39:09'),
(473, 1, '2941533150472', 209, 'peserta', 1, '2018-06-30 08:39:09', '2018-06-30 08:39:09'),
(474, 1, '2941533150473', 210, 'peserta', 1, '2018-06-30 08:39:09', '2018-06-30 08:39:09'),
(475, 1, '2941533150474', 211, 'peserta', 1, '2018-06-30 08:39:09', '2018-06-30 08:39:09'),
(476, 1, '2941533150475', 212, 'peserta', 1, '2018-06-30 08:39:09', '2018-06-30 08:39:09'),
(477, 1, '2941533150476', 213, 'peserta', 1, '2018-06-30 08:39:09', '2018-06-30 08:39:09'),
(478, 1, '2941533150477', 214, 'peserta', 1, '2018-06-30 08:39:09', '2018-06-30 08:39:09'),
(479, 1, '2941533150478', 215, 'peserta', 1, '2018-06-30 08:39:09', '2018-06-30 08:39:09'),
(480, 1, '2941533150479', 216, 'peserta', 1, '2018-06-30 08:39:09', '2018-06-30 08:39:09'),
(481, 1, '2941533150480', 217, 'peserta', 1, '2018-06-30 08:39:09', '2018-06-30 08:39:09'),
(482, 1, '2941533150481', 218, 'peserta', 1, '2018-06-30 08:39:09', '2018-06-30 08:39:09'),
(483, 1, '2941533150482', 219, 'peserta', 1, '2018-06-30 08:39:09', '2018-06-30 08:39:09'),
(484, 1, '2941533150483', 220, 'peserta', 1, '2018-06-30 08:39:09', '2018-06-30 08:39:09'),
(485, 1, '2941533150484', 221, 'peserta', 1, '2018-06-30 08:39:09', '2018-06-30 08:39:09'),
(486, 1, '2941533150485', 222, 'peserta', 1, '2018-06-30 08:39:09', '2018-06-30 08:39:09'),
(487, 1, '2941533150486', 223, 'peserta', 1, '2018-06-30 08:39:09', '2018-06-30 08:39:09'),
(488, 1, '2941533150487', 224, 'peserta', 1, '2018-06-30 08:39:10', '2018-06-30 08:39:10'),
(489, 1, '2941533150488', 225, 'peserta', 1, '2018-06-30 08:39:10', '2018-06-30 08:39:10'),
(490, 1, '2941533150489', 226, 'peserta', 1, '2018-06-30 08:39:10', '2018-06-30 08:39:10'),
(491, 1, '2941533150490', 227, 'peserta', 1, '2018-06-30 08:39:10', '2018-06-30 08:39:10'),
(492, 1, '2941533150491', 228, 'peserta', 1, '2018-06-30 08:39:10', '2018-06-30 08:39:10'),
(493, 1, '2941533150492', 229, 'peserta', 1, '2018-06-30 08:39:10', '2018-06-30 08:39:10'),
(494, 1, '2941533150493', 230, 'peserta', 1, '2018-06-30 08:39:10', '2018-06-30 08:39:10'),
(495, 1, '2941533150494', 231, 'peserta', 1, '2018-06-30 08:39:10', '2018-06-30 08:39:10'),
(496, 1, '2941533150495', 232, 'peserta', 1, '2018-06-30 08:39:10', '2018-06-30 08:39:10'),
(497, 1, '2941533150496', 233, 'peserta', 1, '2018-06-30 08:39:10', '2018-06-30 08:39:10'),
(498, 1, '2941533150497', 234, 'peserta', 1, '2018-06-30 08:39:10', '2018-06-30 08:39:10'),
(499, 1, '2941533150498', 235, 'peserta', 1, '2018-06-30 08:39:10', '2018-06-30 08:39:10'),
(500, 1, '2941533150499', 236, 'peserta', 1, '2018-06-30 08:39:10', '2018-06-30 08:39:10'),
(501, 1, '2941533150500', 237, 'peserta', 1, '2018-06-30 08:39:10', '2018-06-30 08:39:10'),
(502, 1, '2941533150501', 238, 'peserta', 1, '2018-06-30 08:39:10', '2018-06-30 08:39:10'),
(503, 1, '2941533150502', 239, 'peserta', 1, '2018-06-30 08:39:10', '2018-06-30 08:39:10'),
(504, 1, '2941533150503', 240, 'peserta', 1, '2018-06-30 08:39:10', '2018-06-30 08:39:10'),
(505, 1, '2941533150504', 241, 'peserta', 1, '2018-06-30 08:39:10', '2018-06-30 08:39:10'),
(506, 1, '2941533150505', 242, 'peserta', 1, '2018-06-30 08:39:10', '2018-06-30 08:39:10'),
(507, 1, '2941533150506', 243, 'peserta', 1, '2018-06-30 08:39:10', '2018-06-30 08:39:10'),
(508, 1, '2941533150507', 244, 'peserta', 1, '2018-06-30 08:39:10', '2018-06-30 08:39:10'),
(509, 1, '2941533150508', 245, 'peserta', 1, '2018-06-30 08:39:10', '2018-06-30 08:39:10'),
(510, 1, '2941533150509', 246, 'peserta', 1, '2018-06-30 08:39:10', '2018-06-30 08:39:10'),
(511, 1, '2941533150510', 247, 'peserta', 1, '2018-06-30 08:39:11', '2018-06-30 08:39:11'),
(512, 1, '2941533150511', 51, 'peserta', 1, '2018-06-30 08:39:27', '2018-06-30 08:39:27'),
(513, 1, '2941533150512', 52, 'peserta', 1, '2018-06-30 08:39:27', '2018-06-30 08:39:27'),
(514, 1, '2941533150513', 80, 'peserta', 1, '2018-06-30 08:39:27', '2018-06-30 08:39:27'),
(515, 1, '2941533150514', 11, 'peserta', 1, '2018-06-30 08:39:48', '2018-06-30 08:39:48'),
(516, 1, '2941533150515', 46, 'peserta', 1, '2018-06-30 08:39:48', '2018-06-30 08:39:48'),
(517, 1, '2941533150516', 47, 'peserta', 1, '2018-06-30 08:39:48', '2018-06-30 08:39:48'),
(518, 1, '2941533150517', 48, 'peserta', 1, '2018-06-30 08:39:48', '2018-06-30 08:39:48'),
(519, 1, '2941533150518', 50, 'peserta', 1, '2018-06-30 08:40:04', '2018-06-30 08:40:04'),
(520, 1, '2941533150519', 77, 'peserta', 1, '2018-06-30 08:40:04', '2018-06-30 08:40:04'),
(521, 1, '2941533150520', 78, 'peserta', 1, '2018-06-30 08:40:04', '2018-06-30 08:40:04'),
(522, 1, '2941533150521', 79, 'peserta', 1, '2018-06-30 08:40:04', '2018-06-30 08:40:04'),
(523, 1, '2941533150522', 20, 'peserta', 1, '2018-06-30 08:40:21', '2018-06-30 08:40:21'),
(524, 1, '2941533150523', 23, 'peserta', 1, '2018-06-30 08:40:21', '2018-06-30 08:40:21'),
(525, 1, '2941533150524', 49, 'peserta', 1, '2018-06-30 08:40:21', '2018-06-30 08:40:21'),
(526, 1, '2941533150525', 73, 'peserta', 1, '2018-06-30 08:40:21', '2018-06-30 08:40:21'),
(527, 1, '2941533150526', 28, 'peserta', 1, '2018-06-30 08:40:37', '2018-06-30 08:40:37'),
(528, 1, '2941533150527', 29, 'peserta', 1, '2018-06-30 08:40:37', '2018-06-30 08:40:37'),
(529, 1, '2941533150528', 30, 'peserta', 1, '2018-06-30 08:40:37', '2018-06-30 08:40:37'),
(530, 1, '2941533150529', 74, 'peserta', 1, '2018-06-30 08:40:54', '2018-06-30 08:40:54'),
(531, 1, '2941533150530', 75, 'peserta', 1, '2018-06-30 08:40:54', '2018-06-30 08:40:54'),
(532, 1, '2941533150531', 76, 'peserta', 1, '2018-06-30 08:40:54', '2018-06-30 08:40:54'),
(533, 1, '2941533150532', 532, 'panitia', 1, '2018-06-30 09:00:13', '2018-06-30 09:00:13'),
(534, 1, '2941533150533', 533, 'panitia', 1, '2018-06-30 09:00:13', '2018-06-30 09:00:13');

-- --------------------------------------------------------

--
-- Table structure for table `kelompok`
--

CREATE TABLE `kelompok` (
  `id_kelompok` int(11) NOT NULL,
  `nama_kelompok` varchar(70) NOT NULL,
  `lokasi_kelompok` text NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `kelompok`
--

INSERT INTO `kelompok` (`id_kelompok`, `nama_kelompok`, `lokasi_kelompok`, `created_at`, `updated_at`) VALUES
(1, 'AIR PUTIH', 'JL. PNGERAN ANTASARI, JL. NUSA INDAH ', '2018-06-30 04:22:05', '2018-06-30 04:22:05'),
(2, 'ANGGANA', 'JL. PEMBANGUNAN, KAB. KUKAR', '2018-06-30 04:22:05', '2018-06-30 04:22:05'),
(3, 'ARGAMULYA', 'JL. KS. TUBUN GG WIRA TIRTA', '2018-06-30 04:22:05', '2018-06-30 04:22:05'),
(4, 'ARJUNA', 'JL. M. SAID GG KARET', '2018-06-30 04:22:05', '2018-06-30 04:22:05'),
(5, 'AZIZIYAH A', 'JL. DI. PANJAITAN GG. BUGIS', '2018-06-30 04:22:05', '2018-06-30 04:22:05'),
(6, 'AZIZIYAH B', 'JL. DI. PANJAITAN GG. BUGIS', '2018-06-30 04:22:05', '2018-06-30 04:22:05'),
(7, 'BENGKURING ', 'JL. BAYAM 11 BLOK E SAMARINDA UTARA', '2018-06-30 04:22:05', '2018-06-30 04:22:05'),
(8, 'HARAPAN BARU ', 'JL. KURNIA MAKMUR. KEC. LOA JANAN ILIR', '2018-06-30 04:22:05', '2018-06-30 04:22:05'),
(9, 'KARANG PACE A', 'JL. REVOLUSI, JL. PESANTREN', '2018-06-30 04:22:05', '2018-06-30 04:22:05'),
(10, 'KARANG PACE B', 'JL. REVOLUSI, JL. PESANTREN', '2018-06-30 04:22:05', '2018-06-30 04:22:05'),
(11, 'LOA DURI', 'LOA DURI', '2018-06-30 04:22:05', '2018-06-30 04:22:05'),
(12, 'MAKROMAN ', 'JL. POROS PROPINSI MAKROMAN', '2018-06-30 04:22:05', '2018-06-30 04:22:05'),
(13, 'MANGKUPALAS', 'JL. SMPN 8 RAPAK DALAM', '2018-06-30 04:22:05', '2018-06-30 04:22:05'),
(14, 'MERDEKA ', 'JL. GERILYA GG. FAMILY', '2018-06-30 04:22:05', '2018-06-30 04:22:05'),
(15, 'MUARA BADAK', 'MUARA BADAK ', '2018-06-30 04:22:05', '2018-06-30 04:22:05'),
(16, 'PALARAN', 'JL. PARIKESIT, RAWA MAKMUR', '2018-06-30 04:22:05', '2018-06-30 04:22:05'),
(17, 'PONPES AZIZIYAH', 'JL. DI. PANJAITAN GG. BUGIS', '2018-06-30 04:22:05', '2018-06-30 04:22:05'),
(18, 'PPDB SMA BUDI LUHUR', 'JL. DI. PANJAITAN GG. BUGIS', '2018-06-30 04:22:06', '2018-06-30 04:22:06'),
(19, 'PPDB SMP BUDI LUHUR', 'JL. DI. PANJAITAN GG. BUGIS', '2018-06-30 04:22:06', '2018-06-30 04:22:06'),
(20, 'PPPM', 'JL. WOLTER MONGINSIDI GG. 7', '2018-06-30 04:22:06', '2018-06-30 04:22:06'),
(21, 'SAMBUTAN ', 'JL. ST. SULAIMAN GG. AMALIAH', '2018-06-30 04:22:06', '2018-06-30 04:22:06'),
(22, 'SANGA-SANGA', '-', '2018-06-30 04:22:06', '2018-06-30 04:22:06'),
(23, 'SMA BUDI LUHUR', 'JL. DI. PANJAITAN GG. BUGIS', '2018-06-30 04:22:06', '2018-06-30 04:22:06'),
(24, 'SMP BUDI LUHUR', 'JL. DI. PANJAITAN GG. BUGIS', '2018-06-30 04:22:06', '2018-06-30 04:22:06'),
(25, 'SUNGAI DAMA', 'JL. OTISTA GG 12', '2018-06-30 04:22:06', '2018-06-30 04:22:06'),
(26, 'SUNGAI KUNJANG', 'JL. TEUKU UMAR', '2018-06-30 04:22:06', '2018-06-30 04:22:06'),
(27, 'SUTOMO', 'JL. DR. SUTOMO', '2018-06-30 04:22:06', '2018-06-30 04:22:06'),
(28, 'SWADAYA A', 'JL. WOLTER MONGINSIDI GG. 7', '2018-06-30 04:22:06', '2018-06-30 04:22:06'),
(29, 'SWADAYA B', 'JL. WOLTER MONGINSIDI GG. 7', '2018-06-30 04:22:06', '2018-06-30 04:22:06'),
(30, 'TANJUNG SANTAN', 'TANJUNG SANTAN MARANG KAYU', '2018-06-30 04:22:06', '2018-06-30 04:22:06');

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2014_10_12_000000_create_users_table', 1);

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id_users` int(3) NOT NULL,
  `name` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `username` varchar(70) COLLATE utf8mb4_unicode_ci NOT NULL,
  `password` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `level` int(1) NOT NULL,
  `status_akun` int(1) NOT NULL,
  `last_login` datetime DEFAULT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status_delete` int(1) NOT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id_users`, `name`, `username`, `password`, `level`, `status_akun`, `last_login`, `remember_token`, `status_delete`, `deleted_at`) VALUES
(1, 'Administrator', 'admin', '$2y$10$SSTPVCNQM60/kGfdCO8eEO0PLdDekSpAVsMdD4x9bhOPvjHBBrZ0G', 2, 1, NULL, 'gi0uV2kCVnVCIzQ7hM0WSV3dcXk6u7b4Xicb26LLWg2aw61iHntJLopnoAn9', 0, NULL),
(3, 'aziz', 'aziz', '$2y$10$x/DtXp.55nXXBnNXEwk5fuE1nDqgAxog7zdUrBARoa2SDIX3QWaHm', 0, 1, NULL, 'kl03Y14v9P0AIziSTwBX36xqiLKnQOWWv07MW290DkeoFUQNCHaLOPI66rjb', 0, '2018-06-26 00:03:08'),
(4, 'Petugas', 'petugas', '$2y$10$K7awF85IQO.3i8c..R76quoiNyhGaYd6b4MQlgpWbwR5FKLWUy7w6', 1, 1, NULL, 'iHPDO8EjdDM7llGx81EqyrJJTnpY5DR4wz3btgRIZocmyWmLcdJVSuAFezSq', 0, '2018-06-27 18:19:04'),
(5, 'Uhuy', 'uhuy', '$2y$10$arNBnUkGRUxAtYMkRh/0reqRfOOxikYENG298JJa3CLSsAzrypWAa', 0, 1, NULL, NULL, 0, NULL);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `absen`
--
ALTER TABLE `absen`
  ADD PRIMARY KEY (`id_absen`),
  ADD KEY `id_peserta` (`id_detail`) USING BTREE,
  ADD KEY `input_by` (`id_users`),
  ADD KEY `jadwal` (`id_jadwal`);

--
-- Indexes for table `anggota`
--
ALTER TABLE `anggota`
  ADD PRIMARY KEY (`id_anggota`),
  ADD KEY `kelompok` (`id_kelompok`);

--
-- Indexes for table `jadwal`
--
ALTER TABLE `jadwal`
  ADD PRIMARY KEY (`id_jadwal`),
  ADD KEY `id_kegiatan` (`id_kegiatan`);

--
-- Indexes for table `kegiatan`
--
ALTER TABLE `kegiatan`
  ADD PRIMARY KEY (`id_kegiatan`);

--
-- Indexes for table `kegiatan_detail`
--
ALTER TABLE `kegiatan_detail`
  ADD PRIMARY KEY (`id_detail`),
  ADD KEY `id_anggota` (`id_anggota`),
  ADD KEY `id_kegiatan` (`id_kegiatan`),
  ADD KEY `id_users` (`id_users`);

--
-- Indexes for table `kelompok`
--
ALTER TABLE `kelompok`
  ADD PRIMARY KEY (`id_kelompok`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id_users`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `absen`
--
ALTER TABLE `absen`
  MODIFY `id_absen` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `anggota`
--
ALTER TABLE `anggota`
  MODIFY `id_anggota` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=534;

--
-- AUTO_INCREMENT for table `jadwal`
--
ALTER TABLE `jadwal`
  MODIFY `id_jadwal` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `kegiatan`
--
ALTER TABLE `kegiatan`
  MODIFY `id_kegiatan` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `kegiatan_detail`
--
ALTER TABLE `kegiatan_detail`
  MODIFY `id_detail` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=535;

--
-- AUTO_INCREMENT for table `kelompok`
--
ALTER TABLE `kelompok`
  MODIFY `id_kelompok` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=31;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id_users` int(3) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `absen`
--
ALTER TABLE `absen`
  ADD CONSTRAINT `absen_ibfk_1` FOREIGN KEY (`id_detail`) REFERENCES `kegiatan_detail` (`id_detail`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `input_by` FOREIGN KEY (`id_users`) REFERENCES `users` (`id_users`) ON UPDATE CASCADE,
  ADD CONSTRAINT `jadwal` FOREIGN KEY (`id_jadwal`) REFERENCES `jadwal` (`id_jadwal`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `anggota`
--
ALTER TABLE `anggota`
  ADD CONSTRAINT `kelompok` FOREIGN KEY (`id_kelompok`) REFERENCES `kelompok` (`id_kelompok`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `jadwal`
--
ALTER TABLE `jadwal`
  ADD CONSTRAINT `jadwal_ibfk_1` FOREIGN KEY (`id_kegiatan`) REFERENCES `kegiatan` (`id_kegiatan`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `kegiatan_detail`
--
ALTER TABLE `kegiatan_detail`
  ADD CONSTRAINT `kegiatan_detail_ibfk_1` FOREIGN KEY (`id_anggota`) REFERENCES `anggota` (`id_anggota`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `kegiatan_detail_ibfk_2` FOREIGN KEY (`id_kegiatan`) REFERENCES `kegiatan` (`id_kegiatan`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `kegiatan_detail_ibfk_4` FOREIGN KEY (`id_users`) REFERENCES `users` (`id_users`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
