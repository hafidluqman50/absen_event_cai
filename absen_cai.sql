-- phpMyAdmin SQL Dump
-- version 4.7.7
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: Jun 26, 2018 at 10:06 AM
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
(4, 4, '2018-06-26 07:10:55', 2, 1, '2018-06-25 23:10:55', '2018-06-25 23:10:55');

-- --------------------------------------------------------

--
-- Table structure for table `anggota`
--

CREATE TABLE `anggota` (
  `id_anggota` int(11) NOT NULL,
  `nama_anggota` varchar(70) NOT NULL,
  `id_kelompok` int(11) NOT NULL,
  `tgl_lahir` date NOT NULL,
  `tempat_lahir` varchar(70) NOT NULL,
  `desa` varchar(50) NOT NULL,
  `jenis_kelamin` enum('laki-laki','perempuan') NOT NULL,
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
(4, 'KING T\'CHALLA', 2, '2018-06-30', 'SAMARINDA', 'BLACK PANTHER', 'laki-laki', '08888888888888', 't\'chall@mail.com', 'JLN. BATU ANGIN', 'JAGOAN', 'XL', 'SEPUH', 'RAJA', '2018-06-25 22:24:02', '2018-06-25 22:24:02');

-- --------------------------------------------------------

--
-- Table structure for table `jadwal`
--

CREATE TABLE `jadwal` (
  `id_jadwal` int(11) NOT NULL,
  `id_kegiatan` int(11) NOT NULL,
  `nama_jadwal` varchar(50) NOT NULL,
  `keterangan` text NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `jadwal`
--

INSERT INTO `jadwal` (`id_jadwal`, `id_kegiatan`, `nama_jadwal`, `keterangan`, `created_at`, `updated_at`) VALUES
(1, 1, 'Pagi', 'Ustadz Satria Ramadhani Gosal, Lc.Ma', NULL, '2018-06-25 20:27:10'),
(2, 2, 'Pagi', 'King T\'Chaka', '2018-06-25 23:03:32', '2018-06-25 23:03:32');

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
(1, 'CAI', '2018-06-19', 'Jln. Lambung Mangkurat', '2018-06-24 04:21:55', '2018-06-24 04:32:35'),
(2, 'Cagar Alam', '2018-06-30', 'Wakanda', '2018-06-25 23:00:04', '2018-06-25 23:00:04');

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
(3, 1, '2941533150002', 4, 'panitia', 1, '2018-06-25 22:41:23', '2018-06-25 22:41:23'),
(4, 2, '2941533150001', 1, 'peserta', 1, '2018-06-25 23:10:40', '2018-06-25 23:10:40');

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
(2, 'JAGOAN MAMA', 'WAKANDA', '2018-06-25 19:37:29', '2018-06-25 19:37:29');

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
(1, 'Administrator', 'admin', '$2y$10$SSTPVCNQM60/kGfdCO8eEO0PLdDekSpAVsMdD4x9bhOPvjHBBrZ0G', 2, 1, NULL, '9ou4IM0ox9sKjGPEktsBa4PDN8l50p4QSGg2Tj9GCL44ljVvUxm6xNVmWb35', 0, NULL),
(3, 'Daguy', 'daguy', '$2y$10$x/DtXp.55nXXBnNXEwk5fuE1nDqgAxog7zdUrBARoa2SDIX3QWaHm', 0, 1, NULL, 'oHF8L0oVLZUTnuUHTsd3Qb2QQ2YfJ82V4ky3BaZt9ltrkgfSOJTZ05GulH1H', 1, '2018-06-26 00:03:08'),
(4, 'Petugas', 'petugas', '$2y$10$WhLIk9dJYCt.YZ0iXc6Uy.tpvAOqgz8rBVl8I3dsVcM1TT3ZzSdwy', 1, 1, NULL, 'AEAEjXfSQZJPOiMI06kEzsl7UhvbKJgKTDJ4V8PiQuQPCdci39Bp6eG0WX4t', 0, NULL);

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
  MODIFY `id_anggota` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `jadwal`
--
ALTER TABLE `jadwal`
  MODIFY `id_jadwal` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `kegiatan`
--
ALTER TABLE `kegiatan`
  MODIFY `id_kegiatan` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `kegiatan_detail`
--
ALTER TABLE `kegiatan_detail`
  MODIFY `id_detail` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `kelompok`
--
ALTER TABLE `kelompok`
  MODIFY `id_kelompok` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

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
