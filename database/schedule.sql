-- phpMyAdmin SQL Dump (Updated)
-- BULAN K3 NASIONAL 2026 - Mini Soccer Tournament Schedule
-- Generated: Feb 12, 2026

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `bulan_k3_2026`
--

-- --------------------------------------------------------

--
-- Table structure for table `schedule`
--

CREATE TABLE `schedule` (
  `id` int(11) NOT NULL AUTO_INCREMENT PRIMARY KEY,
  `team_home_id` int(11) NOT NULL COMMENT 'ID tim tuan rumah',
  `team_away_id` int(11) NOT NULL COMMENT 'ID tim tamu',
  `match_date` date NOT NULL COMMENT 'Tanggal pertandingan',
  `match_time` time NOT NULL COMMENT 'Waktu pertandingan',
  `week_number` int(11) NOT NULL DEFAULT 1 COMMENT 'Minggu ke berapa',
  `match_status` enum('scheduled','ongoing','finished') DEFAULT 'scheduled' COMMENT 'Status pertandingan',
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  FOREIGN KEY (team_home_id) REFERENCES teams(id) ON DELETE CASCADE,
  FOREIGN KEY (team_away_id) REFERENCES teams(id) ON DELETE CASCADE,
  KEY `team_home_id` (`team_home_id`),
  KEY `team_away_id` (`team_away_id`),
  KEY `idx_match_date` (`match_date`),
  KEY `idx_week_number` (`week_number`),
  KEY `idx_match_status` (`match_status`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Clearing old schedule data
--

TRUNCATE TABLE `schedule`;

--
-- Dumping data for table `schedule`
--

INSERT INTO `schedule` (`team_home_id`, `team_away_id`, `match_date`, `match_time`, `week_number`, `match_status`, `created_at`, `updated_at`) VALUES

-- WEEK 1: 21 Jan 2026
-- GRUP A (ACCT-PPIC vs LAMINASI)
((SELECT id FROM teams WHERE team_code='ppic'), (SELECT id FROM teams WHERE team_code='laminasi'), '2026-01-21', '19:00:00', 1, 'scheduled', '2026-02-11 09:41:32', '2026-02-11 09:41:32'),
-- GRUP C (SECURITY vs WAREHOUSE)
((SELECT id FROM teams WHERE team_code='security'), (SELECT id FROM teams WHERE team_code='warehouse'), '2026-01-21', '19:00:00', 1, 'scheduled', '2026-02-11 09:41:32', '2026-02-11 09:41:32'),

-- WEEK 2: 28 Jan 2026
-- GRUP B (SUPPORTING vs HR)
((SELECT id FROM teams WHERE team_code='supporting'), (SELECT id FROM teams WHERE team_code='hr'), '2026-01-28', '19:00:00', 2, 'scheduled', '2026-02-11 09:41:32', '2026-02-11 09:41:32'),
-- GRUP D (QC vs BTP)
((SELECT id FROM teams WHERE team_code='quality'), (SELECT id FROM teams WHERE team_code='btp'), '2026-01-28', '19:00:00', 2, 'scheduled', '2026-02-11 09:41:32', '2026-02-11 09:41:32'),

-- WEEK 3: 04 Feb 2026
-- GRUP A (TEKNIK vs LAMINASI)
((SELECT id FROM teams WHERE team_code='teknik'), (SELECT id FROM teams WHERE team_code='laminasi'), '2026-02-04', '19:00:00', 3, 'scheduled', '2026-02-11 09:41:32', '2026-02-11 09:41:32'),
-- GRUP C (PRINTING vs SECURITY)
((SELECT id FROM teams WHERE team_code='printing'), (SELECT id FROM teams WHERE team_code='security'), '2026-02-04', '19:00:00', 3, 'scheduled', '2026-02-11 09:41:32', '2026-02-11 09:41:32'),

-- WEEK 4: 11 Feb 2026
-- GRUP B (SLITTER vs SUPPORTING)
((SELECT id FROM teams WHERE team_code='slitter'), (SELECT id FROM teams WHERE team_code='supporting'), '2026-02-11', '19:00:00', 4, 'scheduled', '2026-02-11 09:41:32', '2026-02-11 09:41:32'),
-- GRUP D (PUK vs QC)
((SELECT id FROM teams WHERE team_code='puk'), (SELECT id FROM teams WHERE team_code='quality'), '2026-02-11', '19:00:00', 4, 'scheduled', '2026-02-11 09:41:32', '2026-02-11 09:41:32'),

-- WEEK 5: 18 Feb 2026 (Puasa)
-- GRUP A (TEKNIK vs ACCT-PPIC)
((SELECT id FROM teams WHERE team_code='teknik'), (SELECT id FROM teams WHERE team_code='ppic'), '2026-02-18', '19:00:00', 5, 'scheduled', '2026-02-11 09:41:32', '2026-02-11 09:41:32'),
-- GRUP C (WAREHOUSE vs PRINTING)
((SELECT id FROM teams WHERE team_code='warehouse'), (SELECT id FROM teams WHERE team_code='printing'), '2026-02-18', '19:00:00', 5, 'scheduled', '2026-02-11 09:41:32', '2026-02-11 09:41:32'),
-- GRUP B (SLITTER vs HR)
((SELECT id FROM teams WHERE team_code='slitter'), (SELECT id FROM teams WHERE team_code='hr'), '2026-02-18', '19:00:00', 5, 'scheduled', '2026-02-11 09:41:32', '2026-02-11 09:41:32'),
-- GRUP D (BTP vs PUK)
((SELECT id FROM teams WHERE team_code='btp'), (SELECT id FROM teams WHERE team_code='puk'), '2026-02-18', '19:00:00', 5, 'scheduled', '2026-02-11 09:41:32', '2026-02-11 09:41:32'),

-- WEEK 6: 25 Feb 2026 (SEMIFINAL - Placeholder)
((SELECT id FROM teams WHERE team_code='laminasi'), (SELECT id FROM teams WHERE team_code='printing'), '2026-02-25', '18:00:00', 6, 'scheduled', '2026-02-11 09:41:32', '2026-02-11 09:41:32'),
((SELECT id FROM teams WHERE team_code='warehouse'), (SELECT id FROM teams WHERE team_code='btp'), '2026-02-25', '20:00:00', 6, 'scheduled', '2026-02-11 09:41:32', '2026-02-11 09:41:32'),

-- WEEK 7: 04 Mar 2026 (THIRD PLACE & FINAL - Placeholder)
((SELECT id FROM teams WHERE team_code='teknik'), (SELECT id FROM teams WHERE team_code='supporting'), '2026-03-04', '18:00:00', 7, 'scheduled', '2026-02-11 09:41:32', '2026-02-11 09:41:32'),
((SELECT id FROM teams WHERE team_code='laminasi'), (SELECT id FROM teams WHERE team_code='btp'), '2026-03-04', '20:00:00', 7, 'scheduled', '2026-02-11 09:41:32', '2026-02-11 09:41:32');

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
-- AUTO_INCREMENT for table `schedule`
--
ALTER TABLE `schedule`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
