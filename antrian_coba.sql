-- phpMyAdmin SQL Dump
-- version 4.5.1
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: 24 Mei 2018 pada 04.14
-- Versi Server: 10.1.10-MariaDB
-- PHP Version: 7.0.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `antrian_coba`
--

-- --------------------------------------------------------

--
-- Struktur dari tabel `tb_antrian`
--

CREATE TABLE `tb_antrian` (
  `antrian_ID` int(11) NOT NULL,
  `nomor_antrian` int(11) NOT NULL,
  `nomor_loket` varchar(50) DEFAULT NULL,
  `kategori` varchar(50) NOT NULL,
  `tanggal` date NOT NULL,
  `status` enum('pending','proses','finish') NOT NULL DEFAULT 'pending'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data untuk tabel `tb_antrian`
--

INSERT INTO `tb_antrian` (`antrian_ID`, `nomor_antrian`, `nomor_loket`, `kategori`, `tanggal`, `status`) VALUES
(1, 1, '5', 'antrian-umum', '2018-04-16', 'proses'),
(2, 2, '5', 'antrian-umum', '2018-04-16', 'proses'),
(3, 3, '8', 'antrian-khusus', '2018-04-16', 'proses'),
(4, 4, NULL, 'antrian-khusus', '2018-04-16', 'pending'),
(5, 5, NULL, 'antrian-khusus', '2018-04-16', 'pending'),
(6, 1, NULL, 'antrian-umum', '2018-04-18', 'pending');

-- --------------------------------------------------------

--
-- Struktur dari tabel `tb_kategori`
--

CREATE TABLE `tb_kategori` (
  `kategori_ID` int(11) NOT NULL,
  `kategori_name` varchar(50) NOT NULL,
  `kategori_slug` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data untuk tabel `tb_kategori`
--

INSERT INTO `tb_kategori` (`kategori_ID`, `kategori_name`, `kategori_slug`) VALUES
(3, 'Antrian Umum', 'antrian-umum'),
(5, 'Antrian Khusus', 'antrian-khusus');

-- --------------------------------------------------------

--
-- Struktur dari tabel `tb_log_attemp`
--

CREATE TABLE `tb_log_attemp` (
  `users_ID` int(11) NOT NULL,
  `log_date` datetime NOT NULL,
  `ip_address` varchar(20) NOT NULL,
  `device` text NOT NULL,
  `platform` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data untuk tabel `tb_log_attemp`
--

INSERT INTO `tb_log_attemp` (`users_ID`, `log_date`, `ip_address`, `device`, `platform`) VALUES
(1, '2018-04-12 16:56:32', '::1', 'Chrome', 'Windows 10'),
(1, '2018-04-13 13:50:10', '::1', 'Chrome', 'Windows 10'),
(1, '2018-04-16 11:28:50', '::1', 'Chrome', 'Windows 10'),
(1, '2018-04-16 12:01:14', '::1', 'Chrome', 'Windows 10');

-- --------------------------------------------------------

--
-- Struktur dari tabel `tb_loket_aktif`
--

CREATE TABLE `tb_loket_aktif` (
  `nomor_antrian` int(11) NOT NULL,
  `nomor_loket` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data untuk tabel `tb_loket_aktif`
--

INSERT INTO `tb_loket_aktif` (`nomor_antrian`, `nomor_loket`) VALUES
(2, 'Loket 1'),
(3, 'Loket 2');

-- --------------------------------------------------------

--
-- Struktur dari tabel `tb_nomor_loket`
--

CREATE TABLE `tb_nomor_loket` (
  `nomor_loket_ID` int(11) NOT NULL,
  `nomor_loket` varchar(50) NOT NULL,
  `slug` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data untuk tabel `tb_nomor_loket`
--

INSERT INTO `tb_nomor_loket` (`nomor_loket_ID`, `nomor_loket`, `slug`) VALUES
(5, 'Loket 1', 'loket-1'),
(8, 'Loket 2', 'loket-2');

-- --------------------------------------------------------

--
-- Struktur dari tabel `tb_panggilan`
--

CREATE TABLE `tb_panggilan` (
  `panggilan_ID` int(11) NOT NULL,
  `nomor_antrian` int(11) DEFAULT NULL,
  `loket` varchar(50) DEFAULT NULL,
  `tanggal` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data untuk tabel `tb_panggilan`
--

INSERT INTO `tb_panggilan` (`panggilan_ID`, `nomor_antrian`, `loket`, `tanggal`) VALUES
(1, 1, 'Loket 1', '2018-04-11'),
(2, 2, 'Loket 1', '2018-04-11'),
(3, 1, 'Loket 1', '2018-04-12'),
(4, 2, 'Loket 1', '2018-04-12'),
(5, 1, 'Loket 1', '2018-04-12'),
(6, 1, 'Loket 1', '2018-04-12'),
(7, 2, 'Loket 1', '2018-04-12'),
(8, 3, 'Loket 1', '2018-04-12'),
(9, 4, 'Loket 1', '2018-04-12'),
(10, 1, 'Loket 1', '2018-04-12'),
(11, 5, 'Loket 1', '2018-04-12'),
(12, 6, 'Loket 1', '2018-04-12'),
(13, 7, 'Loket 1', '2018-04-12'),
(14, 1, 'Loket 1', '2018-04-13'),
(15, 1, 'Loket 1', '2018-04-13'),
(16, 2, 'Loket 1', '2018-04-13'),
(17, 3, 'Loket 1', '2018-04-13'),
(18, 4, 'Loket 1', '2018-04-13'),
(19, 1, 'Loket 1', '2018-04-13'),
(20, 1, 'Loket 1', '2018-04-16'),
(21, 1, 'Loket 1', '2018-04-16'),
(22, 1, 'Loket 1', '2018-04-16'),
(23, 2, 'Loket 1', '2018-04-16'),
(24, 3, 'Loket 2', '2018-04-16');

-- --------------------------------------------------------

--
-- Struktur dari tabel `tb_relation_kategori`
--

CREATE TABLE `tb_relation_kategori` (
  `kategori_ID` int(11) NOT NULL,
  `nomor_loket_ID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data untuk tabel `tb_relation_kategori`
--

INSERT INTO `tb_relation_kategori` (`kategori_ID`, `nomor_loket_ID`) VALUES
(3, 5),
(5, 8);

-- --------------------------------------------------------

--
-- Struktur dari tabel `tb_settings`
--

CREATE TABLE `tb_settings` (
  `settings_ID` int(11) NOT NULL,
  `nama` varchar(100) DEFAULT NULL,
  `alamat` varchar(100) DEFAULT NULL,
  `logo_kanan` varchar(100) DEFAULT NULL,
  `logo_kiri` varchar(100) DEFAULT NULL,
  `os` enum('linux','microsoft') DEFAULT 'linux',
  `user` varchar(20) DEFAULT NULL,
  `printer_name` varchar(50) DEFAULT NULL,
  `printer_ip` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data untuk tabel `tb_settings`
--

INSERT INTO `tb_settings` (`settings_ID`, `nama`, `alamat`, `logo_kanan`, `logo_kiri`, `os`, `user`, `printer_name`, `printer_ip`) VALUES
(1, 'DINAS KESEHATAN KOTA MEDAN\r\n<br>PUSKESMAS HELVETIA\r\n<br>', 'Jl. Helvetia No. 15 Medan', 'logokiri.png', 'logokanan.png', 'microsoft', 'DESKTOP-8IJTCGR', 'EPSON L300 Series', '127.0.0.1');

-- --------------------------------------------------------

--
-- Struktur dari tabel `tb_statistik`
--

CREATE TABLE `tb_statistik` (
  `tanggal` date NOT NULL,
  `jumlah` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data untuk tabel `tb_statistik`
--

INSERT INTO `tb_statistik` (`tanggal`, `jumlah`) VALUES
('2018-01-11', 4),
('2018-04-10', 10),
('2018-04-11', 29),
('2018-04-12', 31),
('2018-04-13', 35),
('2018-04-16', 7),
('2018-04-18', 1);

-- --------------------------------------------------------

--
-- Struktur dari tabel `tb_users`
--

CREATE TABLE `tb_users` (
  `users_ID` int(11) NOT NULL,
  `avatar` varchar(100) DEFAULT NULL,
  `nama_lengkap` varchar(50) DEFAULT NULL,
  `username` varchar(50) DEFAULT NULL,
  `password` varchar(100) DEFAULT NULL,
  `role` varchar(20) DEFAULT NULL,
  `nomor_loket` int(11) DEFAULT NULL,
  `kategori` int(11) DEFAULT NULL,
  `date_added` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data untuk tabel `tb_users`
--

INSERT INTO `tb_users` (`users_ID`, `avatar`, `nama_lengkap`, `username`, `password`, `role`, `nomor_loket`, `kategori`, `date_added`) VALUES
(1, NULL, NULL, 'admin', '$2y$10$3rhKcmnEWf7c1jWZ2CF0MuaYh7nWSQZC6ywq8JUKukveLW1jMUcze', 'admin', 0, 0, '2017-09-25'),
(3, NULL, 'User Loket 1', 'loket1', '$2y$10$wAg6FzT2EfbRuRJbH/T7AemF4MpZQ3vm5MgCSzSL0So2P/D7PTf5S', 'loket', 5, 3, '2018-04-11'),
(5, NULL, 'User Loket 2', 'loket2', '$2y$10$Y8yT8RcMBCTraClRHy/fMe5lUuIEtPnugE.KJlTjP6gDebURU.ssm', 'loket', 8, 5, '2018-04-16');

-- --------------------------------------------------------

--
-- Struktur dari tabel `tb_video`
--

CREATE TABLE `tb_video` (
  `video_ID` int(11) NOT NULL,
  `video_name` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data untuk tabel `tb_video`
--

INSERT INTO `tb_video` (`video_ID`, `video_name`) VALUES
(1, '4e64d71088057e0aa7e95bc485452759.mp4');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `tb_antrian`
--
ALTER TABLE `tb_antrian`
  ADD PRIMARY KEY (`antrian_ID`);

--
-- Indexes for table `tb_kategori`
--
ALTER TABLE `tb_kategori`
  ADD PRIMARY KEY (`kategori_ID`);

--
-- Indexes for table `tb_nomor_loket`
--
ALTER TABLE `tb_nomor_loket`
  ADD PRIMARY KEY (`nomor_loket_ID`);

--
-- Indexes for table `tb_panggilan`
--
ALTER TABLE `tb_panggilan`
  ADD PRIMARY KEY (`panggilan_ID`);

--
-- Indexes for table `tb_settings`
--
ALTER TABLE `tb_settings`
  ADD PRIMARY KEY (`settings_ID`);

--
-- Indexes for table `tb_users`
--
ALTER TABLE `tb_users`
  ADD PRIMARY KEY (`users_ID`);

--
-- Indexes for table `tb_video`
--
ALTER TABLE `tb_video`
  ADD PRIMARY KEY (`video_ID`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `tb_antrian`
--
ALTER TABLE `tb_antrian`
  MODIFY `antrian_ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;
--
-- AUTO_INCREMENT for table `tb_kategori`
--
ALTER TABLE `tb_kategori`
  MODIFY `kategori_ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;
--
-- AUTO_INCREMENT for table `tb_nomor_loket`
--
ALTER TABLE `tb_nomor_loket`
  MODIFY `nomor_loket_ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;
--
-- AUTO_INCREMENT for table `tb_panggilan`
--
ALTER TABLE `tb_panggilan`
  MODIFY `panggilan_ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=25;
--
-- AUTO_INCREMENT for table `tb_users`
--
ALTER TABLE `tb_users`
  MODIFY `users_ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;
--
-- AUTO_INCREMENT for table `tb_video`
--
ALTER TABLE `tb_video`
  MODIFY `video_ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
