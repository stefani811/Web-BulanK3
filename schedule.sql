-- phpMyAdmin SQL Dump
-- version 4.9.0.1
-- https://www.phpmyadmin.net/
--
-- Host: sql306.byetcluster.com
-- Generation Time: Feb 11, 2026 at 11:28 PM
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

--
-- Indexes for dumped tables
--

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
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `schedule`
--
ALTER TABLE `schedule`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
