-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Nov 23, 2025 at 01:25 PM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `loopay`
--

-- --------------------------------------------------------

--
-- Table structure for table `anggota_kas`
--

CREATE TABLE `anggota_kas` (
  `id_anggota_kas` int(11) NOT NULL,
  `id_pengguna` int(11) DEFAULT NULL,
  `id_kas` int(11) DEFAULT NULL,
  `status_anggota_kas` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `anggota_kas`
--

INSERT INTO `anggota_kas` (`id_anggota_kas`, `id_pengguna`, `id_kas`, `status_anggota_kas`) VALUES
(5, 51, 7, NULL),
(6, 51, 8, NULL),
(7, 51, 9, NULL),
(8, 51, 10, NULL),
(10, 52, 11, NULL),
(12, 51, 12, NULL),
(13, 51, 14, NULL),
(14, 51, 15, NULL),
(15, 52, 15, NULL),
(16, 55, 15, NULL),
(17, 51, 16, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `kas`
--

CREATE TABLE `kas` (
  `id_kas` int(11) NOT NULL,
  `nama_kas` varchar(255) DEFAULT NULL,
  `id_bendahara` int(11) DEFAULT NULL,
  `id_pengawas` int(11) DEFAULT NULL,
  `kode_kas` varchar(100) DEFAULT NULL,
  `total_saldo_kas` decimal(15,2) DEFAULT NULL,
  `tanggal_buat_kas` date DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `kas`
--

INSERT INTO `kas` (`id_kas`, `nama_kas`, `id_bendahara`, `id_pengawas`, `kode_kas`, `total_saldo_kas`, `tanggal_buat_kas`) VALUES
(2, 'kas 2', 44, NULL, '65CDD8', NULL, '2025-11-04'),
(3, 'hai', 44, NULL, '918FD7', NULL, '2025-11-05'),
(4, 'apa', 43, NULL, '015CB7', NULL, '2025-11-05'),
(5, 'kas kelas 1', 51, NULL, 'CCFEAC', NULL, '2025-11-21'),
(6, 'kas ibuk ari', 51, NULL, '0C6A60', NULL, '2025-11-22'),
(7, 'kas kelas 1', 52, NULL, '7CE8A2', NULL, '2025-11-22'),
(8, 'Kas kelas TI C1', 52, NULL, '3B672D', NULL, '2025-11-22'),
(9, 'kas kelas IPA 25', 54, NULL, '1317ED', NULL, '2025-11-22'),
(10, 'kas aulia', 53, NULL, 'DA9310', NULL, '2025-11-22'),
(11, 'Kas kelas TI C1', 51, NULL, 'CCEE4D', NULL, '2025-11-22'),
(12, 'Kas baru', 52, NULL, 'C2EC27', NULL, '2025-11-22'),
(13, '1', 51, NULL, 'FA89CC', NULL, '2025-11-22'),
(14, '2', 51, NULL, '5254F4', NULL, '2025-11-22'),
(15, '3', 51, NULL, '8C23C6', NULL, '2025-11-23'),
(16, 'kas kelas seni rupa', 51, NULL, '64E3E6', NULL, '2025-11-23');

-- --------------------------------------------------------

--
-- Table structure for table `kolom`
--

CREATE TABLE `kolom` (
  `id_kolom` int(11) NOT NULL,
  `id_kas` int(11) DEFAULT NULL,
  `nama_kolom` varchar(255) DEFAULT NULL,
  `urutan_kolom` int(11) DEFAULT NULL,
  `nominal_per_kolom` decimal(15,2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `nilai_iuran`
--

CREATE TABLE `nilai_iuran` (
  `id_nilai_iuran` int(11) NOT NULL,
  `id_kolom` int(11) DEFAULT NULL,
  `id_anggota_kas` int(11) DEFAULT NULL,
  `jumlah_nilai_iuran` decimal(15,2) DEFAULT NULL,
  `status_nilai_iuran` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `pengguna`
--

CREATE TABLE `pengguna` (
  `id_pengguna` int(11) NOT NULL,
  `nama_pengguna` varchar(255) DEFAULT NULL,
  `email_pengguna` varchar(255) DEFAULT NULL,
  `no_hp_pengguna` varchar(15) DEFAULT NULL,
  `password_pengguna` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `pengguna`
--

INSERT INTO `pengguna` (`id_pengguna`, `nama_pengguna`, `email_pengguna`, `no_hp_pengguna`, `password_pengguna`) VALUES
(51, 'Nazilla Fani', 'nazillaaj@gmail.com', '0812345678', '$2y$10$.0RUQZhkjVa5YdLMNEVcTuncw9DqMSD6Kxf.0xJwJ7zPz.vlKc.SW'),
(52, 'nova', 'nova@gmail.com', NULL, '$2y$10$1dnD96M6vqQkEDkMAaXT1.O6mL6R6Q9Nypu20va52xDvH43RdL8tS'),
(53, 'aulia', 'aulia@gmail.com', NULL, '$2y$10$QUo8e3Df9l/q7KkubNymV.jXaEnnUKol3VcNACIJmZcpDDkDimsfe'),
(54, 'Nazilla Fani', 'nazilla@gmail.com', NULL, '$2y$10$oKcGwHxGs468I7aM3tyMCOLgvgoWrLehZoiH.bMFJ4gn2W1vfgCiq'),
(55, 'Sahara', 'sahara@gmail.com', NULL, '$2y$10$Jt8PpR08gfejGVL0EPW5x.v0ThwP84Zz6gcYW8hQIUWYG3fVgHmdK'),
(56, '2409020093', 'nazillaqqqqqaj@gmail.com', NULL, '$2y$10$kb.3aFX0gWWr0BlOWZGqU.JOY6Keo4k.sev797mffZfnClYITKeH6');

-- --------------------------------------------------------

--
-- Table structure for table `transaksi`
--

CREATE TABLE `transaksi` (
  `id_transaksi` int(11) NOT NULL,
  `id_kas` int(11) DEFAULT NULL,
  `id_anggota_kas` int(11) DEFAULT NULL,
  `id_pengguna` int(11) DEFAULT NULL,
  `jenis_transaksi` varchar(50) DEFAULT NULL,
  `jumlah_transaksi` decimal(15,2) DEFAULT NULL,
  `keterangan_transaksi` text DEFAULT NULL,
  `tanggal_transaksi` date DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `anggota_kas`
--
ALTER TABLE `anggota_kas`
  ADD PRIMARY KEY (`id_anggota_kas`),
  ADD KEY `id_pengguna` (`id_pengguna`),
  ADD KEY `id_kas` (`id_kas`);

--
-- Indexes for table `kas`
--
ALTER TABLE `kas`
  ADD PRIMARY KEY (`id_kas`),
  ADD UNIQUE KEY `kode_kas` (`kode_kas`);

--
-- Indexes for table `kolom`
--
ALTER TABLE `kolom`
  ADD PRIMARY KEY (`id_kolom`),
  ADD KEY `id_kas` (`id_kas`);

--
-- Indexes for table `nilai_iuran`
--
ALTER TABLE `nilai_iuran`
  ADD PRIMARY KEY (`id_nilai_iuran`),
  ADD KEY `id_kolom` (`id_kolom`),
  ADD KEY `id_anggota_kas` (`id_anggota_kas`);

--
-- Indexes for table `pengguna`
--
ALTER TABLE `pengguna`
  ADD PRIMARY KEY (`id_pengguna`),
  ADD UNIQUE KEY `email_pengguna` (`email_pengguna`),
  ADD UNIQUE KEY `no_hp_pengguna` (`no_hp_pengguna`);

--
-- Indexes for table `transaksi`
--
ALTER TABLE `transaksi`
  ADD PRIMARY KEY (`id_transaksi`),
  ADD KEY `id_kas` (`id_kas`),
  ADD KEY `id_anggota_kas` (`id_anggota_kas`),
  ADD KEY `id_pengguna` (`id_pengguna`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `anggota_kas`
--
ALTER TABLE `anggota_kas`
  MODIFY `id_anggota_kas` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- AUTO_INCREMENT for table `kas`
--
ALTER TABLE `kas`
  MODIFY `id_kas` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT for table `kolom`
--
ALTER TABLE `kolom`
  MODIFY `id_kolom` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `nilai_iuran`
--
ALTER TABLE `nilai_iuran`
  MODIFY `id_nilai_iuran` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `pengguna`
--
ALTER TABLE `pengguna`
  MODIFY `id_pengguna` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=57;

--
-- AUTO_INCREMENT for table `transaksi`
--
ALTER TABLE `transaksi`
  MODIFY `id_transaksi` int(11) NOT NULL AUTO_INCREMENT;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `anggota_kas`
--
ALTER TABLE `anggota_kas`
  ADD CONSTRAINT `anggota_kas_ibfk_1` FOREIGN KEY (`id_pengguna`) REFERENCES `pengguna` (`id_pengguna`),
  ADD CONSTRAINT `anggota_kas_ibfk_2` FOREIGN KEY (`id_kas`) REFERENCES `kas` (`id_kas`);

--
-- Constraints for table `kolom`
--
ALTER TABLE `kolom`
  ADD CONSTRAINT `kolom_ibfk_1` FOREIGN KEY (`id_kas`) REFERENCES `kas` (`id_kas`);

--
-- Constraints for table `nilai_iuran`
--
ALTER TABLE `nilai_iuran`
  ADD CONSTRAINT `nilai_iuran_ibfk_1` FOREIGN KEY (`id_kolom`) REFERENCES `kolom` (`id_kolom`),
  ADD CONSTRAINT `nilai_iuran_ibfk_2` FOREIGN KEY (`id_anggota_kas`) REFERENCES `anggota_kas` (`id_anggota_kas`);

--
-- Constraints for table `transaksi`
--
ALTER TABLE `transaksi`
  ADD CONSTRAINT `transaksi_ibfk_1` FOREIGN KEY (`id_kas`) REFERENCES `kas` (`id_kas`),
  ADD CONSTRAINT `transaksi_ibfk_2` FOREIGN KEY (`id_anggota_kas`) REFERENCES `anggota_kas` (`id_anggota_kas`),
  ADD CONSTRAINT `transaksi_ibfk_3` FOREIGN KEY (`id_pengguna`) REFERENCES `pengguna` (`id_pengguna`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
