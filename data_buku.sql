-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jan 15, 2024 at 06:42 PM
-- Server version: 10.4.28-MariaDB
-- PHP Version: 8.0.28

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `data_buku`
--

-- --------------------------------------------------------

--
-- Table structure for table `data_buku`
--

CREATE TABLE `data_buku` (
  `id` int(11) NOT NULL,
  `judul_buku` varchar(100) NOT NULL,
  `penulis` varchar(100) NOT NULL,
  `penerbit` varchar(100) NOT NULL,
  `tanggal_terbit` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `data_buku`
--

INSERT INTO `data_buku` (`id`, `judul_buku`, `penulis`, `penerbit`, `tanggal_terbit`) VALUES
(1, 'laskar Pelangi', 'Andrea Hirata', 'Bentang Pustaka', '2005-01-24'),
(2, 'Dear Nathan', 'Erisca Febriani', 'Bukune', '2015-01-15'),
(3, 'Rindu', 'Tere Liye', 'Gramedia Pustaka Utama', '2015-06-13'),
(4, 'AADC: Ada Apa Dengan Cinta?', 'Dyan Nuranindya', 'Gagas Media', '2014-01-11'),
(5, 'Dilan', 'Pidi Baiq', 'Pastel Books', '2014-04-25'),
(6, 'Critical Eleven', 'Ika Natassa', 'Gramedia Pustaka Utama', '2015-08-16'),
(7, 'Aftershock', 'Winna Efendi', 'Gagas Media', '2011-09-25'),
(8, 'Filosofi Kopi', 'Dee Lestari', 'Bentang Pustaka', '2015-01-29'),
(9, 'My Stupid Boss', 'Chaos@Work', 'PT Gramedia Pustaka Utama', '2014-08-14'),
(10, 'Marmut Merah Jambu', 'Raditya Dika', 'Gagas Media', '2010-04-07'),
(11, 'Bumi', 'Tere Liye', 'PT Gramedia Pustaka Utama', '2011-03-17'),
(12, 'Garis Waktu', 'Fiersa Besari', 'MediaKita', '2016-01-07'),
(13, 'Antologi Rasa', 'Ika Natassa', 'Gramedia Pustaka Utama', '2011-05-08'),
(14, 'Madre', 'Dee Lestari', 'Bentang Pustaka', '2011-08-07'),
(15, 'One Day', 'David Nicholls', 'Gramedia Pustaka Utama', '2011-09-04'),
(16, 'Dua Garis Biru', 'Gina S. Noer', 'Gagas Media', '2011-08-04'),
(17, 'Hujan', 'Tere Liye', 'Gramedia Pustaka Utama', '2014-01-17'),
(18, 'Bintang (Stars)', 'Sitta Karina', 'Gagas Media', '2010-01-04'),
(19, 'I For You', 'Orizuka', 'Gagas Media', '2015-02-11'),
(20, 'Heart(hati)', 'Tere Liye', 'Gramedia Pustaka Utama', '2011-01-08');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `data_buku`
--
ALTER TABLE `data_buku`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `data_buku`
--
ALTER TABLE `data_buku`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
