-- phpMyAdmin SQL Dump
-- version 4.7.7
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: Jun 25, 2018 at 08:58 AM
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
  `keterangan` text NOT NULL,
  `id_users` int(3) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `absen`
--

INSERT INTO `absen` (`id_absen`, `id_detail`, `waktu_absen`, `keterangan`, `id_users`, `created_at`, `updated_at`) VALUES
(2, 1, '2018-06-25 05:12:36', 'siang', 1, '2018-06-24 21:12:36', '2018-06-24 21:12:36');

-- --------------------------------------------------------

--
-- Table structure for table `anggota`
--

CREATE TABLE `anggota` (
  `id_anggota` int(11) NOT NULL,
  `nama_anggota` varchar(70) NOT NULL,
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
  `id_users` int(3) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `anggota`
--

INSERT INTO `anggota` (`id_anggota`, `nama_anggota`, `tgl_lahir`, `tempat_lahir`, `desa`, `jenis_kelamin`, `no_telepon`, `email`, `alamat`, `ket_peserta`, `ukuran_baju`, `dapukan`, `status_peserta`, `id_users`, `created_at`, `updated_at`) VALUES
(1, 'MAMAT', '2018-06-22', 'SAMARINDA', 'KARANG MUMUS', 'laki-laki', '085391791228', 'uhuy@gmail.com', 'JLN. MUSO SALIM', 'PAKETAN', 'XLL', 'TUKANG RUQYAH', 'ULAMA', 1, '2018-06-25 04:12:48', '2018-06-24 20:12:48'),
(2, 'PACKING', '2018-06-12', 'SAMARINDA', 'KONOHAGAKURE', 'perempuan', '083612312', 'sugoi@gmail.com', 'JLN.SUNGAI DAMA', 'SHINOBI', 'XL', 'ANBU', 'HOKAGE', 1, '2018-06-24 22:07:15', '2018-06-24 22:07:15');

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
  `id_kelompok` int(11) NOT NULL,
  `id_anggota` int(11) NOT NULL,
  `ket` varchar(30) NOT NULL,
  `id_users` int(3) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `kegiatan_detail`
--

INSERT INTO `kegiatan_detail` (`id_detail`, `id_kegiatan`, `code_barcode`, `id_kelompok`, `id_anggota`, `ket`, `id_users`, `created_at`, `updated_at`) VALUES
(1, 1, '2941533150001', 1, 1, 'panitia', 1, '2018-06-24 18:15:12', '2018-06-24 22:05:41'),
(2, 1, '2941533150002', 1, 2, 'peserta', 1, '2018-06-24 22:08:22', '2018-06-24 22:11:36'),
(4, 1, '2941533150003', 1, 2, 'panitia', 1, '2018-06-24 22:14:21', '2018-06-24 22:15:22');

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
(1, 'TUKANG HEDONIS', 'JLN. MENUJU MASA DEPAN', '2018-06-24 05:42:21', '2018-06-24 20:15:23');

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
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id_users`, `name`, `username`, `password`, `level`, `status_akun`, `last_login`, `remember_token`) VALUES
(1, 'Administrator', 'admin', '$2y$10$SSTPVCNQM60/kGfdCO8eEO0PLdDekSpAVsMdD4x9bhOPvjHBBrZ0G', 2, 1, NULL, 'Jtiz7DBqMIYspE0WXJjjnZcQLD33pjHzHU1mKzK8sKYWP1kJDcLWA52JKwjJ'),
(3, 'Daguy', 'daguy', '$2y$10$x/DtXp.55nXXBnNXEwk5fuE1nDqgAxog7zdUrBARoa2SDIX3QWaHm', 0, 1, NULL, 'rCbbqn7KGkNFI3HyhqkJaqO5ZBrBM1C7VkBwXyjBGglXnl0f6i1cbPf6qEpS'),
(4, 'Petugas', 'petugas', '$2y$10$WhLIk9dJYCt.YZ0iXc6Uy.tpvAOqgz8rBVl8I3dsVcM1TT3ZzSdwy', 1, 1, NULL, 'KUIl5YFRA3UW5xDjrAuv8r2OnFyoKV3ZQoeRyDR1yVV2DE8DmmAthyjyJbGj');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `absen`
--
ALTER TABLE `absen`
  ADD PRIMARY KEY (`id_absen`),
  ADD KEY `input_by` (`id_users`),
  ADD KEY `id_peserta` (`id_detail`) USING BTREE;

--
-- Indexes for table `anggota`
--
ALTER TABLE `anggota`
  ADD PRIMARY KEY (`id_anggota`),
  ADD KEY `id_users` (`id_users`);

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
  ADD KEY `id_kelompok` (`id_kelompok`),
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
  MODIFY `id_absen` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `anggota`
--
ALTER TABLE `anggota`
  MODIFY `id_anggota` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `kegiatan`
--
ALTER TABLE `kegiatan`
  MODIFY `id_kegiatan` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `kegiatan_detail`
--
ALTER TABLE `kegiatan_detail`
  MODIFY `id_detail` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `kelompok`
--
ALTER TABLE `kelompok`
  MODIFY `id_kelompok` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

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
  ADD CONSTRAINT `input_by` FOREIGN KEY (`id_users`) REFERENCES `users` (`id_users`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `anggota`
--
ALTER TABLE `anggota`
  ADD CONSTRAINT `anggota_ibfk_3` FOREIGN KEY (`id_users`) REFERENCES `users` (`id_users`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `kegiatan_detail`
--
ALTER TABLE `kegiatan_detail`
  ADD CONSTRAINT `kegiatan_detail_ibfk_1` FOREIGN KEY (`id_anggota`) REFERENCES `anggota` (`id_anggota`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `kegiatan_detail_ibfk_2` FOREIGN KEY (`id_kegiatan`) REFERENCES `kegiatan` (`id_kegiatan`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `kegiatan_detail_ibfk_3` FOREIGN KEY (`id_kelompok`) REFERENCES `kelompok` (`id_kelompok`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `kegiatan_detail_ibfk_4` FOREIGN KEY (`id_users`) REFERENCES `users` (`id_users`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
