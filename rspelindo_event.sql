-- phpMyAdmin SQL Dump
-- version 4.2.7.1
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: Sep 17, 2018 at 08:39 AM
-- Server version: 5.5.39
-- PHP Version: 5.4.31

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `rspelindo_event`
--

-- --------------------------------------------------------

--
-- Table structure for table `pengaturan`
--

CREATE TABLE IF NOT EXISTS `pengaturan` (
`id` int(11) NOT NULL,
  `kecepatan` int(11) NOT NULL,
  `warna_bg` varchar(20) NOT NULL,
  `warna_teks` varchar(20) NOT NULL
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=2 ;

--
-- Dumping data for table `pengaturan`
--

INSERT INTO `pengaturan` (`id`, `kecepatan`, `warna_bg`, `warna_teks`) VALUES
(1, 5, 'White', 'skyblue');

-- --------------------------------------------------------

--
-- Table structure for table `slider`
--

CREATE TABLE IF NOT EXISTS `slider` (
`id` int(11) NOT NULL,
  `nama` varchar(30) NOT NULL,
  `keterangan` text NOT NULL,
  `tanggal` date NOT NULL,
  `tgl_mulai` date NOT NULL,
  `tgl_siap` date NOT NULL,
  `image` text NOT NULL,
  `flag` int(1) NOT NULL COMMENT '0=default, 1=event',
  `status` int(11) DEFAULT NULL
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=24 ;

--
-- Dumping data for table `slider`
--

INSERT INTO `slider` (`id`, `nama`, `keterangan`, `tanggal`, `tgl_mulai`, `tgl_siap`, `image`, `flag`, `status`) VALUES
(14, 'cobaaan aktif', 'yeee', '2018-09-13', '2018-09-07', '2018-09-27', '3b15be84aff20b322a93c0b9aaa62e25ad33b4b4-Jellyfish.jpg', 1, 1),
(15, 'Hari Raya aktif', 'PT PHCM mengadakan event wow', '2018-09-13', '2018-09-16', '2018-09-22', 'd7b1345862d7d764e8f1351706d699a88c2a5dfd-Picture1.jpg', 0, 1),
(16, 'Tahun Baru aktif', 'Perayaan tahun baru awalnya muncul di Timur Tengah, 2000 SM. Penduduk Mesopotamia merayakan pergantian tahun saat matahari tepat berada di atas katulistiwa, atau tepatnya 20 Maret.[1] Hingga kini, Iran masih merayakan tahun baru pada tanggal 20, 21, atau 22 Maret, yang disebut Nowruz.\r\n\r\nUntuk penanggalan Masehi, Tahun Baru pertama kali dirayakan pada tanggal 1 Januari 45 SM.[2] Tidak lama setelah Julius Caesar dinobatkan sebagai kaisar Roma, ia memutuskan untuk mengganti penanggalan tradisional Romawi yang telah diciptakan sejak abad ketujuh SM. Dalam mendesain kalender baru ini, Julius Caesar dibantu oleh Sosigenes, seorang ahli astronomi dari Iskandariyah, yang menyarankan agar penanggalan baru itu dibuat dengan mengikuti revolusi matahari, sebagaimana yang dilakukan orang-orang Mesir. Satu tahun dalam penanggalan baru itu dihitung sebanyak 365 seperempat hari dan Caesar menambahkan 67 hari pada tahun 45 SM sehingga tahun 46 SM dimulai pada 1 Januari. Caesar juga memerintahkan agar setiap empat tahun, satu hari ditambahkan kepada bulan Februari, yang secara teoretis bisa menghindari penyimpangan dalam kalender baru ini. Tidak lama sebelum Caesar terbunuh pada tahun 44 SM, dia mengubah nama bulan Quintilis dengan namanya, yaitu Julius atau Juli. Kemudian, nama bulan Sextilis diganti dengan nama pengganti Julius Caesar, Kaisar Augustus, menjadi bulan Agustus.', '2018-09-13', '2018-09-01', '2018-09-22', '6e44d6208c2f59f691916040f09d2257228c4446-sparkler-677774_1920.jpg', 0, 1),
(18, 'Sunat Massal nonaktif', 'Sunat masal yang diadakan pelindo', '2018-09-13', '2018-09-01', '2018-09-16', '30420d1a9afb2bcb60335812569af4435a59ce17-Desert.jpg', 0, 0),
(19, 'Katarak nonaktif', 'katara', '2018-09-13', '2018-09-14', '2018-09-29', '1b4605b0e20ceccf91aa278d10e81fad64e24e27-Lighthouse.jpg', 1, 0),
(20, 'Ini Event Aktif', 'Haiii', '2018-09-14', '2018-09-05', '2018-09-11', '54c2f1a1eb6f12d681a5c7078421a5500cee02ad-Tulips.jpg', 0, 1),
(21, 'Bismillah', 'Bismillahirahmanirahin', '2018-09-14', '2018-09-16', '2018-09-29', 'e490141f01c2648d1f8ab61d93b9056e4f4c1a1b-hehe.jpg', 1, 0),
(22, 'Assalamualaikum', 'Waalaikumusalam', '2018-09-15', '0000-00-00', '0000-00-00', '5a01b19659c202364cfe5e824028e82bbc2ddaff-003-like.png', 0, 0),
(23, 'Operasi Bibir Sumbing', 'PT PHCM mengadakan operasi bibir sumbing gratis', '2018-09-15', '2018-09-21', '2018-09-30', '6677e99eb9d22169043270905b657e799db19485-medical20records.jpg', 1, 1);

-- --------------------------------------------------------

--
-- Table structure for table `teks_berjalan`
--

CREATE TABLE IF NOT EXISTS `teks_berjalan` (
`id` int(11) NOT NULL,
  `teks` text NOT NULL,
  `tanggal` date NOT NULL,
  `status` int(1) NOT NULL,
  `flag` int(1) NOT NULL
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=6 ;

--
-- Dumping data for table `teks_berjalan`
--

INSERT INTO `teks_berjalan` (`id`, `teks`, `tanggal`, `status`, `flag`) VALUES
(1, 'SELAMAT DATANG DI RS PELINDO', '2018-09-01', 1, 0),
(2, 'RS Pelindo Mengadakan Event sunat massal', '2018-09-22', 1, 1),
(5, 'sss', '2018-09-06', 1, 0);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `pengaturan`
--
ALTER TABLE `pengaturan`
 ADD PRIMARY KEY (`id`);

--
-- Indexes for table `slider`
--
ALTER TABLE `slider`
 ADD PRIMARY KEY (`id`);

--
-- Indexes for table `teks_berjalan`
--
ALTER TABLE `teks_berjalan`
 ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `pengaturan`
--
ALTER TABLE `pengaturan`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `slider`
--
ALTER TABLE `slider`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=24;
--
-- AUTO_INCREMENT for table `teks_berjalan`
--
ALTER TABLE `teks_berjalan`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=6;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
