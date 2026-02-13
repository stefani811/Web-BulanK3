-- phpMyAdmin SQL Dump
-- version 4.9.0.1
-- https://www.phpmyadmin.net/
--
-- Host: sql306.byetcluster.com
-- Generation Time: Feb 12, 2026 at 01:43 AM
-- Server version: 11.4.10-MariaDB
-- PHP Version: 7.2.22

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `if0_41118739_bulank3`
--

-- --------------------------------------------------------

--
-- Table structure for table `event_info`
--

CREATE TABLE `event_info` (
  `id` int(11) NOT NULL,
  `event_title` varchar(255) NOT NULL DEFAULT 'BULAN K3 NASIONAL',
  `event_year` int(11) NOT NULL DEFAULT 2026,
  `event_vision` text DEFAULT NULL COMMENT 'Visi event',
  `event_description` text DEFAULT NULL COMMENT 'Deskripsi event',
  `about_k3` text DEFAULT NULL COMMENT 'Penjelasan tentang Bulan K3',
  `event_purpose` text DEFAULT NULL COMMENT 'Tujuan diadakan event',
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `event_info`
--

INSERT INTO `event_info` (`id`, `event_title`, `event_year`, `event_vision`, `event_description`, `about_k3`, `event_purpose`, `created_at`, `updated_at`) VALUES
(1, 'BULAN K3 NASIONAL', 2026, 'Membangun Ekosistem Pengelolaan K3 Nasional yang Profesional, Andal, dan Kolaboratif', 'Bulan K3 Nasional 2026 adalah event tahunan yang diselenggarakan untuk meningkatkan kesadaran dan pemahaman tentang Keselamatan dan Kesehatan Kerja (K3) di seluruh Indonesia. Event ini diisi dengan berbagai kegiatan termasuk turnamen mini soccer antar divisi.', 'Bulan K3 (Keselamatan dan Kesehatan Kerja) Nasional adalah program tahunan yang dicanangkan oleh pemerintah Indonesia untuk meningkatkan kesadaran dan komitmen seluruh lapisan masyarakat, khususnya dunia kerja, terhadap pentingnya penerapan K3. Program ini bertujuan untuk menciptakan budaya keselamatan dan kesehatan kerja yang berkelanjutan di seluruh sektor industri dan organisasi di Indonesia.', 'Tujuan utama diadakan event Bulan K3 Nasional 2026 ini adalah:\n1. Meningkatkan kesadaran dan pemahaman tentang pentingnya K3 di tempat kerja\n2. Membangun budaya keselamatan yang kuat di seluruh organisasi\n3. Meningkatkan kolaborasi antar divisi melalui kegiatan olahraga\n4. Meningkatkan semangat kebersamaan dan kerja tim\n5. Mempromosikan gaya hidup sehat melalui olahraga\n6. Memberikan edukasi tentang K3 melalui kegiatan yang menyenangkan dan interaktif', '2026-02-05 05:10:32', '2026-02-05 05:10:32');

-- --------------------------------------------------------

--
-- Table structure for table `matches`
--

CREATE TABLE `matches` (
  `id` int(11) NOT NULL,
  `team_home_id` int(11) NOT NULL COMMENT 'ID tim tuan rumah',
  `team_away_id` int(11) NOT NULL COMMENT 'ID tim tamu',
  `score_home` int(11) DEFAULT 0 COMMENT 'Skor tim tuan rumah',
  `score_away` int(11) DEFAULT 0 COMMENT 'Skor tim tamu',
  `match_date` datetime DEFAULT NULL COMMENT 'Tanggal dan waktu pertandingan',
  `match_status` enum('scheduled','ongoing','finished') DEFAULT 'finished' COMMENT 'Status pertandingan',
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `matches`
--

INSERT INTO `matches` (`id`, `team_home_id`, `team_away_id`, `score_home`, `score_away`, `match_date`, `match_status`, `created_at`, `updated_at`) VALUES
(1, 42, 43, 3, 0, '2026-01-21 19:00:00', 'finished', '2026-02-11 09:08:49', '2026-02-11 09:19:48'),
(2, 48, 52, 2, 1, '2026-01-21 19:00:00', 'finished', '2026-02-11 09:08:49', '2026-02-11 09:08:49'),
(3, 45, 50, 2, 1, '2026-01-28 19:00:00', 'finished', '2026-02-11 09:08:49', '2026-02-11 09:20:24'),
(4, 2, 41, 2, 1, '2026-01-28 19:00:00', 'finished', '2026-02-11 09:08:49', '2026-02-11 09:14:41'),
(5, 41, 47, 2, 1, '2026-02-04 19:00:00', 'finished', '2026-02-11 09:08:49', '2026-02-11 09:21:07'),
(6, 44, 48, 7, 1, '2026-02-05 19:00:00', 'finished', '2026-02-11 09:21:27', '2026-02-11 09:22:13'),
(7, 42, 51, 7, 1, '2026-02-05 19:00:00', 'finished', '2026-02-11 09:22:15', '2026-02-11 09:22:39'),
(8, 46, 47, 0, 0, '2026-02-11 19:00:00', 'ongoing', '2026-02-11 09:23:46', '2026-02-11 09:24:03');

-- --------------------------------------------------------

--
-- Table structure for table `players`
--

CREATE TABLE `players` (
  `id` int(11) NOT NULL,
  `team_id` int(11) NOT NULL,
  `player_name` varchar(255) NOT NULL,
  `player_number` int(11) DEFAULT NULL,
  `position` varchar(50) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `players`
--

INSERT INTO `players` (`id`, `team_id`, `player_name`, `player_number`, `position`, `created_at`, `updated_at`) VALUES
(1, 42, 'Adnan Firdaus', 1, NULL, '2026-02-12 02:47:49', '2026-02-12 02:49:06'),
(2, 42, 'Rizky Awaldy Putra', 2, NULL, '2026-02-12 02:47:49', '2026-02-12 02:47:49'),
(3, 42, 'Yusron Arifin', 3, NULL, '2026-02-12 02:47:49', '2026-02-12 02:47:49'),
(4, 42, 'Dimas Fathul Munir', 4, NULL, '2026-02-12 02:47:49', '2026-02-12 02:47:49'),
(5, 42, 'Budi Aryanto', 5, NULL, '2026-02-12 02:47:49', '2026-02-12 02:47:49'),
(6, 42, 'Pando Dewantoro', 6, NULL, '2026-02-12 02:47:49', '2026-02-12 02:47:49'),
(7, 42, 'Ferudin', 7, NULL, '2026-02-12 02:47:49', '2026-02-12 02:47:49'),
(8, 42, 'Feri Ferdiansyah', 8, NULL, '2026-02-12 02:47:49', '2026-02-12 02:47:49'),
(9, 42, 'Ferry Oktaviano Putra', 9, NULL, '2026-02-12 02:47:49', '2026-02-12 02:47:49'),
(10, 42, 'Warih', 10, NULL, '2026-02-12 02:47:49', '2026-02-12 02:47:49'),
(11, 42, 'Rismanto', 11, NULL, '2026-02-12 02:47:49', '2026-02-12 02:47:49'),
(12, 42, 'Suryaman', 12, NULL, '2026-02-12 02:47:49', '2026-02-12 02:47:49'),
(13, 42, 'Agoeng Febriansyah', 13, NULL, '2026-02-12 02:47:49', '2026-02-12 02:47:49'),
(14, 42, 'Ridwan Indrawan', 14, NULL, '2026-02-12 02:47:49', '2026-02-12 02:47:49'),
(15, 42, 'Dadan Garusalam', 15, NULL, '2026-02-12 02:47:49', '2026-02-12 02:47:49'),
(16, 42, 'Dodi Ariaji', 16, NULL, '2026-02-12 02:47:49', '2026-02-12 02:47:49'),
(17, 42, 'Deni Bahtiar', 17, NULL, '2026-02-12 02:47:49', '2026-02-12 02:47:49'),
(18, 43, 'Hendrik Hermawan', 1, NULL, '2026-02-12 02:47:49', '2026-02-12 02:47:49'),
(19, 43, 'Fahman Fauzi', 2, NULL, '2026-02-12 02:47:49', '2026-02-12 02:47:49'),
(20, 45, 'Argha Elton S', 1, NULL, '2026-02-12 02:47:49', '2026-02-12 02:47:49'),
(21, 45, 'Dea Iswandi', 2, NULL, '2026-02-12 02:47:49', '2026-02-12 02:47:49'),
(22, 45, 'Suhendar', 3, NULL, '2026-02-12 02:47:49', '2026-02-12 02:47:49'),
(23, 45, 'Pebriyanto', 4, NULL, '2026-02-12 02:47:49', '2026-02-12 02:47:49'),
(24, 52, 'Asep Maulana', 1, NULL, '2026-02-12 02:47:49', '2026-02-12 02:47:49'),
(25, 52, 'Rizki Aitollah', 2, NULL, '2026-02-12 02:47:49', '2026-02-12 02:47:49'),
(26, 52, 'Diaz Nur Davin', 3, NULL, '2026-02-12 02:47:49', '2026-02-12 02:47:49'),
(27, 52, 'Ilham Lutiansyah', 4, NULL, '2026-02-12 02:47:49', '2026-02-12 02:47:49'),
(28, 52, 'Kodri', 5, NULL, '2026-02-12 02:47:49', '2026-02-12 02:47:49'),
(29, 52, 'Agung Sanjani', 6, NULL, '2026-02-12 02:47:49', '2026-02-12 02:47:49'),
(30, 52, 'Sarwani', 7, NULL, '2026-02-12 02:47:49', '2026-02-12 02:47:49'),
(31, 52, 'Tomi', 8, NULL, '2026-02-12 02:47:49', '2026-02-12 02:47:49'),
(32, 52, 'Arif Firmansyah', 9, NULL, '2026-02-12 02:47:49', '2026-02-12 02:47:49'),
(33, 52, 'Dian Hidayat', 10, NULL, '2026-02-12 02:47:49', '2026-02-12 02:47:49'),
(34, 52, 'Mudi', 11, NULL, '2026-02-12 02:47:49', '2026-02-12 02:47:49'),
(35, 52, 'Vika Rochmawan', 12, NULL, '2026-02-12 02:47:49', '2026-02-12 02:47:49'),
(36, 52, 'Windi Andriana', 13, NULL, '2026-02-12 02:47:49', '2026-02-12 02:47:49'),
(37, 52, 'Adry Hasan', 14, NULL, '2026-02-12 02:47:49', '2026-02-12 02:47:49'),
(38, 52, 'Andhika Pranaditya', 15, NULL, '2026-02-12 02:47:49', '2026-02-12 02:47:49'),
(39, 47, 'Dimas Suryana', 1, NULL, '2026-02-12 02:47:49', '2026-02-12 03:13:28'),
(40, 47, 'Bahrun Supriyadi', 2, NULL, '2026-02-12 02:47:49', '2026-02-12 03:13:28'),
(41, 47, 'Ahmad Rijalul Arifin', 3, NULL, '2026-02-12 02:47:49', '2026-02-12 03:13:28'),
(42, 47, 'Agri Priyambudi', 4, NULL, '2026-02-12 02:47:49', '2026-02-12 03:13:28'),
(43, 47, 'Huseini Muji', 5, NULL, '2026-02-12 02:47:49', '2026-02-12 03:13:28'),
(44, 47, 'Gian Vembana', 6, NULL, '2026-02-12 02:47:49', '2026-02-12 03:13:28'),
(45, 47, 'Fani Nur Rahman', 7, NULL, '2026-02-12 02:47:49', '2026-02-12 03:13:28'),
(46, 47, 'Maman Lukman', 8, NULL, '2026-02-12 02:47:49', '2026-02-12 03:13:28'),
(47, 47, 'Moh Yuda', 9, NULL, '2026-02-12 02:47:49', '2026-02-12 03:13:28'),
(48, 47, 'Syarip Hidayat', 10, NULL, '2026-02-12 02:47:49', '2026-02-12 03:13:28'),
(49, 47, 'Daffa', 11, NULL, '2026-02-12 02:47:49', '2026-02-12 03:13:28'),
(50, 47, 'Sul Assari', 12, NULL, '2026-02-12 02:47:49', '2026-02-12 03:13:28'),
(51, 47, 'Tri Dwiyono', 13, NULL, '2026-02-12 02:47:49', '2026-02-12 03:13:28'),
(52, 49, 'Zio Erianda', 1, NULL, '2026-02-12 02:47:49', '2026-02-12 02:47:49'),
(53, 49, 'Iskandar', 2, NULL, '2026-02-12 02:47:49', '2026-02-12 02:47:49'),
(54, 49, 'Supriyatna', 3, NULL, '2026-02-12 02:47:49', '2026-02-12 02:47:49'),
(55, 49, 'Johan Ronaldo Purba', 4, NULL, '2026-02-12 02:47:49', '2026-02-12 02:47:49'),
(56, 49, 'Januar Ishak', 5, NULL, '2026-02-12 02:47:49', '2026-02-12 02:47:49'),
(57, 49, 'M. Akbar Riyadi', 6, NULL, '2026-02-12 02:47:49', '2026-02-12 02:47:49'),
(58, 49, 'Naufal Rifky Ananda', 7, NULL, '2026-02-12 02:47:49', '2026-02-12 02:47:49'),
(59, 49, 'Suhendi', 8, NULL, '2026-02-12 02:47:49', '2026-02-12 02:47:49'),
(60, 49, 'Muslim Konde', 9, NULL, '2026-02-12 02:47:49', '2026-02-12 02:47:49'),
(61, 49, 'Sandi Novian', 10, NULL, '2026-02-12 02:47:49', '2026-02-12 02:47:49'),
(62, 49, 'Nuryadi', 11, NULL, '2026-02-12 02:47:49', '2026-02-12 02:47:49'),
(63, 49, 'Jumadi B', 12, NULL, '2026-02-12 02:47:49', '2026-02-12 02:47:49'),
(64, 49, 'Deri Nugraha', 13, NULL, '2026-02-12 02:47:49', '2026-02-12 02:47:49'),
(65, 49, 'Anugerah Eko', 14, NULL, '2026-02-12 02:47:49', '2026-02-12 02:47:49'),
(66, 49, 'Samsul Bukhori', 15, NULL, '2026-02-12 02:47:49', '2026-02-12 02:47:49'),
(67, 49, 'Putra Saktiantoro', 16, NULL, '2026-02-12 02:47:49', '2026-02-12 02:47:49'),
(68, 49, 'Marupi', 17, NULL, '2026-02-12 02:47:49', '2026-02-12 02:47:49'),
(69, 49, 'Kartono', 18, NULL, '2026-02-12 02:47:49', '2026-02-12 02:47:49'),
(70, 49, 'M. Nur Alief', 19, NULL, '2026-02-12 02:47:49', '2026-02-12 02:47:49'),
(71, 49, 'Wansisco Nesta', 20, NULL, '2026-02-12 02:47:49', '2026-02-12 02:47:49'),
(72, 49, 'M. Baharudinshyah', 21, NULL, '2026-02-12 02:47:49', '2026-02-12 02:47:49'),
(73, 49, 'Mat Yudi', 22, NULL, '2026-02-12 02:47:49', '2026-02-12 02:47:49'),
(74, 49, 'Romelan', 23, NULL, '2026-02-12 02:47:49', '2026-02-12 02:47:49'),
(75, 49, 'Juhana', 24, NULL, '2026-02-12 02:47:49', '2026-02-12 02:47:49'),
(76, 49, 'Rizal Faiz', 25, NULL, '2026-02-12 02:47:49', '2026-02-12 02:47:49'),
(77, 49, 'Irfan Alfa', 26, NULL, '2026-02-12 02:47:49', '2026-02-12 02:47:49'),
(78, 49, 'Dudi Setiadi', 27, NULL, '2026-02-12 02:47:49', '2026-02-12 02:47:49'),
(79, 44, 'Masturo', 1, NULL, '2026-02-12 02:47:49', '2026-02-12 02:47:49'),
(80, 44, 'Nurwenda', 2, NULL, '2026-02-12 02:47:49', '2026-02-12 02:47:49'),
(81, 44, 'Ahmad Sanwari', 3, NULL, '2026-02-12 02:47:49', '2026-02-12 02:47:49'),
(82, 44, 'Ryan Herdiansyah', 4, NULL, '2026-02-12 02:47:49', '2026-02-12 02:47:49'),
(83, 44, 'Hilman Filani', 5, NULL, '2026-02-12 02:47:49', '2026-02-12 02:47:49'),
(84, 44, 'Yosef Warsono', 6, NULL, '2026-02-12 02:47:49', '2026-02-12 02:47:49'),
(85, 44, 'Towel Hamdalah', 7, NULL, '2026-02-12 02:47:49', '2026-02-12 02:47:49'),
(86, 44, 'Rubi Ismanto', 8, NULL, '2026-02-12 02:47:49', '2026-02-12 02:47:49'),
(87, 44, 'Agus Kurnia', 9, NULL, '2026-02-12 02:47:49', '2026-02-12 02:47:49'),
(88, 44, 'Roby Alamsyah', 10, NULL, '2026-02-12 02:47:49', '2026-02-12 02:47:49'),
(89, 44, 'Cornelis Franki', 11, NULL, '2026-02-12 02:47:49', '2026-02-12 02:47:49'),
(90, 44, 'Irfan Rolidin', 12, NULL, '2026-02-12 02:47:49', '2026-02-12 02:47:49'),
(91, 44, 'Ahmad Faisal', 13, NULL, '2026-02-12 02:47:49', '2026-02-12 02:47:49'),
(92, 44, 'Muhammad Usiadi', 14, NULL, '2026-02-12 02:47:49', '2026-02-12 02:47:49'),
(93, 44, 'Muhammad Naufal Ilhamsyah', 15, NULL, '2026-02-12 02:47:49', '2026-02-12 02:47:49'),
(94, 44, 'Rudi Romansyah', 16, NULL, '2026-02-12 02:47:49', '2026-02-12 02:47:49'),
(95, 44, 'Hafizh Kurniawan Soedick', 17, NULL, '2026-02-12 02:47:49', '2026-02-12 02:47:49'),
(96, 44, 'Rafael Djikstra Natipupulu', 18, NULL, '2026-02-12 02:47:49', '2026-02-12 02:47:49'),
(97, 44, 'Ahmad Sanusi', 19, NULL, '2026-02-12 02:47:49', '2026-02-12 02:47:49'),
(98, 44, 'Iswadi Idris', 20, NULL, '2026-02-12 02:47:49', '2026-02-12 02:47:49'),
(99, 44, 'Ahmad Fauzan', 21, NULL, '2026-02-12 02:47:49', '2026-02-12 02:47:49'),
(100, 44, 'Galang Djanuradi Susanto', 22, NULL, '2026-02-12 02:47:49', '2026-02-12 02:47:49'),
(101, 44, 'Prima Bayu Martin Lian', 23, NULL, '2026-02-12 02:47:49', '2026-02-12 02:47:49'),
(102, 44, 'Ahmad Japar Sidik', 24, NULL, '2026-02-12 02:47:49', '2026-02-12 02:47:49'),
(103, 50, 'Pendi Editiya', 1, NULL, '2026-02-12 02:47:49', '2026-02-12 02:47:49'),
(104, 50, 'Ahmad Farisi Ilal Maulana', 2, NULL, '2026-02-12 02:47:49', '2026-02-12 02:47:49'),
(105, 50, 'Deni Eri Pratama', 3, NULL, '2026-02-12 02:47:49', '2026-02-12 02:47:49'),
(106, 50, 'Deny Rafdi Firmansyah', 4, NULL, '2026-02-12 02:47:49', '2026-02-12 02:47:49'),
(107, 50, 'Sahid Abdul Rochman', 5, NULL, '2026-02-12 02:47:49', '2026-02-12 02:47:49'),
(108, 50, 'Abdul Aziz', 6, NULL, '2026-02-12 02:47:49', '2026-02-12 02:47:49'),
(109, 50, 'Ivan Adhitya Ramadhan', 7, NULL, '2026-02-12 02:47:49', '2026-02-12 02:47:49'),
(110, 50, 'Heri Romadi', 8, NULL, '2026-02-12 02:47:49', '2026-02-12 02:47:49'),
(111, 50, 'Muhammad Ilyas', 9, NULL, '2026-02-12 02:47:49', '2026-02-12 02:47:49'),
(112, 50, 'Sonhaji', 10, NULL, '2026-02-12 02:47:49', '2026-02-12 02:47:49'),
(113, 51, 'Ladislaus Risangpaiar', 1, NULL, '2026-02-12 02:47:49', '2026-02-12 02:47:49'),
(114, 51, 'Banjar Andi Malo Sitorus', 2, NULL, '2026-02-12 02:47:49', '2026-02-12 02:47:49'),
(115, 51, 'Ditra Ikhsanulhaqi Suryadi', 3, NULL, '2026-02-12 02:47:49', '2026-02-12 02:47:49'),
(116, 51, 'Rizky Priyambudi', 4, NULL, '2026-02-12 02:47:49', '2026-02-12 02:47:49'),
(117, 51, 'Hadi Junaedi', 5, NULL, '2026-02-12 02:47:49', '2026-02-12 02:47:49'),
(118, 51, 'Ardhanji Fiqri Abdilah', 6, NULL, '2026-02-12 02:47:49', '2026-02-12 02:47:49'),
(119, 51, 'Doni Febrian Mulyana', 7, NULL, '2026-02-12 02:47:49', '2026-02-12 02:47:49'),
(120, 51, 'Khamdani Pratama', 8, NULL, '2026-02-12 02:47:49', '2026-02-12 02:47:49'),
(121, 51, 'Muhammad Sandy Soufian', 9, NULL, '2026-02-12 02:47:49', '2026-02-12 02:47:49'),
(122, 51, 'Farhan Hakiki', 10, NULL, '2026-02-12 02:47:49', '2026-02-12 02:47:49'),
(123, 51, 'Rifky Azhar Pradipa', 11, NULL, '2026-02-12 02:47:49', '2026-02-12 02:47:49'),
(124, 51, 'Ardi Prayoga', 12, NULL, '2026-02-12 02:47:49', '2026-02-12 02:47:49'),
(125, 41, 'M. Renaldi', 1, NULL, '2026-02-12 02:47:49', '2026-02-12 02:47:49'),
(126, 41, 'Fahri A', 2, NULL, '2026-02-12 02:47:49', '2026-02-12 02:47:49'),
(127, 41, 'Fawaji', 3, NULL, '2026-02-12 02:47:49', '2026-02-12 02:47:49'),
(128, 41, 'Faiz N H', 4, NULL, '2026-02-12 02:47:49', '2026-02-12 02:47:49'),
(129, 41, 'Angga F', 5, NULL, '2026-02-12 02:47:49', '2026-02-12 02:47:49'),
(130, 41, 'Hanip', 6, NULL, '2026-02-12 02:47:49', '2026-02-12 02:47:49'),
(131, 41, 'Faujan', 7, NULL, '2026-02-12 02:47:49', '2026-02-12 02:47:49'),
(132, 41, 'Rifky', 8, NULL, '2026-02-12 02:47:49', '2026-02-12 02:47:49'),
(133, 41, 'Ade A', 9, NULL, '2026-02-12 02:47:49', '2026-02-12 02:47:49'),
(134, 53, 'Rendra Rediantoni', 1, NULL, '2026-02-12 03:14:49', '2026-02-12 03:14:49'),
(135, 53, 'Ilyasa Arsingih Putro', 2, NULL, '2026-02-12 03:14:49', '2026-02-12 03:14:49'),
(136, 53, 'Ahmad Isa Habibulloh', 3, NULL, '2026-02-12 03:14:49', '2026-02-12 03:14:49'),
(137, 55, 'Faiz Erlangga', 1, NULL, '2026-02-12 03:16:43', '2026-02-12 03:16:43'),
(138, 55, 'Raden Hanif', 2, NULL, '2026-02-12 03:16:43', '2026-02-12 03:16:43'),
(139, 54, 'Heri Ramandus G', 1, NULL, '2026-02-12 03:16:43', '2026-02-12 03:16:43'),
(140, 57, 'Erwin Irawan', 1, NULL, '2026-02-12 03:16:56', '2026-02-12 03:16:56');

-- --------------------------------------------------------

--
-- Table structure for table `schedule`
--

CREATE TABLE `schedule` (
  `id` int(11) NOT NULL,
  `team_home_id` int(11) NOT NULL COMMENT 'ID tim tuan rumah',
  `team_away_id` int(11) NOT NULL COMMENT 'ID tim tamu',
  `match_date` date NOT NULL COMMENT 'Tanggal pertandingan',
  `match_time` time NOT NULL COMMENT 'Waktu pertandingan',
  `week_number` int(11) NOT NULL DEFAULT 1 COMMENT 'Minggu ke berapa',
  `match_status` enum('scheduled','ongoing','finished') DEFAULT 'scheduled' COMMENT 'Status pertandingan',
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `schedule`
--

INSERT INTO `schedule` (`id`, `team_home_id`, `team_away_id`, `match_date`, `match_time`, `week_number`, `match_status`, `created_at`, `updated_at`) VALUES
(8, 43, 42, '2026-01-21', '19:00:00', 1, 'scheduled', '2026-02-11 09:41:32', '2026-02-11 09:41:32'),
(9, 48, 52, '2026-01-21', '19:00:00', 1, 'scheduled', '2026-02-11 09:41:32', '2026-02-11 09:41:32'),
(10, 50, 45, '2026-01-28', '19:00:00', 2, 'scheduled', '2026-02-11 09:41:32', '2026-02-11 09:41:32'),
(11, 56, 41, '2026-01-28', '19:00:00', 2, 'scheduled', '2026-02-11 09:41:32', '2026-02-11 09:41:32'),
(12, 51, 42, '2026-02-04', '19:00:00', 3, 'scheduled', '2026-02-11 09:41:32', '2026-02-11 09:41:32'),
(13, 44, 48, '2026-02-04', '19:00:00', 3, 'scheduled', '2026-02-11 09:41:32', '2026-02-11 09:41:32'),
(14, 49, 50, '2026-02-11', '19:00:00', 4, 'scheduled', '2026-02-11 09:41:32', '2026-02-11 09:41:32'),
(15, 46, 56, '2026-02-11', '19:00:00', 4, 'scheduled', '2026-02-11 09:41:32', '2026-02-11 09:41:32'),
(16, 51, 43, '2026-02-18', '19:00:00', 5, 'scheduled', '2026-02-11 09:41:32', '2026-02-11 09:41:32'),
(17, 52, 44, '2026-02-18', '19:00:00', 5, 'scheduled', '2026-02-11 09:41:32', '2026-02-11 09:41:32'),
(18, 49, 45, '2026-02-18', '19:00:00', 5, 'scheduled', '2026-02-11 09:41:32', '2026-02-11 09:41:32'),
(19, 41, 46, '2026-02-18', '19:00:00', 5, 'scheduled', '2026-02-11 09:41:32', '2026-02-11 09:41:32');

-- --------------------------------------------------------

--
-- Table structure for table `teams`
--

CREATE TABLE `teams` (
  `id` int(11) NOT NULL,
  `team_code` varchar(50) NOT NULL COMMENT 'Kode unik tim (btp, laminasi, ppic, dll)',
  `team_name` varchar(255) NOT NULL COMMENT 'Nama lengkap tim',
  `team_logo` varchar(255) DEFAULT NULL COMMENT 'Path ke file logo tim',
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `teams`
--

INSERT INTO `teams` (`id`, `team_code`, `team_name`, `team_logo`, `created_at`, `updated_at`) VALUES
(41, 'btp', 'BTP', 'assets/images/team-btp.png', '2026-02-11 08:32:33', '2026-02-11 08:33:49'),
(42, 'laminasi', 'Laminasi', 'assets/images/team-laminasi.png', '2026-02-11 08:32:33', '2026-02-11 08:33:49'),
(43, 'ppic', 'PPIC', 'assets/images/team-ppic.png', '2026-02-11 08:32:33', '2026-02-11 08:33:49'),
(44, 'printing', 'Printing', 'assets/images/FC Printing.png', '2026-02-11 08:32:33', '2026-02-11 08:33:49'),
(45, 'hr', 'HRD', 'assets/images/HR FC.png', '2026-02-11 08:32:33', '2026-02-11 08:33:49'),
(46, 'puk', 'PUK SP PPMI', 'assets/images/PUK SP PPMI.png', '2026-02-11 08:32:33', '2026-02-11 08:32:33'),
(47, 'quality', 'Quality Squad 1991', 'assets/images/Quality Squad 1991.png', '2026-02-11 08:32:33', '2026-02-11 08:32:33'),
(48, 'security', 'Security FC', 'assets/images/Security FC.png', '2026-02-11 08:32:33', '2026-02-11 08:32:33'),
(49, 'slitter', 'Slitter', 'assets/images/Slitter FC.png', '2026-02-11 08:32:33', '2026-02-11 08:33:49'),
(50, 'supporting', 'Supporting', 'assets/images/Supporting Division.png', '2026-02-11 08:32:33', '2026-02-11 08:33:49'),
(51, 'teknik', 'Teknik', 'assets/images/Teknik FC.png', '2026-02-11 08:32:33', '2026-02-11 08:33:49'),
(52, 'warehouse', 'Warehouse', 'assets/images/Warehouse FC.png', '2026-02-11 08:32:33', '2026-02-11 08:33:49'),
(53, 'accounting', 'Accounting', 'assets/images/FC Accounting.png', '2026-02-11 08:33:49', '2026-02-12 04:20:57'),
(54, 'it', 'Information Technology', 'assets/images/IT FC.png', '2026-02-11 08:33:49', '2026-02-12 04:22:15'),
(55, 'hse', 'HSE', 'assets/images/HSE FC.png', '2026-02-11 08:33:49', '2026-02-12 04:22:59'),
(56, 'qc', 'QC', NULL, '2026-02-11 08:33:49', '2026-02-11 08:33:49'),
(57, 'rewinder', 'Rewinder', 'assets/images/Rewinder FC.png', '2026-02-11 08:33:49', '2026-02-12 04:23:11');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `event_info`
--
ALTER TABLE `event_info`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `matches`
--
ALTER TABLE `matches`
  ADD PRIMARY KEY (`id`),
  ADD KEY `team_home_id` (`team_home_id`),
  ADD KEY `team_away_id` (`team_away_id`),
  ADD KEY `idx_match_date` (`match_date`),
  ADD KEY `idx_match_status` (`match_status`);

--
-- Indexes for table `players`
--
ALTER TABLE `players`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_team_id` (`team_id`),
  ADD KEY `idx_player_number` (`player_number`);

--
-- Indexes for table `schedule`
--
ALTER TABLE `schedule`
  ADD PRIMARY KEY (`id`),
  ADD KEY `team_home_id` (`team_home_id`),
  ADD KEY `team_away_id` (`team_away_id`),
  ADD KEY `idx_match_date` (`match_date`),
  ADD KEY `idx_week_number` (`week_number`),
  ADD KEY `idx_match_status` (`match_status`);

--
-- Indexes for table `teams`
--
ALTER TABLE `teams`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `team_code` (`team_code`),
  ADD KEY `idx_team_code` (`team_code`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `event_info`
--
ALTER TABLE `event_info`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `matches`
--
ALTER TABLE `matches`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `players`
--
ALTER TABLE `players`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=141;

--
-- AUTO_INCREMENT for table `schedule`
--
ALTER TABLE `schedule`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;

--
-- AUTO_INCREMENT for table `teams`
--
ALTER TABLE `teams`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=67;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `players`
--
ALTER TABLE `players`
  ADD CONSTRAINT `players_ibfk_1` FOREIGN KEY (`team_id`) REFERENCES `teams` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
