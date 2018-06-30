-- phpMyAdmin SQL Dump
-- version 4.7.7
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: Jun 30, 2018 at 10:57 AM
-- Server version: 10.1.30-MariaDB
-- PHP Version: 7.2.1

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `absen_cai`
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
(2, 1, '2018-06-25 05:12:36', 1, 1, '2018-06-26 01:32:20', '2018-06-24 21:12:36'),
(3, 3, '2018-06-26 06:54:30', 1, 1, '2018-06-25 22:54:30', '2018-06-25 22:54:30'),
(6, 6, '2018-06-27 08:46:07', 1, 1, '2018-06-27 00:46:07', '2018-06-27 00:46:07'),
(8, 7, '2018-06-27 13:00:24', 1, 1, '2018-06-27 05:00:24', '2018-06-27 05:00:24'),
(9, 9, '2018-06-30 00:46:54', 2, 1, '2018-06-29 16:46:54', '2018-06-29 16:46:54');

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
(1, 'MAMAT', 1, '2018-06-22', 'SAMARINDA', 'KARANG MUMUS', 'laki-laki', '085391791228', 'uhuy@gmail.com', 'JLN. MUSO SALIM', 'PAKETAN', 'XLL', 'TUKANG RUQYAH', 'ULAMA', '2018-06-26 01:13:24', '2018-06-24 20:12:48'),
(2, 'KING T\'CHALLA', 2, '2018-06-30', 'SAMARINDA', 'BLACK PANTHER', 'laki-laki', '08888888888888', 't\'chall@mail.com', 'JLN. BATU ANGIN', 'JAGOAN', 'XL', 'SEPUH', 'RAJA', '2018-06-26 14:12:24', '2018-06-25 22:24:02'),
(3, 'PANGGALIH HUSODO', 3, '1994-11-18', 'MALANG', 'SAMARINDA ULU', 'laki-laki', '0813-5015-7264', 'gnom354@yahoo.com', '-', 'KIRIMAN', 'XL', 'KETUA MUDA/I', 'MUBALLIGH SETEMPAT', '2018-06-26 07:26:13', '2018-06-26 07:26:13'),
(4, 'NADIA KURNIKOVA', 5, '2003-08-11', 'SAMARINDA', 'SAMARINDA ULU', 'perempuan', '0853-9058-9108', '-', '-', 'KIRIMAN', 'XL', 'ROKYAH', 'PELAJAR', '2018-06-26 07:26:13', '2018-06-26 07:26:13'),
(5, 'NOVIA RATNA SARI', 4, '1997-11-04', 'SAMARINDA', 'SAMARINDA ULU', 'perempuan', '0813-8512-1140', '-', '-', 'KIRIMAN', 'XL', 'KEPUTRIAN KELOMPOK', 'MUBALLIGH SETEMPAT', '2018-06-26 07:26:13', '2018-06-26 07:26:13'),
(6, 'KHODIJAH KIKI LESTARI', 5, '1995-04-30', 'SAMARINDA', 'SAMBUTAN', 'perempuan', '0822 5512 1207', 'khodijahklestari@gmail.com', '-', 'KIRIMAN', 'L', 'KEPUTRIAN DESA', 'MUBALLIGH SETEMPAT', '2018-06-26 07:26:13', '2018-06-26 07:26:13'),
(7, 'MUHAMMAD AFIF', 6, '1998-02-13', 'SAMARINDA', 'SAMBUTAN', 'laki-laki', '0812 5383 9523', 'afif1998m@gmail.com', '-', 'KIRIMAN', 'XL', 'KETUA MUDA MUDI ', 'MAHASISWA', '2018-06-26 07:26:13', '2018-06-26 07:26:13'),
(8, 'MUHAMMAD NUR HUDA', 5, '1996-11-01', 'SAMARINDA', 'SAMBUTAN', 'laki-laki', '0823 0148 2826', '-', '-', 'KIRIMAN', 'L', 'ROKYAH', 'KERJA', '2018-06-26 07:26:13', '2018-06-26 07:26:13'),
(9, 'FADLI UMAR HAMDAN', 6, '2000-04-26', 'SAMARINDA', 'SAMBUTAN', 'laki-laki', '0823 5306 8300', 'fedli354@gmail.com', '-', 'KIRIMAN', 'M', 'WAKIL KETUA MUDA MUDI', 'PELAJAR', '2018-06-26 07:26:13', '2018-06-26 07:26:13'),
(10, 'BAGUSTO PRANTAU PRATMAJAYA', 5, '1998-11-28', 'BALIKPAPAN', 'SAMARINDA SEBERANG', 'laki-laki', '0821 3963 7760', 'Bagussatrya2898@gmail.com', '-', 'KIRIMAN', 'XL', 'WAKIL KETUA MUDA/I', 'MAHASISWA', '2018-06-26 07:26:13', '2018-06-26 07:26:13'),
(11, 'IRVAN JAENUDIN', 3, '1998-05-28', 'BITUNG', 'SAMARINDA SEBERANG', 'laki-laki', '-', '-', '-', 'KIRIMAN', 'L', 'MUBALLIGH TUGASAN', 'MUBALLIGH TUGASAN', '2018-06-26 07:26:13', '2018-06-26 07:26:13'),
(12, 'UCHIHA SASUKE', 7, '1997-06-23', 'KONOHAGAKURE', 'KONOHA', 'laki-laki', '0888 8888 8888', 'sasukegagah@gmail.com', 'JLN. PERUM UCHIHA BLOK 1', 'KIRIMAN', 'XL', 'FREELANCER', 'VETERAN PERANG', '2018-06-28 22:20:15', '2018-06-28 22:20:15'),
(14, 'HAGOROMO OTSUTSUKI', 8, '1290-06-23', 'BUMI', 'DEWA SHINOBI', 'perempuan', '0888 8888 8888', 'hagoromonakmamah@gmail.com', 'JLN. SETAPAK DI SEBUAH DESA', 'PENDATANG', 'XL', 'GURU', 'TUKANG SEGEL', '2018-06-28 22:21:20', '2018-06-28 22:21:20'),
(15, 'HAGOROMO OTSUTSUKI', 9, '1290-06-23', 'BUMI', 'DEWA SHINOBI', 'perempuan', '0888 8888 8888', 'hagoromonakmamah@gmail.com', 'JLN. SETAPAK DI SEBUAH DESA', 'PENDATANG', 'XL', 'GURU', 'TUKANG SEGEL', '2018-06-29 20:55:30', '2018-06-29 20:55:30'),
(16, 'PANGGALIH HUSODO', 12, '1994-11-18', 'MALANG', 'SAMARINDA ULU', 'laki-laki', '0813 5015 7264', 'gnom354@yahoo.com', '-', 'KIRIMAN', 'XL', 'KETUA MUDA/I', 'MUBALLIGH SETEMPAT', '2018-06-30 00:29:33', '2018-06-30 00:29:33'),
(17, 'NADIA KURNIKOVA', 12, '2003-08-11', 'SAMARINDA', 'SAMARINDA ULU', 'perempuan', '0853 9058 9108', '-', '-', 'KIRIMAN', 'XL', 'ROKYAH', 'PELAJAR', '2018-06-30 00:29:33', '2018-06-30 00:29:33'),
(18, 'NOVIA RATNA SARI', 12, '1997-11-04', 'SAMARINDA', 'SAMARINDA ULU', 'perempuan', '0813 8512 1140', '-', '-', 'KIRIMAN', 'XL', 'KEPUTRIAN KELOMPOK', 'MUBALLIGH SETEMPAT', '2018-06-30 00:29:33', '2018-06-30 00:29:33'),
(19, 'KHODIJAH KIKI LESTARI', 30, '1995-04-30', 'SAMARINDA', 'SAMBUTAN', 'perempuan', '0822 5512 1207', 'khodijahklestari@gmail.com', '-', 'KIRIMAN', 'L', 'KEPUTRIAN DESA', 'MUBALLIGH SETEMPAT', '2018-06-30 00:29:34', '2018-06-30 00:29:34'),
(20, 'MUHAMMAD AFIF', 30, '1998-02-13', 'SAMARINDA', 'SAMBUTAN', 'laki-laki', '0812 5383 9523', 'afif1998m@gmail.com', '-', 'KIRIMAN', 'XL', 'KETUA MUDA MUDI ', 'MAHASISWA', '2018-06-30 00:29:34', '2018-06-30 00:29:34'),
(21, 'MUHAMMAD NUR HUDA', 30, '1996-11-01', 'SAMARINDA', 'SAMBUTAN', 'laki-laki', '0823 0148 2826', '-', '-', 'KIRIMAN', 'L', 'ROKYAH', 'KERJA', '2018-06-30 00:29:34', '2018-06-30 00:29:34'),
(22, 'FADLI UMAR HAMDAN', 30, '2000-04-26', 'SAMARINDA', 'SAMBUTAN', 'laki-laki', '0823 5306 8300', 'fedli354@gmail.com', '-', 'KIRIMAN', 'M', 'WAKIL KETUA MUDA MUDI', 'PELAJAR', '2018-06-30 00:29:34', '2018-06-30 00:29:34'),
(23, 'BAGUSTO PRANTAU PRATMAJAYA', 17, '1998-11-28', 'BALIKPAPAN', 'SAMARINDA SEBERANG', 'laki-laki', '0821 3963 7760', 'Bagussatrya2898@gmail.com', '-', 'KIRIMAN', 'XL', 'WAKIL KETUA MUDA/I', 'MAHASISWA', '2018-06-30 00:29:34', '2018-06-30 00:29:34'),
(24, 'IRVAN JAENUDIN', 17, '1998-05-28', 'BITUNG', 'SAMARINDA SEBERANG', 'laki-laki', '-', '-', '-', 'KIRIMAN', 'L', 'MUBALLIGH TUGASAN', 'MUBALLIGH TUGASAN', '2018-06-30 00:29:34', '2018-06-30 00:29:34'),
(25, 'ADAM AGUNG NUGROHO', 17, '1997-10-08', 'SAMARINDA', 'SAMARINDA SEBERANG', 'laki-laki', '0813 4745 5353', 'Adam.agung.nugroho@gmail.com', '-', 'KIRIMAN', 'XL', 'KETUA MUDA/I', 'MAHASISWA', '2018-06-30 00:29:34', '2018-06-30 00:29:34'),
(26, 'RIAN AZANNOVA', 35, '1994-05-07', 'SAMARINDA', 'SAMARINDA ULU', 'laki-laki', '0812 5050 0031', 'rianazannova@yahoo.com', '-', 'KIRIMAN', 'M', 'KETUA MUDA/I', 'MAHASISWA', '2018-06-30 00:29:34', '2018-06-30 00:29:34'),
(27, 'QORI RIA PERTIWI', 30, '1996-08-04', 'SAMARINDA', 'SAMBUTAN', 'perempuan', '0852 5734 8749', '-', '-', 'KIRIMAN', 'L', 'KEPUTRIAN KELOMPOK', 'MUBALLIGH SETEMPAT', '2018-06-30 00:29:34', '2018-06-30 00:29:34'),
(28, 'MUHAMMAD RAMZY', 24, '2003-06-08', 'MUARA BADAK', 'SAMARINDA ILIR', 'laki-laki', '-', '-', '-', 'KIRIMAN', 'M', '-', 'PELAJAR', '2018-06-30 00:29:34', '2018-06-30 00:29:34'),
(29, 'MUHAMMAD IDHAM ALGHIFARI', 24, '2003-03-15', 'MUARA BADAK', 'SAMARINDA ILIR', 'laki-laki', '-', '-', '-', 'KIRIMAN', 'M', '-', 'PELAJAR', '2018-06-30 00:29:34', '2018-06-30 00:29:34'),
(30, 'FIRMAN', 22, '1987-11-12', 'SAMARINDA', 'SAMARINDA SEBERANG', 'laki-laki', '0857 8586 8289', '-', '-', 'KIRIMAN', 'M', 'WAKIL KETUA MUDA/I', 'MUBALLIGH SETEMPAT', '2018-06-30 00:29:34', '2018-06-30 00:29:34'),
(31, 'ARIS WIBOWO', 22, '1994-05-29', 'PALEMBANG ', 'SAMARINDA SEBERANG', 'laki-laki', '0823 5187 2854', '-', '-', 'KIRIMAN', 'L', 'KETUA MUDA/I ', 'MUBALLIGH SETEMPAT', '2018-06-30 00:29:34', '2018-06-30 00:29:34'),
(32, 'RICHA HANIFA FILLA', 24, '1999-07-05', 'MUARA BADAK', 'SAMARINDA ILIR', 'perempuan', '-', '-', '-', 'KIRIMAN', 'L', '-', 'PELAJAR', '2018-06-30 00:29:34', '2018-06-30 00:29:34'),
(33, 'MUHAMMAD SHODIQIN', 22, '1999-09-28', 'SUKA RAJA 3', 'SAMARINDA SEBERANG', 'laki-laki', '0813 5069 0009', '--', '-', 'KIRIMAN', 'M', '-', 'MUBALLIGH TUGASAN', '2018-06-30 00:29:34', '2018-06-30 00:29:34'),
(34, 'TIARA IZZA NAFILA', 24, '2000-07-12', 'BANDUNG', 'SAMARINDA ILIR', 'perempuan', '-', '-', '-', 'KIRIMAN', 'M', 'TIM KEPUTRIAN', 'PELAJAR', '2018-06-30 00:29:35', '2018-06-30 00:29:35'),
(35, 'MUHSIN RUSDIYANTO', 37, '1994-10-12', 'JAMBI', 'SAMARINDA ULU', 'laki-laki', '0823 0710 4354', 'Tsholihanhuda@gmail.com', '-', 'KIRIMAN', 'L', 'MT', 'MUBALLIGH TUGASAN', '2018-06-30 00:29:35', '2018-06-30 00:29:35'),
(36, 'ABDUL MALIK', 25, '1996-12-17', 'SIDODADI RAMUNIA', 'SAMARINDA SEBERANG', 'laki-laki', '0815 5422 1634', 'abdulmalik427@ymail.com', '-', 'KIRIMAN', 'M', 'MUBALLIGH TUGASAN', 'MUBALLIGH TUGASAN', '2018-06-30 00:29:35', '2018-06-30 00:29:35'),
(37, 'CAHYO WIDODO', 25, '1991-03-13', 'SAMARINDA', 'SAMARINDA SEBERANG', 'laki-laki', '0852 3358 0147', 'cahyowidodo5124k@gmail.com', '-', 'KIRIMAN', 'L', 'TIM IT', 'PEGAWAI HONORER', '2018-06-30 00:29:35', '2018-06-30 00:29:35'),
(38, 'RADEN BAGUS WIJAYA KESUMA', 37, '2001-12-10', 'SAMARINDA', 'SAMARINDA ULU', 'laki-laki', '0831 4001 1616', 'radenbagus487@gmail.com', '-', 'KIRIMAN', 'M', 'ROQYAH', 'PELAJAR', '2018-06-30 00:29:35', '2018-06-30 00:29:35'),
(39, 'RIDWAN DWI PUTRA', 16, '2001-04-07', 'SAMARINDA', 'SAMARINDA ILIR', 'laki-laki', '0831 4019 7145', 'yahya3131@gmail.com', '-', 'KIRIMAN', 'L', 'SEKSI OLAHRAGA', 'PELAJAR', '2018-06-30 00:29:35', '2018-06-30 00:29:35'),
(40, 'ABDUH ALDIN ABID ROBBANI', 16, '2000-11-24', 'SAMARINDA', 'SAMARINDA ILIR', 'laki-laki', '0823 5044 1904', 'crusherXT99@gmail.com', '-', 'KIRIMAN', 'M', 'PENEROBOS', 'PELAJAR', '2018-06-30 00:29:35', '2018-06-30 00:29:35'),
(41, 'NIKMAJ MAISYI RODZIAH', 10, '1997-07-02', 'SAMARINDA', 'SAMARINDA ULU', 'perempuan', '-', '-', '', 'KIRIMAN', 'XL', '-', 'MUBALLIGH TUGASAN', '2018-06-30 00:29:35', '2018-06-30 00:29:35'),
(42, 'FAUZI ABDUL MANAN', 10, '1999-09-19', 'SAMARINDA', 'SAMARINDA ULU', 'laki-laki', '-', '-', '', 'KIRIMAN', 'L', '-', 'MUBALLIGH SETEMPAT', '2018-06-30 00:29:35', '2018-06-30 00:29:35'),
(43, 'ADITYA ABDUL FAJAR', 38, '2001-10-16', 'SAMARINDA', 'SAMARINDA ULU', 'laki-laki', '0813 4217 4251', 'aditya1abdul@gmail.com', '', 'KIRIMAN', 'L', 'PENEROBOS PELAJAR', 'PELAJAR', '2018-06-30 00:29:35', '2018-06-30 00:29:35'),
(44, 'PURI AZKA OCTAVIA', 38, '1997-10-19', 'SEMARANG', 'SAMARINDA ULU', 'perempuan', '0815 4803 5361', 'purioctavia354@gmail.com', '', 'KIRIMAN', 'L', 'MT', 'MUBALLIGH TUGASAN', '2018-06-30 00:29:35', '2018-06-30 00:29:35'),
(45, 'SAFULLOH', 38, '1999-08-30', 'ACEH', 'SAMARINDA ULU', 'laki-laki', '0821 1193 8455', 'saifullohaceh@gmail.com', '', 'KIRIMAN', 'L', 'MT', 'MUBALLIGH TUGASAN', '2018-06-30 00:29:35', '2018-06-30 00:29:35'),
(46, 'ANDRI KURNIAWAN', 20, '1996-01-11', 'SERAGEN', 'SAMARINDA SEBERANG', 'laki-laki', '0852 5020 2757', 'andrikurn45@gmail.com', '', 'KIRIMAN', 'L', 'KETUA MUDA/I', 'MUBALLIGH SETEMPAT', '2018-06-30 00:29:35', '2018-06-30 00:29:35'),
(47, 'MAULANA MALIK IBRAHIM', 11, '2000-12-09', 'SAMARINDA', 'SAMBUTAN', 'laki-laki', '0821 5780 3900', 'Wahyu_d95@yahoo.co.id', '', 'KIRIMAN', 'XL', 'WAKIL KETUA', 'BEKERJA', '2018-06-30 00:29:35', '2018-06-30 00:29:35'),
(48, 'MUSTAQIM', 11, '1993-01-06', 'MAKASSAR', 'SAMBUTAN', 'laki-laki', '0821 5780 3900', 'Wahyu_d95@yahoo.co.id', '', 'KIRIMAN', 'M', 'MT', 'MUBALLIGH SETEMPAT', '2018-06-30 00:29:35', '2018-06-30 00:29:35'),
(49, 'SAHRUL', 11, '1997-06-06', 'TANJUNG SANTAN', 'SAMBUTAN', 'laki-laki', '0821 5780 3900', 'Wahyu_d95@yahoo.co.id', '', 'KIRIMAN', 'XL', 'KETUA MUDA MUDI', 'MAHASISWA', '2018-06-30 00:29:35', '2018-06-30 00:29:35'),
(50, 'MUHAMMAD YUSUF ASYIFA\'G', 16, '1998-12-31', 'PARE', 'SAMARINDA ILIR', 'laki-laki', '0821 5465 1347', 'yahya3131@gmail.com', '', 'KIRIMAN', 'L', 'MUBALIGH TUGASAN', 'MUBALLIGH TUGASAN', '2018-06-30 00:29:35', '2018-06-30 00:29:35'),
(51, 'CINDI FITRIA NISAUL KHASANAH', 23, '2000-01-17', 'DEMAK', 'SAMARINDA ILIR', 'perempuan', '0855 4667 3009', 'cindifitria17@gmail.com', '', 'KIRIMAN', 'L', '-', 'MUBALLIGH SETEMPAT', '2018-06-30 00:29:35', '2018-06-30 00:29:35'),
(52, 'RAHMATUL ISTUNING AZIZAH', 23, '1998-10-03', 'BATAM', 'SAMARINDA ILIR', 'perempuan', '0813 4749 1095', 'rahmatulistuning@gmail.com', '', 'KIRIMAN', 'XL', 'BENDAHARA', 'MAHASISWA', '2018-06-30 00:29:35', '2018-06-30 00:29:35'),
(53, 'LATIFAH USWATUN KHASANAH', 14, '1997-07-01', 'SAMARINDA', 'SAMARINDA ILIR', 'perempuan', '0852 4667 9830', 'latifah.khasanah7@gmail.com', '', 'KIRIMAN', 'XL', 'PENEROBOS MUDA/I', 'MUBALLIGH SETEMPAT', '2018-06-30 00:29:35', '2018-06-30 00:29:35'),
(54, 'AHMAD YUSUF', 14, '1993-07-02', 'LAMPUNG', 'SAMARINDA ILIR', 'laki-laki', '0857 3251 1354', 'akhmadyusufaja@gmail.com', '', 'KIRIMAN', 'M', 'KETUA MUDA/I', 'MUBALLIGH SETEMPAT', '2018-06-30 00:29:35', '2018-06-30 00:29:35'),
(55, 'AYU DINIA BELADINI', 14, '1996-12-28', 'SAMARINDA', 'SAMARINDA ILIR', 'perempuan', '0853 8757 8192', 'ayudiniabeladina@gmail.com', '', 'KIRIMAN', 'L', '-', 'MAHASISWA', '2018-06-30 00:29:35', '2018-06-30 00:29:35'),
(56, 'KHOIRUN NISA', 10, '1998-03-17', 'SAMARINDA', 'SAMARINDA ULU', 'perempuan', '-', '-', '', 'KIRIMAN', 'L', '-', 'MUBALLIGH SETEMPAT', '2018-06-30 00:29:36', '2018-06-30 00:29:36'),
(57, 'LATIFA NUR ISNAINI ', 20, '2003-12-22', 'BALIKPAPAN', 'SAMARINDA SEBERANG', 'perempuan', '-', '-', '', 'KIRIMAN', 'XL', '-', 'PELAJAR', '2018-06-30 00:29:36', '2018-06-30 00:29:36'),
(58, 'ARIF ROMADHON', 20, '1999-01-02', 'BANJAR NEGARA ', 'SAMARINDA SEBERANG', 'laki-laki', '0857 3325 8575', '-', '', 'PERSON', 'L', 'MT', 'MUBALLIGH TUGASAN', '2018-06-30 00:29:36', '2018-06-30 00:29:36'),
(59, 'SAIDAH AYU ASRIE AWALINE', 20, '2002-01-16', 'SERAGEN', 'SAMARINDA SEBERANG', 'perempuan', '0853 5050 7338', 'Asrieawalinenei@gmail.com', '', 'PERSON', 'XL', 'KEPUTRIAN ', 'PELAJAR', '2018-06-30 00:29:36', '2018-06-30 00:29:36'),
(60, 'LULUK ROYHAN', 23, '1999-04-13', 'JAKARTA', 'SAMARINDA ILIR', 'perempuan', '0852 5000 6099', 'luluk_royhan88@yahoo.com', '', 'KIRIMAN', 'XL', '-', 'MUBALLIGH TUGASAN', '2018-06-30 00:29:36', '2018-06-30 00:29:36'),
(61, 'ALMAI BARIDA', 35, '2001-08-15', 'SAMARINDA', 'SAMARINDA ULU', 'perempuan', '0813 5059 9816', 'almaibarida123@gmail.com', '', 'KIRIMAN', 'L', 'TIM DOCUMENTASI DESA', 'PELAJAR', '2018-06-30 00:29:36', '2018-06-30 00:29:36'),
(62, 'QOONITHA MIFTAHUL JANNAH', 35, '2001-11-07', 'SAMARINDA', 'SAMARINDA ULU', 'perempuan', '0853 4781 2267', 'qoonithamj@gmail.com', '', 'KIRIMAN', 'XL', 'KOOR. KEPUTRIAN DESA', 'MAHASISWA', '2018-06-30 00:29:36', '2018-06-30 00:29:36'),
(63, 'RESTY RAFIKA SANDY', 35, '1995-12-23', 'SAMARINDA', 'SAMARINDA ULU', 'perempuan', '0812 5838 4559', 'restysandy95@gmail.com', '', 'KIRIMAN', 'L', 'KEPUTRIAN KELOMPOK', 'MUBALLIGH SETEMPAT', '2018-06-30 00:29:36', '2018-06-30 00:29:36'),
(64, 'ANDIKA BAYU MANDALA', 37, '1997-07-28', 'MADIUN', 'SAMARINDA ULU', 'laki-laki', '0821 4914 0802', 'abmmaki2807@yahoo.com', '', 'KIRIMAN', 'M', 'BENDAHARA', 'MAHASISWA', '2018-06-30 00:29:36', '2018-06-30 00:29:36'),
(66, 'GADING DWI NUR HAYATI', 36, '1994-10-27', 'SAMARINDA', 'SAMARINDA ILIR', 'perempuan', '0823 3046 6423', 'gadingdn7@gmail.com', '', 'KIRIMAN', 'M', 'KEPUTRIAN DAERAH DAN SEKRETARIS MUMI KELOMPOK', 'MUBALLIGH TUGASAN', '2018-06-30 00:36:13', '2018-06-30 00:36:13'),
(67, 'MUHAMMAD NURLI', 34, '1996-10-19', 'SAMARINDA', 'SAMBUTAN', 'laki-laki', '0812 3280 1896', 'nurlijokam354@gmail.com', '', 'KIRIMAN', 'L', 'MT', 'MUBALLIGH TUGASAN', '2018-06-30 00:36:13', '2018-06-30 00:36:13'),
(68, 'MUHAMMAD YUSUF EFENDI', 34, '1996-08-21', 'SAMARINDA', 'SAMBUTAN', 'laki-laki', '0823 3511 1285', 'yusufefendi9621@gmail.com', '', 'KIRIMAN', 'L', 'PENEROBOS DESA', 'MUBALLIGH SETEMPAT', '2018-06-30 00:36:13', '2018-06-30 00:36:13'),
(69, 'NAJIB ASALABI', 15, '2018-06-12', 'JAKARTA', 'SAMARINDA ILIR', 'laki-laki', '0856 0116 2641', '-', '', 'KIRIMAN', 'M', 'MT', 'MUBALLIGH TUGASAN', '2018-06-30 00:36:13', '2018-06-30 00:36:13'),
(70, 'VENNA REVILDA VIENTY', 15, '1999-08-26', 'SAMARINDA', 'SAMARINDA ILIR', 'perempuan', '0831 4018 2650', 'Vientyvennarevilda@gmail.com', '', 'KIRIMAN', 'L', 'KU', 'PELAJAR', '2018-06-30 00:36:13', '2018-06-30 00:36:13'),
(71, 'IMAS MAZDHATUL KHUSNA', 15, '1998-11-11', 'SAMARINDA', 'SAMARINDA ILIR', 'perempuan', '0823 5868 2221', 'Imasazna@gmail.com', '', 'KIRIMAN', 'M', 'MT', 'MUBALLIGH TUGASAN', '2018-06-30 00:36:13', '2018-06-30 00:36:13'),
(72, 'RISNA ZUYYINA', 15, '1997-05-05', 'LAMONGAN', 'SAMARINDA ILIR', 'perempuan', '0852 1589 5080', 'Zuyyinarisna@gmail.com', '', 'KIRIMAN', 'XL', 'KEPUTRIAN DAERAH', 'MAHASISWA', '2018-06-30 00:36:13', '2018-06-30 00:36:13'),
(73, 'BIMA IZZA PRAMUDYA', 15, '2004-02-02', 'KEDIRI', 'SAMARINDA ILIR', 'laki-laki', '-', '-', '', 'KIRIMAN', 'M', 'PENEROBOS MUDA-MUDI KELOMPOK', 'PELAJAR', '2018-06-30 00:36:13', '2018-06-30 00:36:13'),
(74, 'ROSITA', 31, '1996-08-18', 'SAMARINDA', 'SAMARINDA SEBERANG', 'perempuan', '0\\856 5083 6651', 'Rositawati@gmail.com', '', 'KIRIMAN', 'L', 'MT', 'MUBALLIGH TUGASAN', '2018-06-30 00:36:13', '2018-06-30 00:36:13'),
(75, 'FAUZI ANDILLAH', 14, '1996-03-12', 'TANJUNG PANDAN', 'SAMARINDA ILIR', 'laki-laki', '0812 3906 4282', '-', '', 'KIRIMAN', 'L', '-', 'MUBALLIGH TUGASAN', '2018-06-30 00:36:14', '2018-06-30 00:36:14'),
(76, 'ZAKI SABTA MAULANA', 13, '1999-01-01', 'LAMPUNG', 'SAMARINDA ULU', 'laki-laki', '0816 4945 6143', 'TIDAK', '', 'KIRIMAN', 'XL', 'MT', 'MUBALLIGH TUGASAN', '2018-06-30 00:36:14', '2018-06-30 00:36:14'),
(77, 'GAGAS PRAYUDA BAKTI', 21, '1997-04-15', 'GARUT', 'SAMBUTAN', 'laki-laki', '0821 9847 6933', 'Gagaspb@yahoo.co.id', '', 'KIRIMAN', 'L', 'MT', 'MUBALLIGH TUGASAN', '2018-06-30 00:36:14', '2018-06-30 00:36:14'),
(78, 'HASAN ABDI ', 13, '1990-02-13', 'SAMARINDA ', 'SAMARINDA ULU', 'laki-laki', '0857 0888 2227', 'hasan.limid@gmail.com', '', 'KIRIMAN', 'XL', 'KETUA MUDA/I KELOMPOK', 'SARJANA & MUBALLIGH', '2018-06-30 00:36:14', '2018-06-30 00:36:14'),
(79, 'M.ROYAN PRADANA', 21, '2002-04-24', 'SAMARINDA', 'SAMBUTAN', 'laki-laki', '0822 5536 6083', 'royan.pradana@gmail.com', '', 'KIRIMAN', 'XXL', 'PENEROBOS', 'PELAJAR', '2018-06-30 00:36:14', '2018-06-30 00:36:14'),
(80, 'BUMBUNG TEGAR RAPIDANI PUTRA', 21, '1999-11-30', 'SAMARINDA', 'SAMBUTAN', 'laki-laki', '0858 6611 2274', 'Btrdp28@gmail.com', '', 'KIRIMAN', 'L', 'MUDA-MUDI', 'PELAJAR', '2018-06-30 00:36:14', '2018-06-30 00:36:14'),
(81, 'M. GARIN NUGROHO', 18, '2000-04-21', 'SAMARINDA', 'SAMARINDA ULU', 'laki-laki', '-', 'garin0420@gmail.com', '', 'KIRIMAN', 'S', '-', 'MUBALLIGH SETEMPAT', '2018-06-30 00:36:14', '2018-06-30 00:36:14'),
(82, 'ROSITA', 25, '1996-08-18', 'SAMARINDA', 'SAMARINDA SEBERANG', 'perempuan', '0856 5083 6651', 'rositawati@gmail.com', '', 'KIRIMAN', 'L', 'MUBALLIGHOT', 'MUBALLIGH TUGASAN', '2018-06-30 00:36:14', '2018-06-30 00:36:14'),
(83, 'IWAN', 19, NULL, '-', 'SAMARINDA ULU', 'laki-laki', '-', '-', '', 'KIRIMAN', 'L', '-', '-', '2018-06-30 00:38:19', '2018-06-30 00:38:19'),
(84, 'AJENG IMTINAN ROFI\'AH', 19, '1998-11-08', 'UJUNG PANDANG', 'SAMARINDA ULU', 'perempuan', '0812 3342 0902', 'ajengimtinan@gmail.com', '', 'KIRIMAN', 'XXL', 'TIM KEILMUAN', 'MUBALLIGH TUGASAN', '2018-06-30 00:38:19', '2018-06-30 00:38:19'),
(85, 'SONIA TAMALA SHELA', 19, '1999-11-07', 'SAKA JAYA', 'SAMARINDA ULU', 'perempuan', '0878 4207 7352', 'soniatamalashela07@gmail.com', '', 'KIRIMAN', 'M', 'TIM KEILMUAN', 'MUBALLIGH TUGASAN', '2018-06-30 00:38:19', '2018-06-30 00:38:19'),
(86, 'RIMA NOVITA KUSUMA NINGRUM', 19, '1999-11-18', 'SAMARINDA', 'SAMARINDA ULU', 'perempuan', '0852 4836 6064', 'rimanovita1811@gmail.com', '', 'KIRIMAN', 'Double L', 'BENDAHARA', 'MAHASISWA', '2018-06-30 00:38:19', '2018-06-30 00:38:19'),
(87, 'RIDWAN', 18, '1998-09-30', 'SAMARINDA', 'SAMARINDA ULU', 'laki-laki', '0852 5038 8643', '-', '', 'KIRIMAN', 'L', 'TIM KEILMUAN', 'MUBALLIGH TUGASAN', '2018-06-30 00:38:19', '2018-06-30 00:38:19'),
(88, 'MELINDA ARIS DWIYANTI', 19, '1998-05-27', 'SAMARINDA', 'SAMARINDA ULU', 'perempuan', '852 5181 8284', 'melindaarnis07@gmail.com', '', 'KIRIMAN', 'L', 'BENDAHARA MUMI KELOMPOK', 'MAHASISWA', '2018-06-30 00:38:19', '2018-06-30 00:38:19'),
(92, 'ANITA PUSPITASARI', 39, '1997-10-11', 'BEKASI', 'SAMARINDA ULU', 'perempuan', '0857 1710 2128', 'Anitapuspita644@gmail.com', '', 'PERSON', 'XL', 'MT', 'MUBALLIGH TUGASAN', '2018-06-30 00:40:29', '2018-06-30 00:40:29'),
(93, 'AMIN', 39, '2018-06-21', '-', 'SAMARINDA ILIR', 'laki-laki', '-', '-', '', 'KIRIMAN', 'L', 'MT', 'MUBALLIGH TUGASAN', '2018-06-30 00:40:29', '2018-06-30 00:40:29'),
(94, 'YUSUF', 39, '2018-06-21', '-', 'SAMARINDA ILIR', 'laki-laki', '-', '-', '', 'KIRIMAN', 'L', 'KETUA MUDA-MUDI', '-', '2018-06-30 00:40:29', '2018-06-30 00:40:29'),
(95, 'M. REZA', 39, '2018-06-21', '-', 'SAMARINDA ILIR', 'laki-laki', '-', '-', '', 'KIRIMAN', 'L', '-', '-', '2018-06-30 00:40:29', '2018-06-30 00:40:29'),
(96, 'RAHMAT EFENDI', 36, '1993-12-28', 'BERAU', 'SAMARINDA ILIR', 'laki-laki', '0822 5574 3815', 'rhmtefendi28@gmail.com', '', 'KIRIMAN', 'M', 'WAKIL KETUA MUMI', 'MUBALLIGH SETEMPAT', '2018-06-30 00:40:29', '2018-06-30 00:40:29'),
(97, 'ADAM BARORRI', 36, '1997-10-03', 'SAMARINDA', 'SAMARINDA ILIR', 'laki-laki', '0813 1260 3334', 'Adambarori03@gmail.com', '', 'PERSON', 'XL', 'WAKIL MUDA/I', 'MUBALLIGH SETEMPAT', '2018-06-30 00:40:29', '2018-06-30 00:40:29'),
(98, 'MUH ROIHAN', 36, '1998-06-14', 'KOWIOHA', 'SAMARINDA ILIR', 'laki-laki', '0822 5291 9846', 'Muhammad. Roihan@gmail.com', '', 'KIRIMAN', 'M', 'MT', 'MUBALLIGH TUGASAN', '2018-06-30 00:40:29', '2018-06-30 00:40:29'),
(99, 'MUHAMMAD RIZKY FITRIANSYAH', 34, '1994-07-10', 'SAMARINDA', 'SAMBUTAN', 'laki-laki', '0813 8902 7737', 'rezky.mochi@gmail.com', '', 'KIRIMAN', 'L', 'MT', 'MUBALLIGH SETEMPAT', '2018-06-30 00:40:29', '2018-06-30 00:40:29'),
(100, 'ELHAM ALVI WIJAYA', 13, '2002-04-06', 'SAMARINDA', 'SAMARINDA ULU', 'laki-laki', '-', '-', '', 'KIRIMAN', 'L', 'WAKIL MUMI KELOMPOK', 'PELAJAR', '2018-06-30 00:40:29', '2018-06-30 00:40:29'),
(101, 'ROYAN HIDAYATULLAH', 20, '2003-01-15', 'LOA DURI', 'SAMARINDA SEBERANG', 'laki-laki', '0857 5375 0206', '-', '', 'PERSON', 'L', '-', 'PELAJAR', '2018-06-30 00:40:29', '2018-06-30 00:40:29'),
(102, 'DINAR TARATIH WULANDARI', 16, '2004-05-05', 'JOMBANG', 'SAMARINDA ILIR', 'perempuan', '0852 5050 7793', '-', '', 'KIRIMAN', 'M', '-', '-', '2018-06-30 00:40:29', '2018-06-30 00:40:29'),
(103, 'ABDUL MANAN', 32, NULL, '', '', '', '', '', '', '', '', '', '', '2018-06-30 00:40:29', '2018-06-30 00:40:29'),
(104, 'ABDULLAH FURQON A.', 32, NULL, '', '', '', '', '', '', '', '', '', '', '2018-06-30 00:40:29', '2018-06-30 00:40:29'),
(105, 'ADI SETIAWAN', 32, NULL, '', '', '', '', '', '', '', '', '', '', '2018-06-30 00:40:30', '2018-06-30 00:40:30'),
(106, 'AIZZAH MAYLA NUR BAITY', 32, NULL, '', '', '', '', '', '', '', '', '', '', '2018-06-30 00:40:30', '2018-06-30 00:40:30'),
(107, 'ALUNG SETYO UTOMO', 32, NULL, '', '', '', '', '', '', '', '', '', '', '2018-06-30 00:40:30', '2018-06-30 00:40:30'),
(108, 'AMANDA ZULFALAH', 32, NULL, '', '', '', '', '', '', '', '', '', '', '2018-06-30 00:40:30', '2018-06-30 00:40:30'),
(109, 'ANSHORUDDIN ABDILLAH', 32, NULL, '', '', '', '', '', '', '', '', '', '', '2018-06-30 00:40:30', '2018-06-30 00:40:30'),
(110, 'BAGAS AHMIL NURFALAH', 32, NULL, '', '', '', '', '', '', '', '', '', '', '2018-06-30 00:40:30', '2018-06-30 00:40:30'),
(111, 'BIMA SETIYAWAN', 32, NULL, '', '', '', '', '', '', '', '', '', '', '2018-06-30 00:40:30', '2018-06-30 00:40:30'),
(112, 'BUNYANU LINUWIH', 32, NULL, '', '', '', '', '', '', '', '', '', '', '2018-06-30 00:40:30', '2018-06-30 00:40:30'),
(113, 'DEWI NUR FADILLAH', 32, NULL, '', '', '', '', '', '', '', '', '', '', '2018-06-30 00:40:30', '2018-06-30 00:40:30'),
(114, 'EKA RAHMAWATI', 32, NULL, '', '', '', '', '', '', '', '', '', '', '2018-06-30 00:40:30', '2018-06-30 00:40:30'),
(115, 'FAZA FIRDAYANTI', 32, NULL, '', '', '', '', '', '', '', '', '', '', '2018-06-30 00:40:30', '2018-06-30 00:40:30'),
(116, 'HELMALIA PUTRI SYAIFFUDDIN', 32, NULL, '', '', '', '', '', '', '', '', '', '', '2018-06-30 00:40:30', '2018-06-30 00:40:30'),
(117, 'IKLASUL AMAL', 32, NULL, '', '', '', '', '', '', '', '', '', '', '2018-06-30 00:40:30', '2018-06-30 00:40:30'),
(118, 'IRVAN ANDHY M.', 32, NULL, '', '', '', '', '', '', '', '', '', '', '2018-06-30 00:40:30', '2018-06-30 00:40:30'),
(119, 'LIA SAFITRI', 32, NULL, '', '', '', '', '', '', '', '', '', '', '2018-06-30 00:40:30', '2018-06-30 00:40:30'),
(120, 'M. ABDUL MAJID', 32, NULL, '', '', '', '', '', '', '', '', '', '', '2018-06-30 00:40:31', '2018-06-30 00:40:31'),
(121, 'M. HAFID', 32, NULL, '', '', '', '', '', '', '', '', '', '', '2018-06-30 00:40:31', '2018-06-30 00:40:31'),
(122, 'M. INDRA MAULANA', 32, NULL, '', '', '', '', '', '', '', '', '', '', '2018-06-30 00:40:31', '2018-06-30 00:40:31'),
(123, 'M. NUR HASAN W.', 32, NULL, '', '', '', '', '', '', '', '', '', '', '2018-06-30 00:40:31', '2018-06-30 00:40:31'),
(124, 'M. RIDHO', 32, NULL, '', '', '', '', '', '', '', '', '', '', '2018-06-30 00:40:31', '2018-06-30 00:40:31'),
(125, 'M. RIZKY FAJAR', 32, NULL, '', '', '', '', '', '', '', '', '', '', '2018-06-30 00:40:31', '2018-06-30 00:40:31'),
(126, 'MULYADI ACHMAD', 32, NULL, '', '', '', '', '', '', '', '', '', '', '2018-06-30 00:40:31', '2018-06-30 00:40:31'),
(127, 'PUPUT SRI HARTANTI', 32, NULL, '', '', '', '', '', '', '', '', '', '', '2018-06-30 00:40:31', '2018-06-30 00:40:31'),
(128, 'PUTRI AULIA SHOLIHAH', 32, NULL, '', '', '', '', '', '', '', '', '', '', '2018-06-30 00:40:31', '2018-06-30 00:40:31'),
(129, 'PUTRI SOFIANTI', 32, NULL, '', '', '', '', '', '', '', '', '', '', '2018-06-30 00:40:31', '2018-06-30 00:40:31'),
(130, 'RIO WAHYU FERDIANSYAH', 32, NULL, '', '', '', '', '', '', '', '', '', '', '2018-06-30 00:40:31', '2018-06-30 00:40:31'),
(131, 'SITI SUBHIYATI', 32, NULL, '', '', '', '', '', '', '', '', '', '', '2018-06-30 00:40:31', '2018-06-30 00:40:31'),
(132, 'THORIQUL NURJANNAH', 32, NULL, '', '', '', '', '', '', '', '', '', '', '2018-06-30 00:40:31', '2018-06-30 00:40:31'),
(133, 'TRIADEVI MUTIARA HADI', 32, NULL, '', '', '', '', '', '', '', '', '', '', '2018-06-30 00:40:31', '2018-06-30 00:40:31'),
(134, 'UMI HANIK FIFI NAHARIN', 32, NULL, '', '', '', '', '', '', '', '', '', '', '2018-06-30 00:40:31', '2018-06-30 00:40:31'),
(135, 'ZULFA NISA ROHMAH', 32, NULL, '', '', '', '', '', '', '', '', '', '', '2018-06-30 00:40:31', '2018-06-30 00:40:31'),
(136, 'WILDAN IRSAT NURDIN', 32, NULL, '', '', '', '', '', '', '', '', '', '', '2018-06-30 00:40:31', '2018-06-30 00:40:31'),
(137, 'AL MUARIFAH', 32, NULL, '', '', '', '', '', '', '', '', '', '', '2018-06-30 00:40:31', '2018-06-30 00:40:31'),
(138, 'AMELIA CANDRA SARI', 32, NULL, '', '', '', '', '', '', '', '', '', '', '2018-06-30 00:40:32', '2018-06-30 00:40:32'),
(139, 'ANISA KHOIRIYANI', 32, NULL, '', '', '', '', '', '', '', '', '', '', '2018-06-30 00:40:32', '2018-06-30 00:40:32'),
(140, 'ARIS DA PRASTIYO', 32, NULL, '', '', '', '', '', '', '', '', '', '', '2018-06-30 00:40:32', '2018-06-30 00:40:32'),
(141, 'CHOIRIA NURUL AZIZAH', 32, NULL, '', '', '', '', '', '', '', '', '', '', '2018-06-30 00:40:32', '2018-06-30 00:40:32'),
(142, 'DHEVANDRA RICKY PUTRA P', 32, NULL, '', '', '', '', '', '', '', '', '', '', '2018-06-30 00:40:32', '2018-06-30 00:40:32'),
(143, 'DIAN ANGGRIANI', 32, NULL, '', '', '', '', '', '', '', '', '', '', '2018-06-30 00:40:32', '2018-06-30 00:40:32'),
(144, 'LULU LIKAYANITA', 32, NULL, '', '', '', '', '', '', '', '', '', '', '2018-06-30 00:40:32', '2018-06-30 00:40:32'),
(145, 'M. PUTRA ANDRIANTO', 32, NULL, '', '', '', '', '', '', '', '', '', '', '2018-06-30 00:40:32', '2018-06-30 00:40:32'),
(146, 'M. RIDUAN', 32, NULL, '', '', '', '', '', '', '', '', '', '', '2018-06-30 00:40:32', '2018-06-30 00:40:32'),
(147, 'M. SANDI PUTRA SAIDI', 32, NULL, '', '', '', '', '', '', '', '', '', '', '2018-06-30 00:40:32', '2018-06-30 00:40:32'),
(148, 'MELLRISTA RAMDANA', 32, NULL, '', '', '', '', '', '', '', '', '', '', '2018-06-30 00:40:32', '2018-06-30 00:40:32'),
(149, 'NINNA NUR ANNISA', 32, NULL, '', '', '', '', '', '', '', '', '', '', '2018-06-30 00:40:32', '2018-06-30 00:40:32'),
(150, 'NURUL ANNISA', 32, NULL, '', '', '', '', '', '', '', '', '', '', '2018-06-30 00:40:32', '2018-06-30 00:40:32'),
(151, 'RINI MISTIASARI', 32, NULL, '', '', '', '', '', '', '', '', '', '', '2018-06-30 00:40:32', '2018-06-30 00:40:32'),
(152, 'RIZKIA RAMADANTI', 32, NULL, '', '', '', '', '', '', '', '', '', '', '2018-06-30 00:40:32', '2018-06-30 00:40:32'),
(153, 'SITI MURNI NURHASANAH', 32, NULL, '', '', '', '', '', '', '', '', '', '', '2018-06-30 00:40:32', '2018-06-30 00:40:32'),
(154, 'VITA ARDIANA', 32, NULL, '', '', '', '', '', '', '', '', '', '', '2018-06-30 00:40:32', '2018-06-30 00:40:32'),
(155, 'YUNAN ABIMANYU', 32, NULL, '', '', '', '', '', '', '', '', '', '', '2018-06-30 00:40:32', '2018-06-30 00:40:32'),
(156, 'YOGI BERLIAWAN', 32, NULL, '', '', '', '', '', '', '', '', '', '', '2018-06-30 00:40:33', '2018-06-30 00:40:33'),
(157, 'ASYFI HANA RAHMA S', 32, NULL, '', '', '', '', '', '', '', '', '', '', '2018-06-30 00:40:33', '2018-06-30 00:40:33'),
(158, 'ADAM PRIMA HARUM', 32, NULL, '', '', '', '', '', '', '', '', '', '', '2018-06-30 00:40:33', '2018-06-30 00:40:33'),
(159, 'AGUS DARMANSYAH', 32, NULL, '', '', '', '', '', '', '', '', '', '', '2018-06-30 00:40:33', '2018-06-30 00:40:33'),
(160, 'AJI FAHMI PAKUBUMI', 32, NULL, '', '', '', '', '', '', '', '', '', '', '2018-06-30 00:40:33', '2018-06-30 00:40:33'),
(161, 'AKIF AL GHIFARI ROBBANI', 32, NULL, '', '', '', '', '', '', '', '', '', '', '2018-06-30 00:40:33', '2018-06-30 00:40:33'),
(162, 'ALDI AL UBAIDAH', 32, NULL, '', '', '', '', '', '', '', '', '', '', '2018-06-30 00:40:33', '2018-06-30 00:40:33'),
(163, 'ARYA IKHWANUN SHOLIH', 32, NULL, '', '', '', '', '', '', '', '', '', '', '2018-06-30 00:40:33', '2018-06-30 00:40:33'),
(164, 'AULIA HADI', 32, NULL, '', '', '', '', '', '', '', '', '', '', '2018-06-30 00:40:33', '2018-06-30 00:40:33'),
(165, 'BAYU ABDI SAPUTRA', 32, NULL, '', '', '', '', '', '', '', '', '', '', '2018-06-30 00:40:33', '2018-06-30 00:40:33'),
(166, 'BENING ANGRAENI', 32, NULL, '', '', '', '', '', '', '', '', '', '', '2018-06-30 00:40:33', '2018-06-30 00:40:33'),
(167, 'DAWUD AHMAD RIDWAN', 32, NULL, '', '', '', '', '', '', '', '', '', '', '2018-06-30 00:40:33', '2018-06-30 00:40:33'),
(168, 'FARIKHA PUTRI SALSABILA', 32, NULL, '', '', '', '', '', '', '', '', '', '', '2018-06-30 00:40:33', '2018-06-30 00:40:33'),
(169, 'FENDI NURDIANZAH', 32, NULL, '', '', '', '', '', '', '', '', '', '', '2018-06-30 00:40:33', '2018-06-30 00:40:33'),
(170, 'GADING CHEMPAKADEWI', 32, NULL, '', '', '', '', '', '', '', '', '', '', '2018-06-30 00:40:33', '2018-06-30 00:40:33'),
(171, 'GUNAWAN MUHAMAD R.', 32, NULL, '', '', '', '', '', '', '', '', '', '', '2018-06-30 00:40:33', '2018-06-30 00:40:33'),
(172, 'ICA AMALIA HAFITS', 32, NULL, '', '', '', '', '', '', '', '', '', '', '2018-06-30 00:40:33', '2018-06-30 00:40:33'),
(173, 'IRWAN GUNTUR ASADULLOH', 32, NULL, '', '', '', '', '', '', '', '', '', '', '2018-06-30 00:40:33', '2018-06-30 00:40:33'),
(174, 'KAMILA WULANDARI', 32, NULL, '', '', '', '', '', '', '', '', '', '', '2018-06-30 00:40:33', '2018-06-30 00:40:33'),
(175, 'M. ARIEF MAULANA', 32, NULL, '', '', '', '', '', '', '', '', '', '', '2018-06-30 00:40:33', '2018-06-30 00:40:33'),
(176, 'M. ARIP SHODIQIN', 32, NULL, '', '', '', '', '', '', '', '', '', '', '2018-06-30 00:40:33', '2018-06-30 00:40:33'),
(177, 'M. RAMADHANI', 32, NULL, '', '', '', '', '', '', '', '', '', '', '2018-06-30 00:40:33', '2018-06-30 00:40:33'),
(178, 'MOCH REFO HERLAMBANG', 32, NULL, '', '', '', '', '', '', '', '', '', '', '2018-06-30 00:40:33', '2018-06-30 00:40:33'),
(179, 'MUFIDATURRIZQY FADILA', 32, NULL, '', '', '', '', '', '', '', '', '', '', '2018-06-30 00:40:33', '2018-06-30 00:40:33'),
(180, 'NASHRULLOH AL GHIFARI', 32, NULL, '', '', '', '', '', '', '', '', '', '', '2018-06-30 00:40:33', '2018-06-30 00:40:33'),
(181, 'NATASYA DEVA SURYANI', 32, NULL, '', '', '', '', '', '', '', '', '', '', '2018-06-30 00:40:33', '2018-06-30 00:40:33'),
(182, 'NOVANSYA AULIA RAMADHINI', 32, NULL, '', '', '', '', '', '', '', '', '', '', '2018-06-30 00:40:33', '2018-06-30 00:40:33'),
(183, 'NUR SABILA MIFTAKHUL J.', 32, NULL, '', '', '', '', '', '', '', '', '', '', '2018-06-30 00:40:33', '2018-06-30 00:40:33'),
(184, 'RAHMAT HIDAYAT', 32, NULL, '', '', '', '', '', '', '', '', '', '', '2018-06-30 00:40:34', '2018-06-30 00:40:34'),
(185, 'RIDHO KHOIRREZA', 32, NULL, '', '', '', '', '', '', '', '', '', '', '2018-06-30 00:40:34', '2018-06-30 00:40:34'),
(186, 'ROYAN YUSUF REYMADAN', 32, NULL, '', '', '', '', '', '', '', '', '', '', '2018-06-30 00:40:34', '2018-06-30 00:40:34'),
(187, 'SULESTYANING HASTUTI', 32, NULL, '', '', '', '', '', '', '', '', '', '', '2018-06-30 00:40:34', '2018-06-30 00:40:34'),
(188, 'THALITA GINA ALMIRA YURDIKA', 32, NULL, '', '', '', '', '', '', '', '', '', '', '2018-06-30 00:40:34', '2018-06-30 00:40:34'),
(189, 'WINDY FEBRIANY SYUHADA', 32, NULL, '', '', '', '', '', '', '', '', '', '', '2018-06-30 00:40:34', '2018-06-30 00:40:34'),
(190, 'ZAKIYYA NUR KUSUMANINGRUM', 32, NULL, '', '', '', '', '', '', '', '', '', '', '2018-06-30 00:40:34', '2018-06-30 00:40:34'),
(191, 'ANNISA MAULIDINA ALNI', 32, NULL, '', '', '', '', '', '', '', '', '', '', '2018-06-30 00:40:34', '2018-06-30 00:40:34'),
(192, 'ADINA RAHMA', 32, NULL, '', '', '', '', '', '', '', '', '', '', '2018-06-30 00:40:34', '2018-06-30 00:40:34'),
(193, 'AULIA ZAINUN FAKIHA', 32, NULL, '', '', '', '', '', '', '', '', '', '', '2018-06-30 00:40:34', '2018-06-30 00:40:34'),
(194, 'BAGAS RANANDA P', 32, NULL, '', '', '', '', '', '', '', '', '', '', '2018-06-30 00:40:34', '2018-06-30 00:40:34'),
(195, 'DANUR WENDRA Z.', 32, NULL, '', '', '', '', '', '', '', '', '', '', '2018-06-30 00:40:34', '2018-06-30 00:40:34'),
(196, 'EMILYA PUTERI', 32, NULL, '', '', '', '', '', '', '', '', '', '', '2018-06-30 00:40:34', '2018-06-30 00:40:34'),
(197, 'FAIRUS FIRDAUSIA', 32, NULL, '', '', '', '', '', '', '', '', '', '', '2018-06-30 00:40:34', '2018-06-30 00:40:34'),
(198, 'FARADILA USWATUN HASANAH', 32, NULL, '', '', '', '', '', '', '', '', '', '', '2018-06-30 00:40:34', '2018-06-30 00:40:34'),
(199, 'FARIDA TRI M.', 32, NULL, '', '', '', '', '', '', '', '', '', '', '2018-06-30 00:40:34', '2018-06-30 00:40:34'),
(200, 'HASWENDA RASYID', 32, NULL, '', '', '', '', '', '', '', '', '', '', '2018-06-30 00:40:34', '2018-06-30 00:40:34'),
(201, 'INDRI SAFITRI', 32, NULL, '', '', '', '', '', '', '', '', '', '', '2018-06-30 00:40:34', '2018-06-30 00:40:34'),
(202, 'INTAN N MUKHASANATIN', 32, NULL, '', '', '', '', '', '', '', '', '', '', '2018-06-30 00:40:34', '2018-06-30 00:40:34'),
(203, 'KHURIN\'IN SHIFATUL JANNAH', 32, NULL, '', '', '', '', '', '', '', '', '', '', '2018-06-30 00:40:35', '2018-06-30 00:40:35'),
(204, 'M. AZHAR MUBARROQ', 32, NULL, '', '', '', '', '', '', '', '', '', '', '2018-06-30 00:40:35', '2018-06-30 00:40:35'),
(205, 'M. ROFI\' SAPUTRO', 32, NULL, '', '', '', '', '', '', '', '', '', '', '2018-06-30 00:40:35', '2018-06-30 00:40:35'),
(206, 'MIFTAHHUL ROSITA', 32, NULL, '', '', '', '', '', '', '', '', '', '', '2018-06-30 00:40:35', '2018-06-30 00:40:35'),
(207, 'MOCHAMMAD RIFI A.', 32, NULL, '', '', '', '', '', '', '', '', '', '', '2018-06-30 00:40:35', '2018-06-30 00:40:35'),
(208, 'NUR LISA', 32, NULL, '', '', '', '', '', '', '', '', '', '', '2018-06-30 00:40:35', '2018-06-30 00:40:35'),
(209, 'RIKA NUR PADILLA', 32, NULL, '', '', '', '', '', '', '', '', '', '', '2018-06-30 00:40:35', '2018-06-30 00:40:35'),
(210, 'RUSDI SABILA NOOR S.', 32, NULL, '', '', '', '', '', '', '', '', '', '', '2018-06-30 00:40:35', '2018-06-30 00:40:35'),
(211, 'SARAH AYUNINGTYAS', 32, NULL, '', '', '', '', '', '', '', '', '', '', '2018-06-30 00:40:35', '2018-06-30 00:40:35'),
(212, 'SELLA MUTHIAH', 32, NULL, '', '', '', '', '', '', '', '', '', '', '2018-06-30 00:40:35', '2018-06-30 00:40:35'),
(213, 'SHERLI RISMA PANGESTU', 32, NULL, '', '', '', '', '', '', '', '', '', '', '2018-06-30 00:40:35', '2018-06-30 00:40:35'),
(214, 'SILVIA NUR AZMI', 32, NULL, '', '', '', '', '', '', '', '', '', '', '2018-06-30 00:40:35', '2018-06-30 00:40:35'),
(215, 'SORAYA NABILA', 32, NULL, '', '', '', '', '', '', '', '', '', '', '2018-06-30 00:40:35', '2018-06-30 00:40:35'),
(216, 'URISTNA GADIS NIRWANA', 32, NULL, '', '', '', '', '', '', '', '', '', '', '2018-06-30 00:40:35', '2018-06-30 00:40:35'),
(217, 'YUSRIZAL  SAIFUL M.', 32, NULL, '', '', '', '', '', '', '', '', '', '', '2018-06-30 00:40:35', '2018-06-30 00:40:35'),
(218, 'AFRIDA HABIBAH ADINA', 33, NULL, '', '', '', '', '', '', '', '', '', '', '2018-06-30 00:40:35', '2018-06-30 00:40:35'),
(219, 'AINUN TIARANINGTIAS L.', 33, NULL, '', '', '', '', '', '', '', '', '', '', '2018-06-30 00:40:35', '2018-06-30 00:40:35'),
(220, 'APRILLIA AYUWANINGSIH', 33, NULL, '', '', '', '', '', '', '', '', '', '', '2018-06-30 00:40:35', '2018-06-30 00:40:35'),
(221, 'AULIYA RATUNGGA', 33, NULL, '', '', '', '', '', '', '', '', '', '', '2018-06-30 00:40:35', '2018-06-30 00:40:35'),
(222, 'AZKANITA WULIDA H. ', 33, NULL, '', '', '', '', '', '', '', '', '', '', '2018-06-30 00:40:36', '2018-06-30 00:40:36'),
(223, 'CAHYASRI SICHA S. D', 33, NULL, '', '', '', '', '', '', '', '', '', '', '2018-06-30 00:40:36', '2018-06-30 00:40:36'),
(224, 'CAHYASRI SOCHA S. D', 33, NULL, '', '', '', '', '', '', '', '', '', '', '2018-06-30 00:40:36', '2018-06-30 00:40:36'),
(225, 'DESWITA SALSABILA', 33, NULL, '', '', '', '', '', '', '', '', '', '', '2018-06-30 00:40:36', '2018-06-30 00:40:36'),
(226, 'DINI NUR ABIDA AULIA', 33, NULL, '', '', '', '', '', '', '', '', '', '', '2018-06-30 00:40:36', '2018-06-30 00:40:36'),
(227, 'ELIS SEKAR PRATIWI', 33, NULL, '', '', '', '', '', '', '', '', '', '', '2018-06-30 00:40:36', '2018-06-30 00:40:36'),
(228, 'FAHIM NUR AMALIA', 33, NULL, '', '', '', '', '', '', '', '', '', '', '2018-06-30 00:40:36', '2018-06-30 00:40:36'),
(229, 'HANI RAHMAWATI', 33, NULL, '', '', '', '', '', '', '', '', '', '', '2018-06-30 00:40:36', '2018-06-30 00:40:36'),
(230, 'HILYATUL HUSNA', 33, NULL, '', '', '', '', '', '', '', '', '', '', '2018-06-30 00:40:36', '2018-06-30 00:40:36'),
(231, 'IZZATULLAH H. ULYA', 33, NULL, '', '', '', '', '', '', '', '', '', '', '2018-06-30 00:40:36', '2018-06-30 00:40:36'),
(232, 'KARINA AUDI DESI S.', 33, NULL, '', '', '', '', '', '', '', '', '', '', '2018-06-30 00:40:36', '2018-06-30 00:40:36'),
(233, 'KEISHA HAYFA V.', 33, NULL, '', '', '', '', '', '', '', '', '', '', '2018-06-30 00:40:36', '2018-06-30 00:40:36'),
(234, 'NIDA AFIFAH', 33, NULL, '', '', '', '', '', '', '', '', '', '', '2018-06-30 00:40:36', '2018-06-30 00:40:36'),
(235, 'RINI FLORA AGRIPINA C.', 33, NULL, '', '', '', '', '', '', '', '', '', '', '2018-06-30 00:40:36', '2018-06-30 00:40:36'),
(236, 'RIZKI NUR FADILLAH', 33, NULL, '', '', '', '', '', '', '', '', '', '', '2018-06-30 00:40:36', '2018-06-30 00:40:36'),
(237, 'SAIZIAH AZZA A.', 33, NULL, '', '', '', '', '', '', '', '', '', '', '2018-06-30 00:40:36', '2018-06-30 00:40:36'),
(238, 'TIARA SAPUTRI', 33, NULL, '', '', '', '', '', '', '', '', '', '', '2018-06-30 00:40:36', '2018-06-30 00:40:36'),
(239, 'ABDUL MALIK ', 33, NULL, '', '', '', '', '', '', '', '', '', '', '2018-06-30 00:40:37', '2018-06-30 00:40:37'),
(240, 'ADE SIDDIQ AL\'AMIN', 33, NULL, '', '', '', '', '', '', '', '', '', '', '2018-06-30 00:40:37', '2018-06-30 00:40:37'),
(241, 'ADZAN ALMAHDI N.R', 33, NULL, '', '', '', '', '', '', '', '', '', '', '2018-06-30 00:40:37', '2018-06-30 00:40:37'),
(242, 'AHMAD SANDY NOOR ', 33, NULL, '', '', '', '', '', '', '', '', '', '', '2018-06-30 00:40:37', '2018-06-30 00:40:37'),
(243, 'AKBAR ALHADI N.R', 33, NULL, '', '', '', '', '', '', '', '', '', '', '2018-06-30 00:40:37', '2018-06-30 00:40:37'),
(244, 'ANGGA KAKA LIQO', 33, NULL, '', '', '', '', '', '', '', '', '', '', '2018-06-30 00:40:37', '2018-06-30 00:40:37'),
(245, 'DEVIN RADITYA F', 33, NULL, '', '', '', '', '', '', '', '', '', '', '2018-06-30 00:40:37', '2018-06-30 00:40:37'),
(246, 'DHIMAS ILMAL YAKIN', 33, NULL, '', '', '', '', '', '', '', '', '', '', '2018-06-30 00:40:37', '2018-06-30 00:40:37'),
(247, 'DIMAS WAHYU R.', 33, NULL, '', '', '', '', '', '', '', '', '', '', '2018-06-30 00:40:37', '2018-06-30 00:40:37'),
(248, 'EGI REKA PRASOJO', 33, NULL, '', '', '', '', '', '', '', '', '', '', '2018-06-30 00:40:37', '2018-06-30 00:40:37'),
(249, 'HANDIKA IKHWANA P.', 33, NULL, '', '', '', '', '', '', '', '', '', '', '2018-06-30 00:40:37', '2018-06-30 00:40:37'),
(250, 'IRKHAM FAZA ISNADA', 33, NULL, '', '', '', '', '', '', '', '', '', '', '2018-06-30 00:40:37', '2018-06-30 00:40:37'),
(251, 'JAKA ROYANA', 33, NULL, '', '', '', '', '', '', '', '', '', '', '2018-06-30 00:40:37', '2018-06-30 00:40:37'),
(252, 'MARZUKI MULYANA', 33, NULL, '', '', '', '', '', '', '', '', '', '', '2018-06-30 00:40:37', '2018-06-30 00:40:37'),
(253, 'MOCHAMMAD MUSTHOFA', 33, NULL, '', '', '', '', '', '', '', '', '', '', '2018-06-30 00:40:37', '2018-06-30 00:40:37'),
(254, 'MOCHAMMAD RYAN A.', 33, NULL, '', '', '', '', '', '', '', '', '', '', '2018-06-30 00:40:37', '2018-06-30 00:40:37'),
(255, 'M. DIVA AULIA HADI', 33, NULL, '', '', '', '', '', '', '', '', '', '', '2018-06-30 00:40:37', '2018-06-30 00:40:37'),
(256, 'M. IKHWAN HAFIZH H.', 33, NULL, '', '', '', '', '', '', '', '', '', '', '2018-06-30 00:40:37', '2018-06-30 00:40:37'),
(257, 'M. LUTFI NUR LATIF', 33, NULL, '', '', '', '', '', '', '', '', '', '', '2018-06-30 00:40:37', '2018-06-30 00:40:37'),
(258, 'M. NOOR FAKIH', 33, NULL, '', '', '', '', '', '', '', '', '', '', '2018-06-30 00:40:37', '2018-06-30 00:40:37'),
(259, 'MUHAMMAD RAKHA\'', 33, NULL, '', '', '', '', '', '', '', '', '', '', '2018-06-30 00:40:37', '2018-06-30 00:40:37'),
(260, 'M. REHAL SA\'AD FINABAN', 33, NULL, '', '', '', '', '', '', '', '', '', '', '2018-06-30 00:40:37', '2018-06-30 00:40:37'),
(261, 'MUHAMMAD RIDWAN', 33, NULL, '', '', '', '', '', '', '', '', '', '', '2018-06-30 00:40:37', '2018-06-30 00:40:37'),
(262, 'M. ROFIQ HARIRI ', 33, NULL, '', '', '', '', '', '', '', '', '', '', '2018-06-30 00:40:38', '2018-06-30 00:40:38'),
(263, 'RAHMAD CANDRA K.', 33, NULL, '', '', '', '', '', '', '', '', '', '', '2018-06-30 00:40:38', '2018-06-30 00:40:38'),
(264, 'RIYADI ATSIRUDDIN A.', 33, NULL, '', '', '', '', '', '', '', '', '', '', '2018-06-30 00:40:38', '2018-06-30 00:40:38'),
(265, 'SATRIA NURHUDA', 33, NULL, '', '', '', '', '', '', '', '', '', '', '2018-06-30 00:40:38', '2018-06-30 00:40:38'),
(266, 'M. THORIQUL J.', 33, NULL, '', '', '', '', '', '', '', '', '', '', '2018-06-30 00:40:38', '2018-06-30 00:40:38'),
(267, 'Zulfikar Machi Afanillah ', 27, NULL, '', '', '', '', '', '', '', '', '', '', '2018-06-30 00:40:38', '2018-06-30 00:40:38'),
(268, 'Anggun Naja Fadhila Wardani ', 27, NULL, '', '', '', '', '', '', '', '', '', '', '2018-06-30 00:40:38', '2018-06-30 00:40:38'),
(269, 'Putri Bilqis Ambar Zuroya Ridwan ', 27, NULL, '', '', '', '', '', '', '', '', '', '', '2018-06-30 00:40:38', '2018-06-30 00:40:38'),
(270, 'Putri Khusnul Cahya ', 27, NULL, '', '', '', '', '', '', '', '', '', '', '2018-06-30 00:40:38', '2018-06-30 00:40:38'),
(271, 'Fitri Ayu Wulandari ', 27, NULL, '', '', '', '', '', '', '', '', '', '', '2018-06-30 00:40:38', '2018-06-30 00:40:38'),
(272, 'Afni Ilman Nafiah ', 27, NULL, '', '', '', '', '', '', '', '', '', '', '2018-06-30 00:40:38', '2018-06-30 00:40:38'),
(273, 'Nouva Vazhyra Aulia Febriana ', 27, NULL, '', '', '', '', '', '', '', '', '', '', '2018-06-30 00:40:38', '2018-06-30 00:40:38'),
(274, 'Dinfisa Putri Nindi Sahara ', 27, NULL, '', '', '', '', '', '', '', '', '', '', '2018-06-30 00:40:38', '2018-06-30 00:40:38'),
(275, 'Ibrohim Alban Pamungkas ', 27, NULL, '', '', '', '', '', '', '', '', '', '', '2018-06-30 00:40:38', '2018-06-30 00:40:38'),
(276, 'Melati', 27, NULL, '', '', '', '', '', '', '', '', '', '', '2018-06-30 00:40:38', '2018-06-30 00:40:38'),
(277, 'Axel Setia Dirda ', 27, NULL, '', '', '', '', '', '', '', '', '', '', '2018-06-30 00:40:38', '2018-06-30 00:40:38'),
(278, 'Muhammad Nurzen Zidan ', 27, NULL, '', '', '', '', '', '', '', '', '', '', '2018-06-30 00:40:38', '2018-06-30 00:40:38'),
(279, 'Agus Fajar Fambudi ', 27, NULL, '', '', '', '', '', '', '', '', '', '', '2018-06-30 00:40:38', '2018-06-30 00:40:38'),
(280, 'Alfito Deanova ', 27, NULL, '', '', '', '', '', '', '', '', '', '', '2018-06-30 00:40:39', '2018-06-30 00:40:39'),
(281, 'Dimas Tegar Abdillah ', 27, NULL, '', '', '', '', '', '', '', '', '', '', '2018-06-30 00:40:39', '2018-06-30 00:40:39'),
(282, 'Sulthon Aulia Fathul Kubar ', 27, NULL, '', '', '', '', '', '', '', '', '', '', '2018-06-30 00:40:39', '2018-06-30 00:40:39'),
(283, 'Diva Aulia Tridayana ', 27, NULL, '', '', '', '', '', '', '', '', '', '', '2018-06-30 00:40:39', '2018-06-30 00:40:39'),
(284, 'Felisya Della Suryani ', 27, NULL, '', '', '', '', '', '', '', '', '', '', '2018-06-30 00:40:39', '2018-06-30 00:40:39'),
(285, 'Wahyu Agung Fauzi Mukhid ', 27, NULL, '', '', '', '', '', '', '', '', '', '', '2018-06-30 00:40:39', '2018-06-30 00:40:39'),
(286, 'Muhammad Fatkhu Royan Firomadani', 27, NULL, '', '', '', '', '', '', '', '', '', '', '2018-06-30 00:40:39', '2018-06-30 00:40:39'),
(287, 'Mochammad Abdul Aziz ', 27, NULL, '', '', '', '', '', '', '', '', '', '', '2018-06-30 00:40:39', '2018-06-30 00:40:39'),
(288, 'Cantika Dewi Ratna Putri ', 27, NULL, '', '', '', '', '', '', '', '', '', '', '2018-06-30 00:40:39', '2018-06-30 00:40:39'),
(289, 'Putri Nur Habiyani Suwarno', 27, NULL, '', '', '', '', '', '', '', '', '', '', '2018-06-30 00:40:39', '2018-06-30 00:40:39'),
(290, 'Baihaqi Ebinsabela ', 27, NULL, '', '', '', '', '', '', '', '', '', '', '2018-06-30 00:40:39', '2018-06-30 00:40:39'),
(291, 'Dimas Maulana', 27, NULL, '', '', '', '', '', '', '', '', '', '', '2018-06-30 00:40:39', '2018-06-30 00:40:39'),
(292, 'Abdul Rizal Pratama ', 27, NULL, '', '', '', '', '', '', '', '', '', '', '2018-06-30 00:40:39', '2018-06-30 00:40:39'),
(293, 'Shabrina Azzahra Ananda ', 27, NULL, '', '', '', '', '', '', '', '', '', '', '2018-06-30 00:40:39', '2018-06-30 00:40:39'),
(294, 'Rahma Maulida Arnanti ', 27, NULL, '', '', '', '', '', '', '', '', '', '', '2018-06-30 00:40:39', '2018-06-30 00:40:39'),
(295, 'Ahmad Fadly Maulana ', 27, NULL, '', '', '', '', '', '', '', '', '', '', '2018-06-30 00:40:39', '2018-06-30 00:40:39'),
(296, 'Depi Puspita Sari ', 27, NULL, '', '', '', '', '', '', '', '', '', '', '2018-06-30 00:40:40', '2018-06-30 00:40:40'),
(297, 'Sri Wahyuni', 27, NULL, '', '', '', '', '', '', '', '', '', '', '2018-06-30 00:40:40', '2018-06-30 00:40:40'),
(298, 'Mutiara Rezki Fajrany ', 27, NULL, '', '', '', '', '', '', '', '', '', '', '2018-06-30 00:40:40', '2018-06-30 00:40:40'),
(299, 'Muhammad Dani Lesa Putra ', 27, NULL, '', '', '', '', '', '', '', '', '', '', '2018-06-30 00:40:40', '2018-06-30 00:40:40'),
(300, 'Vetty Khasanah ', 27, NULL, '', '', '', '', '', '', '', '', '', '', '2018-06-30 00:40:40', '2018-06-30 00:40:40'),
(301, 'Rindi Nubaisyah ', 27, NULL, '', '', '', '', '', '', '', '', '', '', '2018-06-30 00:40:40', '2018-06-30 00:40:40'),
(302, 'Kholifah Qisti Rosada ', 27, NULL, '', '', '', '', '', '', '', '', '', '', '2018-06-30 00:40:40', '2018-06-30 00:40:40'),
(303, 'Alfiyakusna', 27, NULL, '', '', '', '', '', '', '', '', '', '', '2018-06-30 00:40:40', '2018-06-30 00:40:40'),
(304, 'Khusnul Tiwi Wijayanti ', 27, NULL, '', '', '', '', '', '', '', '', '', '', '2018-06-30 00:40:40', '2018-06-30 00:40:40'),
(305, 'Ibnu Fadhillah Abdurohman ', 27, NULL, '', '', '', '', '', '', '', '', '', '', '2018-06-30 00:40:40', '2018-06-30 00:40:40'),
(306, 'Ayu Mega Maulidya ', 27, NULL, '', '', '', '', '', '', '', '', '', '', '2018-06-30 00:40:41', '2018-06-30 00:40:41'),
(307, 'Khairunisa', 27, NULL, '', '', '', '', '', '', '', '', '', '', '2018-06-30 00:40:41', '2018-06-30 00:40:41'),
(308, 'Fina Amalia Jamil ', 27, NULL, '', '', '', '', '', '', '', '', '', '', '2018-06-30 00:40:41', '2018-06-30 00:40:41'),
(309, 'Andi Muhammad Zaki ', 27, NULL, '', '', '', '', '', '', '', '', '', '', '2018-06-30 00:40:41', '2018-06-30 00:40:41'),
(310, 'Muhammad Aden Bryantama Saputra', 27, NULL, '', '', '', '', '', '', '', '', '', '', '2018-06-30 00:40:41', '2018-06-30 00:40:41'),
(311, 'Fadilah Ramadani ', 27, NULL, '', '', '', '', '', '', '', '', '', '', '2018-06-30 00:40:41', '2018-06-30 00:40:41'),
(312, 'Dwi Fatmawati Ningtias ', 27, NULL, '', '', '', '', '', '', '', '', '', '', '2018-06-30 00:40:41', '2018-06-30 00:40:41'),
(313, 'Intan Fitriani ', 27, NULL, '', '', '', '', '', '', '', '', '', '', '2018-06-30 00:40:41', '2018-06-30 00:40:41'),
(314, 'Sukma Nurhayati ', 27, NULL, '', '', '', '', '', '', '', '', '', '', '2018-06-30 00:40:41', '2018-06-30 00:40:41'),
(315, 'Muhammad Faqih Nurfauzan ', 27, NULL, '', '', '', '', '', '', '', '', '', '', '2018-06-30 00:40:41', '2018-06-30 00:40:41'),
(316, 'Fahrur Rosi ', 27, NULL, '', '', '', '', '', '', '', '', '', '', '2018-06-30 00:40:41', '2018-06-30 00:40:41'),
(317, 'Affan Maulana ', 27, NULL, '', '', '', '', '', '', '', '', '', '', '2018-06-30 00:40:41', '2018-06-30 00:40:41'),
(318, 'Muhammad Alif Ary Hakim ', 27, NULL, '', '', '', '', '', '', '', '', '', '', '2018-06-30 00:40:41', '2018-06-30 00:40:41'),
(319, 'Ibnu Azis As Sahab ', 27, NULL, '', '', '', '', '', '', '', '', '', '', '2018-06-30 00:40:41', '2018-06-30 00:40:41'),
(320, 'Andi Aqil Ajrun Adhim ', 27, NULL, '', '', '', '', '', '', '', '', '', '', '2018-06-30 00:40:41', '2018-06-30 00:40:41'),
(321, 'Kayyisa Fadhlillah Ardhy Sejati ', 27, NULL, '', '', '', '', '', '', '', '', '', '', '2018-06-30 00:40:41', '2018-06-30 00:40:41'),
(322, 'Farah Anifah Urdhiah ', 27, NULL, '', '', '', '', '', '', '', '', '', '', '2018-06-30 00:40:41', '2018-06-30 00:40:41'),
(323, 'Hamam Pancer Jagad ', 27, NULL, '', '', '', '', '', '', '', '', '', '', '2018-06-30 00:40:41', '2018-06-30 00:40:41'),
(324, 'Lisa Handayani ', 27, NULL, '', '', '', '', '', '', '', '', '', '', '2018-06-30 00:40:41', '2018-06-30 00:40:41'),
(325, 'Hugo Adriano Isnaeni ', 27, NULL, '', '', '', '', '', '', '', '', '', '', '2018-06-30 00:40:41', '2018-06-30 00:40:41'),
(326, 'Dzulkarnain Akbar Benda ', 27, NULL, '', '', '', '', '', '', '', '', '', '', '2018-06-30 00:40:41', '2018-06-30 00:40:41'),
(327, 'Aulia Catur Wulandari ', 27, NULL, '', '', '', '', '', '', '', '', '', '', '2018-06-30 00:40:42', '2018-06-30 00:40:42'),
(328, 'Vonny Widyaningsih ', 27, NULL, '', '', '', '', '', '', '', '', '', '', '2018-06-30 00:40:42', '2018-06-30 00:40:42'),
(329, 'Aan Hendin Wahyudaulloh ', 27, NULL, '', '', '', '', '', '', '', '', '', '', '2018-06-30 00:40:42', '2018-06-30 00:40:42'),
(330, 'Amalia Rahmi Oktavia ', 27, NULL, '', '', '', '', '', '', '', '', '', '', '2018-06-30 00:40:42', '2018-06-30 00:40:42'),
(331, 'Bagus Eka Firdaus ', 27, NULL, '', '', '', '', '', '', '', '', '', '', '2018-06-30 00:40:42', '2018-06-30 00:40:42'),
(332, 'Raisa Safwa Ammara ', 27, NULL, '', '', '', '', '', '', '', '', '', '', '2018-06-30 00:40:42', '2018-06-30 00:40:42'),
(333, 'Choirul Fitriani ', 27, NULL, '', '', '', '', '', '', '', '', '', '', '2018-06-30 00:40:42', '2018-06-30 00:40:42'),
(334, 'Dian Achmad Ninata ', 27, NULL, '', '', '', '', '', '', '', '', '', '', '2018-06-30 00:40:42', '2018-06-30 00:40:42'),
(335, 'Bani Adam Al-Fauzi ', 27, NULL, '', '', '', '', '', '', '', '', '', '', '2018-06-30 00:40:42', '2018-06-30 00:40:42');
INSERT INTO `anggota` (`id_anggota`, `nama_anggota`, `id_kelompok`, `tgl_lahir`, `tempat_lahir`, `desa`, `jenis_kelamin`, `no_telepon`, `email`, `alamat`, `ket_peserta`, `ukuran_baju`, `dapukan`, `status_peserta`, `created_at`, `updated_at`) VALUES
(336, 'Najelia Ayu Nurosida ', 27, NULL, '', '', '', '', '', '', '', '', '', '', '2018-06-30 00:40:42', '2018-06-30 00:40:42'),
(337, 'Huda Firdaus ', 27, NULL, '', '', '', '', '', '', '', '', '', '', '2018-06-30 00:40:42', '2018-06-30 00:40:42'),
(338, 'Triana Maya Wulandari', 27, NULL, '', '', '', '', '', '', '', '', '', '', '2018-06-30 00:40:42', '2018-06-30 00:40:42'),
(339, 'Zidan Faqih Zanuar Reza', 27, NULL, '', '', '', '', '', '', '', '', '', '', '2018-06-30 00:40:42', '2018-06-30 00:40:42'),
(340, 'Faqih Alidonia ', 27, NULL, '', '', '', '', '', '', '', '', '', '', '2018-06-30 00:40:42', '2018-06-30 00:40:42'),
(341, 'Sabrina Aurora M', 27, NULL, '', '', '', '', '', '', '', '', '', '', '2018-06-30 00:40:42', '2018-06-30 00:40:42'),
(342, 'Annisa Rifdah Maharani ', 27, NULL, '', '', '', '', '', '', '', '', '', '', '2018-06-30 00:40:42', '2018-06-30 00:40:42'),
(343, 'Alfina ', 27, NULL, '', '', '', '', '', '', '', '', '', '', '2018-06-30 00:40:43', '2018-06-30 00:40:43'),
(344, 'Abdul Ghoni Syakur ', 27, NULL, '', '', '', '', '', '', '', '', '', '', '2018-06-30 00:40:43', '2018-06-30 00:40:43'),
(345, 'Muhammad Firdaus Ubaydullah', 27, NULL, '', '', '', '', '', '', '', '', '', '', '2018-06-30 00:40:43', '2018-06-30 00:40:43'),
(346, 'Amanda Lathifa Khonif ', 27, NULL, '', '', '', '', '', '', '', '', '', '', '2018-06-30 00:40:43', '2018-06-30 00:40:43'),
(347, 'Puspita Ayu Fitrianita ', 27, NULL, '', '', '', '', '', '', '', '', '', '', '2018-06-30 00:40:43', '2018-06-30 00:40:43'),
(348, 'Nurhidayah Putri Nabila ', 27, NULL, '', '', '', '', '', '', '', '', '', '', '2018-06-30 00:40:43', '2018-06-30 00:40:43'),
(349, 'Lia Ana Kholifah ', 27, NULL, '', '', '', '', '', '', '', '', '', '', '2018-06-30 00:40:43', '2018-06-30 00:40:43'),
(350, 'Imroani Khafidah ', 27, NULL, '', '', '', '', '', '', '', '', '', '', '2018-06-30 00:40:43', '2018-06-30 00:40:43'),
(351, 'Muhammad Daffa Abi Presdiawan ', 27, NULL, '', '', '', '', '', '', '', '', '', '', '2018-06-30 00:40:43', '2018-06-30 00:40:43'),
(352, 'Mohammad Ismail ', 27, NULL, '', '', '', '', '', '', '', '', '', '', '2018-06-30 00:40:43', '2018-06-30 00:40:43'),
(353, 'Fenita Meisya Nandini ', 27, NULL, '', '', '', '', '', '', '', '', '', '', '2018-06-30 00:40:43', '2018-06-30 00:40:43'),
(354, 'Salsabila Royani Putri Ramadhani ', 27, NULL, '', '', '', '', '', '', '', '', '', '', '2018-06-30 00:40:43', '2018-06-30 00:40:43'),
(355, 'Tiara Kayla R', 27, NULL, '', '', '', '', '', '', '', '', '', '', '2018-06-30 00:40:43', '2018-06-30 00:40:43'),
(356, 'Habib Ali Ramadani', 27, NULL, '', '', '', '', '', '', '', '', '', '', '2018-06-30 00:40:43', '2018-06-30 00:40:43'),
(357, 'Juliana Karita Effendi ', 27, NULL, '', '', '', '', '', '', '', '', '', '', '2018-06-30 00:40:44', '2018-06-30 00:40:44'),
(358, 'Asiah ', 27, NULL, '', '', '', '', '', '', '', '', '', '', '2018-06-30 00:40:44', '2018-06-30 00:40:44'),
(359, 'Anis Adelia Putri Salsabila ', 27, NULL, '', '', '', '', '', '', '', '', '', '', '2018-06-30 00:40:44', '2018-06-30 00:40:44'),
(360, 'Bagas Putro Sejati ', 27, NULL, '', '', '', '', '', '', '', '', '', '', '2018-06-30 00:40:45', '2018-06-30 00:40:45'),
(361, 'Adinda Deskia Nabila ', 27, NULL, '', '', '', '', '', '', '', '', '', '', '2018-06-30 00:40:45', '2018-06-30 00:40:45'),
(362, 'Afrigo Alena Rusdy', 27, NULL, '', '', '', '', '', '', '', '', '', '', '2018-06-30 00:40:45', '2018-06-30 00:40:45'),
(363, 'Igo ', 27, NULL, '', '', '', '', '', '', '', '', '', '', '2018-06-30 00:40:45', '2018-06-30 00:40:45'),
(364, 'Melin', 27, NULL, '', '', '', '', '', '', '', '', '', '', '2018-06-30 00:40:45', '2018-06-30 00:40:45'),
(365, 'Diah Anggi Rizkyana ', 27, NULL, '', '', '', '', '', '', '', '', '', '', '2018-06-30 00:40:45', '2018-06-30 00:40:45'),
(366, 'Linda Miftakhul Rizka ', 27, NULL, '', '', '', '', '', '', '', '', '', '', '2018-06-30 00:40:45', '2018-06-30 00:40:45'),
(367, 'Dwi Amalinda Listi', 27, NULL, '', '', '', '', '', '', '', '', '', '', '2018-06-30 00:40:46', '2018-06-30 00:40:46'),
(368, 'Fadel Fiqhi Al Hadis ', 27, NULL, '', '', '', '', '', '', '', '', '', '', '2018-06-30 00:40:46', '2018-06-30 00:40:46'),
(369, 'Rahman Rahul Maulana ', 27, NULL, '', '', '', '', '', '', '', '', '', '', '2018-06-30 00:40:46', '2018-06-30 00:40:46'),
(370, 'Yogi Fernanda ', 27, NULL, '', '', '', '', '', '', '', '', '', '', '2018-06-30 00:40:46', '2018-06-30 00:40:46'),
(371, 'Rahel Maralatha ', 27, NULL, '', '', '', '', '', '', '', '', '', '', '2018-06-30 00:40:46', '2018-06-30 00:40:46'),
(372, 'Mukhsonatin Nisa ', 27, NULL, '', '', '', '', '', '', '', '', '', '', '2018-06-30 00:40:47', '2018-06-30 00:40:47'),
(373, 'Ilham Dedi', 27, NULL, '', '', '', '', '', '', '', '', '', '', '2018-06-30 00:40:47', '2018-06-30 00:40:47'),
(374, 'ADITYA FATAHU ROHMAN', 28, NULL, '', '', '', '', '', '', '', '', '', '', '2018-06-30 00:40:47', '2018-06-30 00:40:47'),
(375, 'AGENG SILMI PINASTI', 28, NULL, '', '', '', '', '', '', '', '', '', '', '2018-06-30 00:40:47', '2018-06-30 00:40:47'),
(376, 'AHYA SUNAN AL ALIF', 28, NULL, '', '', '', '', '', '', '', '', '', '', '2018-06-30 00:40:47', '2018-06-30 00:40:47'),
(377, 'AKHSAN NUR FALAKHI ', 28, NULL, '', '', '', '', '', '', '', '', '', '', '2018-06-30 00:40:47', '2018-06-30 00:40:47'),
(378, 'AKSAN BANY MUQODDAS', 28, NULL, '', '', '', '', '', '', '', '', '', '', '2018-06-30 00:40:47', '2018-06-30 00:40:47'),
(379, 'ALAN ARDIANSYAH', 28, NULL, '', '', '', '', '', '', '', '', '', '', '2018-06-30 00:40:47', '2018-06-30 00:40:47'),
(380, 'ALIF GIBRAN SHIDDIQ', 28, NULL, '', '', '', '', '', '', '', '', '', '', '2018-06-30 00:40:47', '2018-06-30 00:40:47'),
(381, 'AMAR MUSTHOFAINAL ACHAR', 28, NULL, '', '', '', '', '', '', '', '', '', '', '2018-06-30 00:40:48', '2018-06-30 00:40:48'),
(382, 'ANI NURTIKASARI', 28, NULL, '', '', '', '', '', '', '', '', '', '', '2018-06-30 00:40:48', '2018-06-30 00:40:48'),
(383, 'ANIS SUSIATI', 28, NULL, '', '', '', '', '', '', '', '', '', '', '2018-06-30 00:40:48', '2018-06-30 00:40:48'),
(384, 'APRILLIA ANTIKA DEWI', 28, NULL, '', '', '', '', '', '', '', '', '', '', '2018-06-30 00:40:48', '2018-06-30 00:40:48'),
(385, 'ARYA MUHAMAD RIZKI ', 28, NULL, '', '', '', '', '', '', '', '', '', '', '2018-06-30 00:40:48', '2018-06-30 00:40:48'),
(386, 'ASHABI KHOIRUR RIZAL ', 28, NULL, '', '', '', '', '', '', '', '', '', '', '2018-06-30 00:40:49', '2018-06-30 00:40:49'),
(387, 'AYU DWI LESTARI', 28, NULL, '', '', '', '', '', '', '', '', '', '', '2018-06-30 00:40:49', '2018-06-30 00:40:49'),
(388, 'BERLIANA', 28, NULL, '', '', '', '', '', '', '', '', '', '', '2018-06-30 00:40:49', '2018-06-30 00:40:49'),
(389, 'CHAIRUNNISA SJAHRANIE', 28, NULL, '', '', '', '', '', '', '', '', '', '', '2018-06-30 00:40:49', '2018-06-30 00:40:49'),
(390, 'DARA RAHMA CALISTA ', 28, NULL, '', '', '', '', '', '', '', '', '', '', '2018-06-30 00:40:50', '2018-06-30 00:40:50'),
(391, 'DEFITA SARI WULANDARI', 28, NULL, '', '', '', '', '', '', '', '', '', '', '2018-06-30 00:40:50', '2018-06-30 00:40:50'),
(392, 'DIANI ROYHANA HAJAR', 28, NULL, '', '', '', '', '', '', '', '', '', '', '2018-06-30 00:40:50', '2018-06-30 00:40:50'),
(393, 'DIMAS FATRA MAULANA', 28, NULL, '', '', '', '', '', '', '', '', '', '', '2018-06-30 00:40:50', '2018-06-30 00:40:50'),
(394, 'DIVYA DEALOVA PUTRI', 28, NULL, '', '', '', '', '', '', '', '', '', '', '2018-06-30 00:40:50', '2018-06-30 00:40:50'),
(395, 'ENDRI APRILIA', 28, NULL, '', '', '', '', '', '', '', '', '', '', '2018-06-30 00:40:50', '2018-06-30 00:40:50'),
(396, 'FARHAN ZUDITIA RAHMAN', 28, NULL, '', '', '', '', '', '', '', '', '', '', '2018-06-30 00:40:51', '2018-06-30 00:40:51'),
(397, 'FATAN NAUFAL RASIKH', 28, NULL, '', '', '', '', '', '', '', '', '', '', '2018-06-30 00:40:51', '2018-06-30 00:40:51'),
(398, 'FATHUL ARIS NURMANTO', 28, NULL, '', '', '', '', '', '', '', '', '', '', '2018-06-30 00:40:51', '2018-06-30 00:40:51'),
(399, 'HASBI ALLAHU NUR R. ', 28, NULL, '', '', '', '', '', '', '', '', '', '', '2018-06-30 00:40:51', '2018-06-30 00:40:51'),
(400, 'HILYA', 28, NULL, '', '', '', '', '', '', '', '', '', '', '2018-06-30 00:40:51', '2018-06-30 00:40:51'),
(401, 'HUTOMO ABDULLAH ', 28, NULL, '', '', '', '', '', '', '', '', '', '', '2018-06-30 00:40:52', '2018-06-30 00:40:52'),
(402, 'ICHWAN B I L', 28, NULL, '', '', '', '', '', '', '', '', '', '', '2018-06-30 00:40:52', '2018-06-30 00:40:52'),
(403, 'INDAH MELATI', 28, NULL, '', '', '', '', '', '', '', '', '', '', '2018-06-30 00:40:52', '2018-06-30 00:40:52'),
(404, 'INDAH SEPTIANI', 28, NULL, '', '', '', '', '', '', '', '', '', '', '2018-06-30 00:40:52', '2018-06-30 00:40:52'),
(405, 'IZZAZAVA AZ ZAHIRA ', 28, NULL, '', '', '', '', '', '', '', '', '', '', '2018-06-30 00:40:52', '2018-06-30 00:40:52'),
(406, 'JEVANA RUSVA AZZAHRA', 28, NULL, '', '', '', '', '', '', '', '', '', '', '2018-06-30 00:40:52', '2018-06-30 00:40:52'),
(407, 'JORQUIN JULIANO C. R ', 28, NULL, '', '', '', '', '', '', '', '', '', '', '2018-06-30 00:40:53', '2018-06-30 00:40:53'),
(408, 'LAILA DELA MARETA', 28, NULL, '', '', '', '', '', '', '', '', '', '', '2018-06-30 00:40:53', '2018-06-30 00:40:53'),
(409, 'LU\'LU\'IM MASFUFAH', 28, NULL, '', '', '', '', '', '', '', '', '', '', '2018-06-30 00:40:53', '2018-06-30 00:40:53'),
(410, 'LUTHFI DZULFIQAR ', 28, NULL, '', '', '', '', '', '', '', '', '', '', '2018-06-30 00:40:53', '2018-06-30 00:40:53'),
(411, 'MUHAMMAD ANNAS', 28, NULL, '', '', '', '', '', '', '', '', '', '', '2018-06-30 00:40:53', '2018-06-30 00:40:53'),
(412, 'MUHAMMAD AZALEA V. ', 28, NULL, '', '', '', '', '', '', '', '', '', '', '2018-06-30 00:40:53', '2018-06-30 00:40:53'),
(413, 'MUHAMMAD HALIM', 28, NULL, '', '', '', '', '', '', '', '', '', '', '2018-06-30 00:40:53', '2018-06-30 00:40:53'),
(414, 'MUHAMMAD NAZIDAN H.', 28, NULL, '', '', '', '', '', '', '', '', '', '', '2018-06-30 00:40:53', '2018-06-30 00:40:53'),
(415, 'MUHAMMAD PAHALA JAYA ', 28, NULL, '', '', '', '', '', '', '', '', '', '', '2018-06-30 00:40:54', '2018-06-30 00:40:54'),
(416, 'MUHAMMAD ROYAN TOUHURI ', 28, NULL, '', '', '', '', '', '', '', '', '', '', '2018-06-30 00:40:54', '2018-06-30 00:40:54'),
(417, 'MUHAMMAD SYAHRI R. ', 28, NULL, '', '', '', '', '', '', '', '', '', '', '2018-06-30 00:40:54', '2018-06-30 00:40:54'),
(418, 'MUHAMMAD WAHYU HIDAYATULLAH', 28, NULL, '', '', '', '', '', '', '', '', '', '', '2018-06-30 00:40:54', '2018-06-30 00:40:54'),
(419, 'MUHAMMAD ZACKY', 28, NULL, '', '', '', '', '', '', '', '', '', '', '2018-06-30 00:40:54', '2018-06-30 00:40:54'),
(420, 'MUHAMMAD ZAKKI S.L', 28, NULL, '', '', '', '', '', '', '', '', '', '', '2018-06-30 00:40:54', '2018-06-30 00:40:54'),
(421, 'NADIRA QISHA', 28, NULL, '', '', '', '', '', '', '', '', '', '', '2018-06-30 00:40:55', '2018-06-30 00:40:55'),
(422, 'NARAYA WIRA DHARMA', 28, NULL, '', '', '', '', '', '', '', '', '', '', '2018-06-30 00:40:55', '2018-06-30 00:40:55'),
(423, 'NASYA AURELLIA PUTRI M ', 28, NULL, '', '', '', '', '', '', '', '', '', '', '2018-06-30 00:40:55', '2018-06-30 00:40:55'),
(424, 'OVAN NATHAN ', 28, NULL, '', '', '', '', '', '', '', '', '', '', '2018-06-30 00:40:55', '2018-06-30 00:40:55'),
(425, 'RANGGA GALIH SAPUTRA ', 28, NULL, '', '', '', '', '', '', '', '', '', '', '2018-06-30 00:40:55', '2018-06-30 00:40:55'),
(426, 'RANGGA WAHYU SAPUTRA ', 28, NULL, '', '', '', '', '', '', '', '', '', '', '2018-06-30 00:40:55', '2018-06-30 00:40:55'),
(427, 'REVI AMANDANIA ', 28, NULL, '', '', '', '', '', '', '', '', '', '', '2018-06-30 00:40:56', '2018-06-30 00:40:56'),
(428, 'REYZA AKBAR AL-HAFIDH', 28, NULL, '', '', '', '', '', '', '', '', '', '', '2018-06-30 00:40:56', '2018-06-30 00:40:56'),
(429, 'RICKA AULIA AZZAKIAH', 28, NULL, '', '', '', '', '', '', '', '', '', '', '2018-06-30 00:40:56', '2018-06-30 00:40:56'),
(430, 'RINA ASTUTI', 28, NULL, '', '', '', '', '', '', '', '', '', '', '2018-06-30 00:40:56', '2018-06-30 00:40:56'),
(431, 'RIZKI DION NASRULLOH ', 28, NULL, '', '', '', '', '', '', '', '', '', '', '2018-06-30 00:40:56', '2018-06-30 00:40:56'),
(432, 'RIZQY ONE SAPUTRE', 28, NULL, '', '', '', '', '', '', '', '', '', '', '2018-06-30 00:40:56', '2018-06-30 00:40:56'),
(433, 'SATRIAWAN DWI SANTOSO', 28, NULL, '', '', '', '', '', '', '', '', '', '', '2018-06-30 00:40:56', '2018-06-30 00:40:56'),
(434, 'SYAIFUL ANWAR IBRAHIM ', 28, NULL, '', '', '', '', '', '', '', '', '', '', '2018-06-30 00:40:56', '2018-06-30 00:40:56'),
(435, 'SYIFA ZAHRA AULIA', 28, NULL, '', '', '', '', '', '', '', '', '', '', '2018-06-30 00:40:56', '2018-06-30 00:40:56'),
(436, 'TAUFIK NUR HIDAYAT', 28, NULL, '', '', '', '', '', '', '', '', '', '', '2018-06-30 00:40:56', '2018-06-30 00:40:56'),
(437, 'TIARA DWI CAHYANI', 28, NULL, '', '', '', '', '', '', '', '', '', '', '2018-06-30 00:40:57', '2018-06-30 00:40:57'),
(438, 'TIBERT RADJASHAA BE', 28, NULL, '', '', '', '', '', '', '', '', '', '', '2018-06-30 00:40:57', '2018-06-30 00:40:57'),
(439, 'TIRTA AHMAD FIONALDO ', 28, NULL, '', '', '', '', '', '', '', '', '', '', '2018-06-30 00:40:57', '2018-06-30 00:40:57'),
(440, 'TOSY BIMA ASADULLOH M ', 28, NULL, '', '', '', '', '', '', '', '', '', '', '2018-06-30 00:40:57', '2018-06-30 00:40:57'),
(441, 'VANESSA AURELIA R', 28, NULL, '', '', '', '', '', '', '', '', '', '', '2018-06-30 00:40:57', '2018-06-30 00:40:57'),
(442, 'VERLITA IRAWATI ', 28, NULL, '', '', '', '', '', '', '', '', '', '', '2018-06-30 00:40:58', '2018-06-30 00:40:58'),
(443, 'WILLY YULIANSYAH M.', 28, NULL, '', '', '', '', '', '', '', '', '', '', '2018-06-30 00:40:58', '2018-06-30 00:40:58'),
(444, 'YENITA RASYID', 28, NULL, '', '', '', '', '', '', '', '', '', '', '2018-06-30 00:40:58', '2018-06-30 00:40:58'),
(445, 'YOGI UMAR', 28, NULL, '', '', '', '', '', '', '', '', '', '', '2018-06-30 00:40:58', '2018-06-30 00:40:58'),
(446, 'YOURDAN FARIS ALKAYISA ', 28, NULL, '', '', '', '', '', '', '', '', '', '', '2018-06-30 00:40:58', '2018-06-30 00:40:58'),
(447, 'ADAM', 26, NULL, '', '', '', '', '', '', '', '', '', '', '2018-06-30 00:40:58', '2018-06-30 00:40:58'),
(448, 'ARIS', 26, NULL, '', '', '', '', '', '', '', '', '', '', '2018-06-30 00:40:58', '2018-06-30 00:40:58'),
(449, 'ABDULLOH', 26, NULL, '', '', '', '', '', '', '', '', '', '', '2018-06-30 00:40:58', '2018-06-30 00:40:58'),
(450, 'HAFID', 26, NULL, '', '', '', '', '', '', '', '', '', '', '2018-06-30 00:40:58', '2018-06-30 00:40:58'),
(451, 'RIDWAN', 26, NULL, '', '', '', '', '', '', '', '', '', '', '2018-06-30 00:40:58', '2018-06-30 00:40:58'),
(452, 'QORI', 26, NULL, '', '', '', '', '', '', '', '', '', '', '2018-06-30 00:40:59', '2018-06-30 00:40:59'),
(453, 'RIZKI Q', 26, NULL, '', '', '', '', '', '', '', '', '', '', '2018-06-30 00:40:59', '2018-06-30 00:40:59'),
(454, 'RIZKI S', 26, NULL, '', '', '', '', '', '', '', '', '', '', '2018-06-30 00:40:59', '2018-06-30 00:40:59'),
(455, 'EFAN', 26, NULL, '', '', '', '', '', '', '', '', '', '', '2018-06-30 00:40:59', '2018-06-30 00:40:59'),
(456, 'AULIA', 26, NULL, '', '', '', '', '', '', '', '', '', '', '2018-06-30 00:40:59', '2018-06-30 00:40:59'),
(457, 'DIMAS', 26, NULL, '', '', '', '', '', '', '', '', '', '', '2018-06-30 00:41:00', '2018-06-30 00:41:00'),
(458, 'FAUZAN', 26, NULL, '', '', '', '', '', '', '', '', '', '', '2018-06-30 00:41:00', '2018-06-30 00:41:00'),
(459, 'HUDA FIRDAUS', 26, NULL, '', '', '', '', '', '', '', '', '', '', '2018-06-30 00:41:00', '2018-06-30 00:41:00'),
(460, 'KHOIRUL HUDA', 26, NULL, '', '', '', '', '', '', '', '', '', '', '2018-06-30 00:41:00', '2018-06-30 00:41:00'),
(461, 'IRFAN ', 26, NULL, '', '', '', '', '', '', '', '', '', '', '2018-06-30 00:41:00', '2018-06-30 00:41:00'),
(462, 'DELLA', 26, NULL, '', '', '', '', '', '', '', '', '', '', '2018-06-30 00:41:01', '2018-06-30 00:41:01'),
(463, 'LIA', 26, NULL, '', '', '', '', '', '', '', '', '', '', '2018-06-30 00:41:01', '2018-06-30 00:41:01'),
(464, 'DINDA', 26, NULL, '', '', '', '', '', '', '', '', '', '', '2018-06-30 00:41:01', '2018-06-30 00:41:01'),
(465, 'NISA', 26, NULL, '', '', '', '', '', '', '', '', '', '', '2018-06-30 00:41:01', '2018-06-30 00:41:01'),
(466, 'ANJANI', 26, NULL, '', '', '', '', '', '', '', '', '', '', '2018-06-30 00:41:01', '2018-06-30 00:41:01'),
(467, 'FITRIA', 26, NULL, '', '', '', '', '', '', '', '', '', '', '2018-06-30 00:41:01', '2018-06-30 00:41:01'),
(468, 'INTAN ', 26, NULL, '', '', '', '', '', '', '', '', '', '', '2018-06-30 00:41:02', '2018-06-30 00:41:02'),
(469, 'ANNA', 26, NULL, '', '', '', '', '', '', '', '', '', '', '2018-06-30 00:41:02', '2018-06-30 00:41:02'),
(470, 'ANNIE', 26, NULL, '', '', '', '', '', '', '', '', '', '', '2018-06-30 00:41:02', '2018-06-30 00:41:02'),
(471, 'ATIM', 26, NULL, '', '', '', '', '', '', '', '', '', '', '2018-06-30 00:41:02', '2018-06-30 00:41:02'),
(472, 'CHINTIA', 26, NULL, '', '', '', '', '', '', '', '', '', '', '2018-06-30 00:41:02', '2018-06-30 00:41:02'),
(473, 'DILLA', 26, NULL, '', '', '', '', '', '', '', '', '', '', '2018-06-30 00:41:02', '2018-06-30 00:41:02'),
(474, 'DITHA', 26, NULL, '', '', '', '', '', '', '', '', '', '', '2018-06-30 00:41:02', '2018-06-30 00:41:02'),
(475, 'IRMA', 26, NULL, '', '', '', '', '', '', '', '', '', '', '2018-06-30 00:41:02', '2018-06-30 00:41:02'),
(476, 'HIDA', 26, NULL, '', '', '', '', '', '', '', '', '', '', '2018-06-30 00:41:02', '2018-06-30 00:41:02'),
(477, 'IDA', 26, NULL, '', '', '', '', '', '', '', '', '', '', '2018-06-30 00:41:02', '2018-06-30 00:41:02'),
(478, 'NIA', 26, NULL, '', '', '', '', '', '', '', '', '', '', '2018-06-30 00:41:02', '2018-06-30 00:41:02'),
(479, 'PUPUT', 26, NULL, '', '', '', '', '', '', '', '', '', '', '2018-06-30 00:41:02', '2018-06-30 00:41:02'),
(480, 'PUSPA', 26, NULL, '', '', '', '', '', '', '', '', '', '', '2018-06-30 00:41:03', '2018-06-30 00:41:03'),
(481, 'SISKA', 26, NULL, '', '', '', '', '', '', '', '', '', '', '2018-06-30 00:41:03', '2018-06-30 00:41:03'),
(482, 'TITIN', 26, NULL, '', '', '', '', '', '', '', '', '', '', '2018-06-30 00:41:03', '2018-06-30 00:41:03'),
(483, 'WITA', 26, NULL, '', '', '', '', '', '', '', '', '', '', '2018-06-30 00:41:03', '2018-06-30 00:41:03'),
(484, 'ANI', 26, NULL, '', '', '', '', '', '', '', '', '', '', '2018-06-30 00:41:03', '2018-06-30 00:41:03'),
(485, 'ABI', 26, NULL, '', '', '', '', '', '', '', '', '', '', '2018-06-30 00:41:03', '2018-06-30 00:41:03'),
(486, 'FURQON', 26, NULL, '', '', '', '', '', '', '', '', '', '', '2018-06-30 00:41:03', '2018-06-30 00:41:03'),
(487, 'ISMAIL', 26, NULL, '', '', '', '', '', '', '', '', '', '', '2018-06-30 00:41:03', '2018-06-30 00:41:03'),
(488, 'IZZA', 26, NULL, '', '', '', '', '', '', '', '', '', '', '2018-06-30 00:41:04', '2018-06-30 00:41:04'),
(489, 'WANDA', 26, NULL, '', '', '', '', '', '', '', '', '', '', '2018-06-30 00:41:04', '2018-06-30 00:41:04'),
(490, 'HADI', 26, NULL, '', '', '', '', '', '', '', '', '', '', '2018-06-30 00:41:04', '2018-06-30 00:41:04'),
(491, 'RUAN', 26, NULL, '', '', '', '', '', '', '', '', '', '', '2018-06-30 00:41:04', '2018-06-30 00:41:04'),
(492, 'SHOLIKIN', 26, NULL, '', '', '', '', '', '', '', '', '', '', '2018-06-30 00:41:04', '2018-06-30 00:41:04'),
(493, 'RIZAL', 26, NULL, '', '', '', '', '', '', '', '', '', '', '2018-06-30 00:41:04', '2018-06-30 00:41:04'),
(494, 'AHSAN', 26, NULL, '', '', '', '', '', '', '', '', '', '', '2018-06-30 00:41:04', '2018-06-30 00:41:04'),
(495, 'LAILA', 26, NULL, '', '', '', '', '', '', '', '', '', '', '2018-06-30 00:41:04', '2018-06-30 00:41:04'),
(496, 'OLIV', 26, NULL, '', '', '', '', '', '', '', '', '', '', '2018-06-30 00:41:04', '2018-06-30 00:41:04'),
(497, 'LUTHFI', 26, NULL, '', '', '', '', '', '', '', '', '', '', '2018-06-30 00:41:05', '2018-06-30 00:41:05'),
(498, 'AYU', 26, NULL, '', '', '', '', '', '', '', '', '', '', '2018-06-30 00:41:05', '2018-06-30 00:41:05'),
(499, 'UMI', 29, NULL, '', '', '', '', '', '', '', '', '', '', '2018-06-30 00:41:05', '2018-06-30 00:41:05'),
(500, 'NOPI', 29, NULL, '', '', '', '', '', '', '', '', '', '', '2018-06-30 00:41:05', '2018-06-30 00:41:05'),
(501, 'INDAH', 29, NULL, '', '', '', '', '', '', '', '', '', '', '2018-06-30 00:41:05', '2018-06-30 00:41:05'),
(502, 'YUS\'A', 29, NULL, '', '', '', '', '', '', '', '', '', '', '2018-06-30 00:41:05', '2018-06-30 00:41:05'),
(503, 'DILA', 29, NULL, '', '', '', '', '', '', '', '', '', '', '2018-06-30 00:41:05', '2018-06-30 00:41:05'),
(504, 'HUSNA', 29, NULL, '', '', '', '', '', '', '', '', '', '', '2018-06-30 00:41:05', '2018-06-30 00:41:05'),
(505, 'TATA', 29, NULL, '', '', '', '', '', '', '', '', '', '', '2018-06-30 00:41:05', '2018-06-30 00:41:05'),
(506, 'AZIZAH', 29, NULL, '', '', '', '', '', '', '', '', '', '', '2018-06-30 00:41:05', '2018-06-30 00:41:05'),
(507, 'TIARA', 29, NULL, '', '', '', '', '', '', '', '', '', '', '2018-06-30 00:41:05', '2018-06-30 00:41:05'),
(508, 'LUTFI', 29, NULL, '', '', '', '', '', '', '', '', '', '', '2018-06-30 00:41:05', '2018-06-30 00:41:05'),
(509, 'FAUZUN', 29, NULL, '', '', '', '', '', '', '', '', '', '', '2018-06-30 00:41:05', '2018-06-30 00:41:05'),
(510, 'OCI', 29, NULL, '', '', '', '', '', '', '', '', '', '', '2018-06-30 00:41:05', '2018-06-30 00:41:05'),
(511, 'ARINI', 29, NULL, '', '', '', '', '', '', '', '', '', '', '2018-06-30 00:41:06', '2018-06-30 00:41:06'),
(512, 'NAY', 29, NULL, '', '', '', '', '', '', '', '', '', '', '2018-06-30 00:41:06', '2018-06-30 00:41:06'),
(513, 'RINDY', 29, NULL, '', '', '', '', '', '', '', '', '', '', '2018-06-30 00:41:06', '2018-06-30 00:41:06'),
(514, 'TIWI', 29, NULL, '', '', '', '', '', '', '', '', '', '', '2018-06-30 00:41:06', '2018-06-30 00:41:06'),
(515, 'LAILA', 29, NULL, '', '', '', '', '', '', '', '', '', '', '2018-06-30 00:41:06', '2018-06-30 00:41:06'),
(516, 'LAILI', 29, NULL, '', '', '', '', '', '', '', '', '', '', '2018-06-30 00:41:06', '2018-06-30 00:41:06'),
(517, 'WULAN', 29, NULL, '', '', '', '', '', '', '', '', '', '', '2018-06-30 00:41:06', '2018-06-30 00:41:06'),
(518, 'NURUL', 29, NULL, '', '', '', '', '', '', '', '', '', '', '2018-06-30 00:41:07', '2018-06-30 00:41:07'),
(519, 'ADE', 29, NULL, '', '', '', '', '', '', '', '', '', '', '2018-06-30 00:41:07', '2018-06-30 00:41:07'),
(520, 'THALIA', 29, NULL, '', '', '', '', '', '', '', '', '', '', '2018-06-30 00:41:07', '2018-06-30 00:41:07'),
(521, 'GISTA', 29, NULL, '', '', '', '', '', '', '', '', '', '', '2018-06-30 00:41:07', '2018-06-30 00:41:07'),
(522, 'ANE', 29, NULL, '', '', '', '', '', '', '', '', '', '', '2018-06-30 00:41:07', '2018-06-30 00:41:07'),
(523, 'ADE BONTANG', 29, NULL, '', '', '', '', '', '', '', '', '', '', '2018-06-30 00:41:07', '2018-06-30 00:41:07'),
(524, 'YAYAN', 29, NULL, '', '', '', '', '', '', '', '', '', '', '2018-06-30 00:41:07', '2018-06-30 00:41:07'),
(525, 'IRFAN', 29, NULL, '', '', '', '', '', '', '', '', '', '', '2018-06-30 00:41:07', '2018-06-30 00:41:07'),
(526, 'WILDAN', 29, NULL, '', '', '', '', '', '', '', '', '', '', '2018-06-30 00:41:07', '2018-06-30 00:41:07'),
(527, 'CHANDRA', 29, NULL, '', '', '', '', '', '', '', '', '', '', '2018-06-30 00:41:07', '2018-06-30 00:41:07'),
(528, 'PRAS', 29, NULL, '', '', '', '', '', '', '', '', '', '', '2018-06-30 00:41:08', '2018-06-30 00:41:08'),
(529, 'ROFIQ', 29, NULL, '', '', '', '', '', '', '', '', '', '', '2018-06-30 00:41:08', '2018-06-30 00:41:08'),
(530, 'UNCUY', 29, NULL, '', '', '', '', '', '', '', '', '', '', '2018-06-30 00:41:08', '2018-06-30 00:41:08'),
(531, 'ILHAM', 29, NULL, '', '', '', '', '', '', '', '', '', '', '2018-06-30 00:41:08', '2018-06-30 00:41:08'),
(532, 'SHIDIQ', 29, NULL, '', '', '', '', '', '', '', '', '', '', '2018-06-30 00:41:08', '2018-06-30 00:41:08'),
(533, 'ABIT KASMAL', 29, NULL, '', '', '', '', '', '', '', '', '', '', '2018-06-30 00:41:08', '2018-06-30 00:41:08'),
(534, 'ARIS', 29, NULL, '', '', '', '', '', '', '', '', '', '', '2018-06-30 00:41:08', '2018-06-30 00:41:08'),
(535, 'AHMAD', 29, NULL, '', '', '', '', '', '', '', '', '', '', '2018-06-30 00:41:08', '2018-06-30 00:41:08'),
(536, 'SYARUDIN', 29, NULL, '', '', '', '', '', '', '', '', '', '', '2018-06-30 00:41:08', '2018-06-30 00:41:08'),
(537, 'RIKO IBAD ABDULLOH', 29, NULL, '', '', '', '', '', '', '', '', '', '', '2018-06-30 00:41:09', '2018-06-30 00:41:09'),
(538, 'FAHMI ABDUL HADID RAZAK', 29, NULL, '', '', '', '', '', '', '', '', '', '', '2018-06-30 00:41:09', '2018-06-30 00:41:09'),
(539, 'DIMDIM', 29, NULL, '', '', '', '', '', '', '', '', '', '', '2018-06-30 00:41:09', '2018-06-30 00:41:09'),
(540, 'ERIS SBL', 29, NULL, '', '', '', '', '', '', '', '', '', '', '2018-06-30 00:41:09', '2018-06-30 00:41:09'),
(541, 'YOVI', 29, NULL, '', '', '', '', '', '', '', '', '', '', '2018-06-30 00:41:09', '2018-06-30 00:41:09'),
(542, 'ABDI', 29, NULL, '', '', '', '', '', '', '', '', '', '', '2018-06-30 00:41:09', '2018-06-30 00:41:09'),
(543, 'IRSYAD', 29, NULL, '', '', '', '', '', '', '', '', '', '', '2018-06-30 00:41:09', '2018-06-30 00:41:09'),
(544, 'DILAN', 29, NULL, '', '', '', '', '', '', '', '', '', '', '2018-06-30 00:41:10', '2018-06-30 00:41:10'),
(545, 'SANDHI', 29, NULL, '', '', '', '', '', '', '', '', '', '', '2018-06-30 00:41:10', '2018-06-30 00:41:10'),
(546, 'ARYA', 29, NULL, '', '', '', '', '', '', '', '', '', '', '2018-06-30 00:41:10', '2018-06-30 00:41:10'),
(547, 'DAVID', 29, NULL, '', '', '', '', '', '', '', '', '', '', '2018-06-30 00:41:10', '2018-06-30 00:41:10'),
(548, 'GATRA', 29, NULL, '', '', '', '', '', '', '', '', '', '', '2018-06-30 00:41:10', '2018-06-30 00:41:10'),
(549, 'RIJAL', 29, NULL, '', '', '', '', '', '', '', '', '', '', '2018-06-30 00:41:10', '2018-06-30 00:41:10'),
(550, 'AQIB', 29, NULL, '', '', '', '', '', '', '', '', '', '', '2018-06-30 00:41:10', '2018-06-30 00:41:10');

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
(1, 1, 'Pagi', 'Jumat, 29 Juni 2018', 'Ustadz Satria Ramadhani Gosal, Lc.Ma', NULL, '2018-06-29 05:23:18'),
(2, 1, 'Siang', 'Jumat, 29 Juni 2018', '-', '2018-06-29 05:22:11', '2018-06-29 05:22:11');

-- --------------------------------------------------------

--
-- Table structure for table `kegiatan`
--

CREATE TABLE `kegiatan` (
  `id_kegiatan` int(11) NOT NULL,
  `nama_kegiatan` varchar(70) NOT NULL,
  `tanggal_kegiatan` date NOT NULL,
  `lokasi_kegiatan` text NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `kegiatan`
--

INSERT INTO `kegiatan` (`id_kegiatan`, `nama_kegiatan`, `tanggal_kegiatan`, `lokasi_kegiatan`, `created_at`, `updated_at`) VALUES
(1, 'CAI', '2018-06-19', 'Jln. Lambung Mangkurat', '2018-06-24 04:21:55', '2018-06-24 04:32:35');

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
(1, 1, '2941533150001', 1, 'panitia', 1, '2018-06-24 18:15:12', '2018-06-24 22:05:41'),
(3, 1, '2941533150002', 2, 'panitia', 1, '2018-06-25 22:41:23', '2018-06-25 22:41:23'),
(5, 1, '2941533150003', 3, 'peserta', 1, '2018-06-26 08:48:28', '2018-06-26 08:48:28'),
(6, 1, '2941533150004', 11, 'peserta', 1, '2018-06-26 08:48:57', '2018-06-26 08:48:57'),
(7, 1, '2941533150005', 9, 'peserta', 1, '2018-06-26 20:56:14', '2018-06-26 20:56:14'),
(8, 1, '2941533150006', 4, 'panitia', 1, '2018-06-29 07:18:15', '2018-06-29 07:18:15'),
(9, 1, '2941533150007', 6, 'panitia', 1, '2018-06-29 07:18:16', '2018-06-29 07:18:16'),
(10, 1, '2941533150008', 8, 'panitia', 1, '2018-06-29 07:18:16', '2018-06-29 07:18:16'),
(11, 1, '2941533150009', 10, 'panitia', 1, '2018-06-29 07:18:16', '2018-06-29 07:18:16');

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
(1, 'SHINOBI KONOHA', 'JLN. MENUJU MASA DEPAN', '2018-06-24 05:42:21', '2018-06-24 20:15:23'),
(2, 'JAGOAN MAMA', 'WAKANDA', '2018-06-25 19:37:29', '2018-06-25 19:37:29'),
(3, 'KONOHA', 'KONOHAGAKURE', '2018-06-26 07:26:12', '2018-06-26 07:26:12'),
(4, 'HOKAGE', 'SUNAGAKURE', '2018-06-26 07:26:12', '2018-06-26 07:26:12'),
(5, 'UCHIHA', 'INDRA', '2018-06-26 07:26:12', '2018-06-26 07:26:12'),
(6, 'UZUMAKI', 'ASHURA', '2018-06-26 07:26:12', '2018-06-26 07:26:12'),
(7, 'PELINDUNG KONOHA', 'DIMENSI SASUKE', '2018-06-28 22:17:40', '2018-06-28 22:17:40'),
(8, 'DEWA SHINOBI', 'DUNIA HAGOROMO', '2018-06-28 22:17:41', '2018-06-28 22:17:41'),
(9, 'PENDIRI NINSHU', 'DUNIA HAGOROMO', '2018-06-29 20:55:29', '2018-06-29 20:55:29'),
(10, 'AIR PUTIH', 'JL. PNGERAN ANTASARI, JL. NUSA INDAH ', '2018-06-29 22:03:29', '2018-06-29 22:03:29'),
(11, 'ANGGANA', 'JL. PEMBANGUNAN, KAB. KUKAR', '2018-06-29 22:03:29', '2018-06-29 22:03:29'),
(12, 'ARGAMULYA', 'JL. KS. TUBUN GG WIRA TIRTA', '2018-06-29 22:03:29', '2018-06-29 22:03:29'),
(13, 'ARJUNA', 'JL. M. SAID GG KARET', '2018-06-29 22:03:29', '2018-06-29 22:03:29'),
(14, 'AZIZIYAH A', 'JL. DI. PANJAITAN GG. BUGIS', '2018-06-29 22:03:29', '2018-06-29 22:03:29'),
(15, 'AZIZIYAH B', 'JL. DI. PANJAITAN GG. BUGIS', '2018-06-29 22:03:29', '2018-06-29 22:03:29'),
(16, 'BENGKURING ', 'JL. BAYAM 11 BLOK E SAMARINDA UTARA', '2018-06-29 22:03:29', '2018-06-29 22:03:29'),
(17, 'HARAPAN BARU ', 'JL. KURNIA MAKMUR. KEC. LOA JANAN ILIR', '2018-06-29 22:03:30', '2018-06-29 22:03:30'),
(18, 'KARANG PACE A', 'JL. REVOLUSI, JL. PESANTREN', '2018-06-29 22:03:30', '2018-06-29 22:03:30'),
(19, 'KARANG PACE B', 'JL. REVOLUSI, JL. PESANTREN', '2018-06-29 22:03:30', '2018-06-29 22:03:30'),
(20, 'LOA DURI', 'LOA DURI', '2018-06-29 22:03:30', '2018-06-29 22:03:30'),
(21, 'MAKROMAN ', 'JL. POROS PROPINSI MAKROMAN', '2018-06-29 22:03:30', '2018-06-29 22:03:30'),
(22, 'MANGKUPALAS', 'JL. SMPN 8 RAPAK DALAM', '2018-06-29 22:03:30', '2018-06-29 22:03:30'),
(23, 'MERDEKA ', 'JL. GERILYA GG. FAMILY', '2018-06-29 22:03:30', '2018-06-29 22:03:30'),
(24, 'MUARA BADAK', 'MUARA BADAK ', '2018-06-29 22:03:30', '2018-06-29 22:03:30'),
(25, 'PALARAN', 'JL. PARIKESIT, RAWA MAKMUR', '2018-06-29 22:03:30', '2018-06-29 22:03:30'),
(26, 'PONPES AZIZIYAH', 'JL. DI. PANJAITAN GG. BUGIS', '2018-06-29 22:03:30', '2018-06-29 22:03:30'),
(27, 'PPDB SMA BUDI LUHUR', 'JL. DI. PANJAITAN GG. BUGIS', '2018-06-29 22:03:30', '2018-06-29 22:03:30'),
(28, 'PPDB SMP BUDI LUHUR', 'JL. DI. PANJAITAN GG. BUGIS', '2018-06-29 22:03:30', '2018-06-29 22:03:30'),
(29, 'PPPM', 'JL. WOLTER MONGINSIDI GG. 7', '2018-06-29 22:03:30', '2018-06-29 22:03:30'),
(30, 'SAMBUTAN ', 'JL. ST. SULAIMAN GG. AMALIAH', '2018-06-29 22:03:30', '2018-06-29 22:03:30'),
(31, 'SANGA-SANGA', '-', '2018-06-29 22:03:30', '2018-06-29 22:03:30'),
(32, 'SMA BUDI LUHUR', 'JL. DI. PANJAITAN GG. BUGIS', '2018-06-29 22:03:30', '2018-06-29 22:03:30'),
(33, 'SMP BUDI LUHUR', 'JL. DI. PANJAITAN GG. BUGIS', '2018-06-29 22:03:30', '2018-06-29 22:03:30'),
(34, 'SUNGAI DAMA', 'JL. OTISTA GG 12', '2018-06-29 22:03:30', '2018-06-29 22:03:30'),
(35, 'SUNGAI KUNJANG', 'JL. TEUKU UMAR', '2018-06-29 22:03:30', '2018-06-29 22:03:30'),
(36, 'SUTOMO', 'JL. DR. SUTOMO', '2018-06-29 22:03:30', '2018-06-29 22:03:30'),
(37, 'SWADAYA A', 'JL. WOLTER MONGINSIDI GG. 7', '2018-06-29 22:03:30', '2018-06-29 22:03:30'),
(38, 'SWADAYA B', 'JL. WOLTER MONGINSIDI GG. 7', '2018-06-29 22:03:30', '2018-06-29 22:03:30'),
(39, 'TANJUNG SANTAN', 'TANJUNG SANTAN MARANG KAYU', '2018-06-29 22:03:30', '2018-06-29 22:03:30');

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
(1, 'Administrator', 'admin', '$2y$10$SSTPVCNQM60/kGfdCO8eEO0PLdDekSpAVsMdD4x9bhOPvjHBBrZ0G', 2, 1, NULL, 'LSKfPDLJOXDlAiWatL0K75Oxr41rAyhC95TiIIqPXHGQUp3uc1CegrPOMFWp', 0, NULL),
(3, 'Daguy', 'daguy', '$2y$10$x/DtXp.55nXXBnNXEwk5fuE1nDqgAxog7zdUrBARoa2SDIX3QWaHm', 0, 1, NULL, 'kl03Y14v9P0AIziSTwBX36xqiLKnQOWWv07MW290DkeoFUQNCHaLOPI66rjb', 0, '2018-06-26 00:03:08'),
(4, 'Petugas', 'petugas', '$2y$10$K7awF85IQO.3i8c..R76quoiNyhGaYd6b4MQlgpWbwR5FKLWUy7w6', 1, 1, NULL, 'OwX4UsHhMntXVGBO0trm5Kv8P3E1inNhujsxd0SUJyMO2IQHcDu5U5kFPRt3', 0, '2018-06-27 18:19:04');

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
  MODIFY `id_absen` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `anggota`
--
ALTER TABLE `anggota`
  MODIFY `id_anggota` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=554;

--
-- AUTO_INCREMENT for table `jadwal`
--
ALTER TABLE `jadwal`
  MODIFY `id_jadwal` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `kegiatan`
--
ALTER TABLE `kegiatan`
  MODIFY `id_kegiatan` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `kegiatan_detail`
--
ALTER TABLE `kegiatan_detail`
  MODIFY `id_detail` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `kelompok`
--
ALTER TABLE `kelompok`
  MODIFY `id_kelompok` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=40;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id_users` int(3) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

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
