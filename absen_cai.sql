-- phpMyAdmin SQL Dump
-- version 4.7.7
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: Jun 24, 2018 at 06:59 AM
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
  `id_kegiatan` int(11) NOT NULL,
  `id_anggota` int(11) NOT NULL,
  `waktu_absen` datetime NOT NULL,
  `keterangan` text NOT NULL,
  `id_users` int(3) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `anggota`
--

CREATE TABLE `anggota` (
  `id_anggota` int(11) NOT NULL,
  `id_kelompok` int(11) NOT NULL,
  `id_kegiatan` int(11) NOT NULL,
  `nama_anggota` varchar(70) NOT NULL,
  `tgl_lahir` date NOT NULL,
  `no_telepon` varchar(20) NOT NULL,
  `alamat` text NOT NULL,
  `id_users` int(3) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

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
  `last_login` datetime NOT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `absen`
--
ALTER TABLE `absen`
  ADD PRIMARY KEY (`id_absen`),
  ADD KEY `id_anggota` (`id_anggota`),
  ADD KEY `id_kegiatan` (`id_kegiatan`),
  ADD KEY `input_by` (`id_users`);

--
-- Indexes for table `anggota`
--
ALTER TABLE `anggota`
  ADD PRIMARY KEY (`id_anggota`),
  ADD KEY `id_kegiatan` (`id_kegiatan`),
  ADD KEY `id_kelompok` (`id_kelompok`),
  ADD KEY `id_users` (`id_users`);

--
-- Indexes for table `kegiatan`
--
ALTER TABLE `kegiatan`
  ADD PRIMARY KEY (`id_kegiatan`);

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
  MODIFY `id_absen` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `anggota`
--
ALTER TABLE `anggota`
  MODIFY `id_anggota` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `kegiatan`
--
ALTER TABLE `kegiatan`
  MODIFY `id_kegiatan` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `kelompok`
--
ALTER TABLE `kelompok`
  MODIFY `id_kelompok` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id_users` int(3) NOT NULL AUTO_INCREMENT;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `absen`
--
ALTER TABLE `absen`
  ADD CONSTRAINT `absen_ibfk_1` FOREIGN KEY (`id_anggota`) REFERENCES `anggota` (`id_anggota`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `absen_ibfk_2` FOREIGN KEY (`id_kegiatan`) REFERENCES `kegiatan` (`id_kegiatan`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `input_by` FOREIGN KEY (`id_users`) REFERENCES `users` (`id_users`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `anggota`
--
ALTER TABLE `anggota`
  ADD CONSTRAINT `anggota_ibfk_1` FOREIGN KEY (`id_kegiatan`) REFERENCES `kegiatan` (`id_kegiatan`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `anggota_ibfk_2` FOREIGN KEY (`id_kelompok`) REFERENCES `kelompok` (`id_kelompok`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `anggota_ibfk_3` FOREIGN KEY (`id_users`) REFERENCES `users` (`id_users`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
