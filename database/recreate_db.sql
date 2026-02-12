-- Recreate database and sample data for BULAN K3 NASIONAL 2026
-- Run: mysql -u root -p < recreate_db.sql

DROP DATABASE IF EXISTS bulan_k3_2026;
CREATE DATABASE IF NOT EXISTS bulan_k3_2026 CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;
USE bulan_k3_2026;

-- Table: teams
CREATE TABLE IF NOT EXISTS teams (
    id INT AUTO_INCREMENT PRIMARY KEY,
    team_code VARCHAR(50) UNIQUE NOT NULL,
    team_name VARCHAR(255) NOT NULL,
    team_logo VARCHAR(255),
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    INDEX idx_team_code (team_code)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Table: players
CREATE TABLE IF NOT EXISTS players (
    id INT AUTO_INCREMENT PRIMARY KEY,
    team_id INT NOT NULL,
    player_name VARCHAR(255) NOT NULL,
    player_number INT,
    position VARCHAR(50),
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    FOREIGN KEY (team_id) REFERENCES teams(id) ON DELETE CASCADE,
    INDEX idx_team_id (team_id),
    INDEX idx_player_number (player_number)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Table: matches
CREATE TABLE IF NOT EXISTS matches (
    id INT AUTO_INCREMENT PRIMARY KEY,
    team_home_id INT NOT NULL,
    team_away_id INT NOT NULL,
    score_home INT DEFAULT 0,
    score_away INT DEFAULT 0,
    match_date DATETIME,
    match_status ENUM('scheduled', 'ongoing', 'finished') DEFAULT 'finished',
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    FOREIGN KEY (team_home_id) REFERENCES teams(id) ON DELETE CASCADE,
    FOREIGN KEY (team_away_id) REFERENCES teams(id) ON DELETE CASCADE,
    INDEX idx_match_date (match_date),
    INDEX idx_match_status (match_status)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Table: event_info
CREATE TABLE IF NOT EXISTS event_info (
    id INT AUTO_INCREMENT PRIMARY KEY,
    event_title VARCHAR(255) NOT NULL DEFAULT 'BULAN K3 NASIONAL',
    event_year INT NOT NULL DEFAULT 2026,
    event_vision TEXT,
    event_description TEXT,
    about_k3 TEXT,
    event_purpose TEXT,
    background_text TEXT,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Table: schedule
CREATE TABLE IF NOT EXISTS schedule (
    id INT AUTO_INCREMENT PRIMARY KEY,
    team_home_id INT NOT NULL,
    team_away_id INT NOT NULL,
    match_date DATE NOT NULL,
    match_time TIME NOT NULL,
    week_number INT NOT NULL DEFAULT 1,
    match_status ENUM('scheduled', 'ongoing', 'finished') DEFAULT 'scheduled',
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    FOREIGN KEY (team_home_id) REFERENCES teams(id) ON DELETE CASCADE,
    FOREIGN KEY (team_away_id) REFERENCES teams(id) ON DELETE CASCADE,
    INDEX idx_match_date (match_date),
    INDEX idx_week_number (week_number),
    INDEX idx_match_status (match_status)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Insert teams (use team_code values used by the app)
INSERT INTO teams (team_code, team_name, team_logo) VALUES
('btp', 'BTP Packaging - Bina Tunas Mini Soccer', NULL),
('laminasi', 'Laminasi FC', NULL),
('ppic', 'PPIC Accounting Football Club', NULL),
('printing', 'FC Printing', NULL),
('hr', 'HR FC', NULL),
('puk', 'PUK SP PPMI', NULL),
('quality', 'Quality Squad 1991', NULL),
('qc', 'QC', NULL),
('security', 'Security FC', NULL),
('slitter', 'Slitter FC', NULL),
('supporting', 'Supporting Division', NULL),
('teknik', 'Teknik FC', NULL),
('warehouse', 'Warehouse FC', NULL),
('accounting', 'Accounting', NULL),
('it', 'Information Technology', NULL),
('hse', 'HSE', NULL),
('rewinder', 'Rewinder', NULL)
ON DUPLICATE KEY UPDATE team_name = VALUES(team_name);

-- Sample players (from provided lists) — inserts use team_id lookup so they work after team insertion
-- Accounting
INSERT INTO players (team_id, player_name, player_number)
SELECT id, 'Rendra Rediantoni', 1 FROM teams WHERE team_code='accounting';
INSERT INTO players (team_id, player_name, player_number)
SELECT id, 'Ilyasa Arsingih Putro', 2 FROM teams WHERE team_code='accounting';
INSERT INTO players (team_id, player_name, player_number)
SELECT id, 'Ahmad Isa Habibulloh', 3 FROM teams WHERE team_code='accounting';

-- PPIC
INSERT INTO players (team_id, player_name, player_number)
SELECT id, 'Hendrik Hermawan', 1 FROM teams WHERE team_code='ppic';
INSERT INTO players (team_id, player_name, player_number)
SELECT id, 'Fahman Fauzi', 2 FROM teams WHERE team_code='ppic';

-- IT
INSERT INTO players (team_id, player_name, player_number)
SELECT id, 'Heri Ramandus G', 1 FROM teams WHERE team_code='it';

-- Laminasi (multiple)
INSERT INTO players (team_id, player_name, player_number) SELECT id, 'Adnan Firdaus', 1 FROM teams WHERE team_code='laminasi';
INSERT INTO players (team_id, player_name, player_number) SELECT id, 'Rizky Awaldy Putra', 2 FROM teams WHERE team_code='laminasi';
INSERT INTO players (team_id, player_name, player_number) SELECT id, 'Yusron Arifin', 3 FROM teams WHERE team_code='laminasi';
INSERT INTO players (team_id, player_name, player_number) SELECT id, 'Dimas Fathul Munir', 4 FROM teams WHERE team_code='laminasi';
INSERT INTO players (team_id, player_name, player_number) SELECT id, 'Budi Aryanto', 5 FROM teams WHERE team_code='laminasi';
INSERT INTO players (team_id, player_name, player_number) SELECT id, 'Pando Dewantoro', 6 FROM teams WHERE team_code='laminasi';
INSERT INTO players (team_id, player_name, player_number) SELECT id, 'Ferudin', 7 FROM teams WHERE team_code='laminasi';
INSERT INTO players (team_id, player_name, player_number) SELECT id, 'Feri Ferdiansyah', 8 FROM teams WHERE team_code='laminasi';
INSERT INTO players (team_id, player_name, player_number) SELECT id, 'Ferry Oktaviano Putra', 9 FROM teams WHERE team_code='laminasi';
INSERT INTO players (team_id, player_name, player_number) SELECT id, 'Warih', 10 FROM teams WHERE team_code='laminasi';
INSERT INTO players (team_id, player_name, player_number) SELECT id, 'Rismanto', 11 FROM teams WHERE team_code='laminasi';
INSERT INTO players (team_id, player_name, player_number) SELECT id, 'Suryaman', 12 FROM teams WHERE team_code='laminasi';
INSERT INTO players (team_id, player_name, player_number) SELECT id, 'Agoeng Febriansyah', 13 FROM teams WHERE team_code='laminasi';
INSERT INTO players (team_id, player_name, player_number) SELECT id, 'Ridwan Indrawan', 14 FROM teams WHERE team_code='laminasi';
INSERT INTO players (team_id, player_name, player_number) SELECT id, 'Dadan Garusalam', 15 FROM teams WHERE team_code='laminasi';
INSERT INTO players (team_id, player_name, player_number) SELECT id, 'Dodi Ariaji', 16 FROM teams WHERE team_code='laminasi';
INSERT INTO players (team_id, player_name, player_number) SELECT id, 'Deni Bahtiar', 17 FROM teams WHERE team_code='laminasi';

-- HRD
INSERT INTO players (team_id, player_name, player_number) SELECT id, 'Argha Elton S', 1 FROM teams WHERE team_code='hr';
INSERT INTO players (team_id, player_name, player_number) SELECT id, 'Dea Iswandi', 2 FROM teams WHERE team_code='hr';
INSERT INTO players (team_id, player_name, player_number) SELECT id, 'Suhendar', 3 FROM teams WHERE team_code='hr';
INSERT INTO players (team_id, player_name, player_number) SELECT id, 'Pebriyanto', 4 FROM teams WHERE team_code='hr';

-- HSE
INSERT INTO players (team_id, player_name, player_number) SELECT id, 'Faiz Erlangga', 1 FROM teams WHERE team_code='hse';
INSERT INTO players (team_id, player_name, player_number) SELECT id, 'Raden Hanif', 2 FROM teams WHERE team_code='hse';

-- Warehouse
INSERT INTO players (team_id, player_name, player_number) SELECT id, 'Asep Maulana', 1 FROM teams WHERE team_code='warehouse';
INSERT INTO players (team_id, player_name, player_number) SELECT id, 'Rizki Aitollah', 2 FROM teams WHERE team_code='warehouse';
INSERT INTO players (team_id, player_name, player_number) SELECT id, 'Diaz Nur Davin', 3 FROM teams WHERE team_code='warehouse';
INSERT INTO players (team_id, player_name, player_number) SELECT id, 'Ilham Lutiansyah', 4 FROM teams WHERE team_code='warehouse';
INSERT INTO players (team_id, player_name, player_number) SELECT id, 'Kodri', 5 FROM teams WHERE team_code='warehouse';
INSERT INTO players (team_id, player_name, player_number) SELECT id, 'Agung Sanjani', 6 FROM teams WHERE team_code='warehouse';
INSERT INTO players (team_id, player_name, player_number) SELECT id, 'Sarwani', 7 FROM teams WHERE team_code='warehouse';
INSERT INTO players (team_id, player_name, player_number) SELECT id, 'Tomi', 8 FROM teams WHERE team_code='warehouse';
INSERT INTO players (team_id, player_name, player_number) SELECT id, 'Arif Firmansyah', 9 FROM teams WHERE team_code='warehouse';
INSERT INTO players (team_id, player_name, player_number) SELECT id, 'Dian Hidayat', 10 FROM teams WHERE team_code='warehouse';
INSERT INTO players (team_id, player_name, player_number) SELECT id, 'Mudi', 11 FROM teams WHERE team_code='warehouse';
INSERT INTO players (team_id, player_name, player_number) SELECT id, 'Vika Rochmawan', 12 FROM teams WHERE team_code='warehouse';
INSERT INTO players (team_id, player_name, player_number) SELECT id, 'Windi Andriana', 13 FROM teams WHERE team_code='warehouse';
INSERT INTO players (team_id, player_name, player_number) SELECT id, 'Adry Hasan', 14 FROM teams WHERE team_code='warehouse';
INSERT INTO players (team_id, player_name, player_number) SELECT id, 'Andhika Pranaditya', 15 FROM teams WHERE team_code='warehouse';

-- QC
INSERT INTO players (team_id, player_name, player_number) SELECT id, 'Dimas Suryana', 1 FROM teams WHERE team_code='qc';
INSERT INTO players (team_id, player_name, player_number) SELECT id, 'Bahrun Supriyadi', 2 FROM teams WHERE team_code='qc';
INSERT INTO players (team_id, player_name, player_number) SELECT id, 'Ahmad Rijalul Arifin', 3 FROM teams WHERE team_code='qc';
INSERT INTO players (team_id, player_name, player_number) SELECT id, 'Agri Priyambudi', 4 FROM teams WHERE team_code='qc';
INSERT INTO players (team_id, player_name, player_number) SELECT id, 'Huseini Muji', 5 FROM teams WHERE team_code='qc';
INSERT INTO players (team_id, player_name, player_number) SELECT id, 'Gian Vembana', 6 FROM teams WHERE team_code='qc';
INSERT INTO players (team_id, player_name, player_number) SELECT id, 'Fani Nur Rahman', 7 FROM teams WHERE team_code='qc';
INSERT INTO players (team_id, player_name, player_number) SELECT id, 'Maman Lukman', 8 FROM teams WHERE team_code='qc';
INSERT INTO players (team_id, player_name, player_number) SELECT id, 'Moh Yuda', 9 FROM teams WHERE team_code='qc';
INSERT INTO players (team_id, player_name, player_number) SELECT id, 'Syarip Hidayat', 10 FROM teams WHERE team_code='qc';
INSERT INTO players (team_id, player_name, player_number) SELECT id, 'Daffa', 11 FROM teams WHERE team_code='qc';
INSERT INTO players (team_id, player_name, player_number) SELECT id, 'Sul Assari', 12 FROM teams WHERE team_code='qc';
INSERT INTO players (team_id, player_name, player_number) SELECT id, 'Tri Dwiyono', 13 FROM teams WHERE team_code='qc';

-- Slitter
INSERT INTO players (team_id, player_name, player_number) SELECT id, 'Zio Erianda', 1 FROM teams WHERE team_code='slitter';
INSERT INTO players (team_id, player_name, player_number) SELECT id, 'Iskandar', 2 FROM teams WHERE team_code='slitter';
INSERT INTO players (team_id, player_name, player_number) SELECT id, 'Supriyatna', 3 FROM teams WHERE team_code='slitter';
INSERT INTO players (team_id, player_name, player_number) SELECT id, 'Johan Ronaldo Purba', 4 FROM teams WHERE team_code='slitter';
INSERT INTO players (team_id, player_name, player_number) SELECT id, 'Januar Ishak', 5 FROM teams WHERE team_code='slitter';
INSERT INTO players (team_id, player_name, player_number) SELECT id, 'M. Akbar Riyadi', 6 FROM teams WHERE team_code='slitter';
INSERT INTO players (team_id, player_name, player_number) SELECT id, 'Naufal Rifky Ananda', 7 FROM teams WHERE team_code='slitter';
INSERT INTO players (team_id, player_name, player_number) SELECT id, 'Suhendi', 8 FROM teams WHERE team_code='slitter';
INSERT INTO players (team_id, player_name, player_number) SELECT id, 'Muslim Konde', 9 FROM teams WHERE team_code='slitter';
INSERT INTO players (team_id, player_name, player_number) SELECT id, 'Sandi Novian', 10 FROM teams WHERE team_code='slitter';
INSERT INTO players (team_id, player_name, player_number) SELECT id, 'Nuryadi', 11 FROM teams WHERE team_code='slitter';
INSERT INTO players (team_id, player_name, player_number) SELECT id, 'Jumadi B', 12 FROM teams WHERE team_code='slitter';
INSERT INTO players (team_id, player_name, player_number) SELECT id, 'Deri Nugraha', 13 FROM teams WHERE team_code='slitter';
INSERT INTO players (team_id, player_name, player_number) SELECT id, 'Anugerah Eko', 14 FROM teams WHERE team_code='slitter';
INSERT INTO players (team_id, player_name, player_number) SELECT id, 'Samsul Bukhori', 15 FROM teams WHERE team_code='slitter';
INSERT INTO players (team_id, player_name, player_number) SELECT id, 'Putra Saktiantoro', 16 FROM teams WHERE team_code='slitter';
INSERT INTO players (team_id, player_name, player_number) SELECT id, 'Marupi', 17 FROM teams WHERE team_code='slitter';
INSERT INTO players (team_id, player_name, player_number) SELECT id, 'Kartono', 18 FROM teams WHERE team_code='slitter';
INSERT INTO players (team_id, player_name, player_number) SELECT id, 'M. Nur Alief', 19 FROM teams WHERE team_code='slitter';
INSERT INTO players (team_id, player_name, player_number) SELECT id, 'Wansisco Nesta', 20 FROM teams WHERE team_code='slitter';
INSERT INTO players (team_id, player_name, player_number) SELECT id, 'M. Baharudinshyah', 21 FROM teams WHERE team_code='slitter';
INSERT INTO players (team_id, player_name, player_number) SELECT id, 'Mat Yudi', 22 FROM teams WHERE team_code='slitter';
INSERT INTO players (team_id, player_name, player_number) SELECT id, 'Romelan', 23 FROM teams WHERE team_code='slitter';
INSERT INTO players (team_id, player_name, player_number) SELECT id, 'Juhana', 24 FROM teams WHERE team_code='slitter';
INSERT INTO players (team_id, player_name, player_number) SELECT id, 'Rizal Faiz', 25 FROM teams WHERE team_code='slitter';
INSERT INTO players (team_id, player_name, player_number) SELECT id, 'Irfan Alfa', 26 FROM teams WHERE team_code='slitter';
INSERT INTO players (team_id, player_name, player_number) SELECT id, 'Dudi Setiadi', 27 FROM teams WHERE team_code='slitter';

-- Printing
INSERT INTO players (team_id, player_name, player_number) SELECT id, 'Masturo', 1 FROM teams WHERE team_code='printing';
INSERT INTO players (team_id, player_name, player_number) SELECT id, 'Nurwenda', 2 FROM teams WHERE team_code='printing';
INSERT INTO players (team_id, player_name, player_number) SELECT id, 'Ahmad Sanwari', 3 FROM teams WHERE team_code='printing';
INSERT INTO players (team_id, player_name, player_number) SELECT id, 'Ryan Herdiansyah', 4 FROM teams WHERE team_code='printing';
INSERT INTO players (team_id, player_name, player_number) SELECT id, 'Hilman Filani', 5 FROM teams WHERE team_code='printing';
INSERT INTO players (team_id, player_name, player_number) SELECT id, 'Yosef Warsono', 6 FROM teams WHERE team_code='printing';
INSERT INTO players (team_id, player_name, player_number) SELECT id, 'Towel Hamdalah', 7 FROM teams WHERE team_code='printing';
INSERT INTO players (team_id, player_name, player_number) SELECT id, 'Rubi Ismanto', 8 FROM teams WHERE team_code='printing';
INSERT INTO players (team_id, player_name, player_number) SELECT id, 'Agus Kurnia', 9 FROM teams WHERE team_code='printing';
INSERT INTO players (team_id, player_name, player_number) SELECT id, 'Roby Alamsyah', 10 FROM teams WHERE team_code='printing';
INSERT INTO players (team_id, player_name, player_number) SELECT id, 'Cornelis Franki', 11 FROM teams WHERE team_code='printing';
INSERT INTO players (team_id, player_name, player_number) SELECT id, 'Irfan Rolidin', 12 FROM teams WHERE team_code='printing';
INSERT INTO players (team_id, player_name, player_number) SELECT id, 'Ahmad Faisal', 13 FROM teams WHERE team_code='printing';
INSERT INTO players (team_id, player_name, player_number) SELECT id, 'Muhammad Usiadi', 14 FROM teams WHERE team_code='printing';
INSERT INTO players (team_id, player_name, player_number) SELECT id, 'Muhammad Naufal Ilhamsyah', 15 FROM teams WHERE team_code='printing';
INSERT INTO players (team_id, player_name, player_number) SELECT id, 'Rudi Romansyah', 16 FROM teams WHERE team_code='printing';
INSERT INTO players (team_id, player_name, player_number) SELECT id, 'Hafizh Kurniawan Soedick', 17 FROM teams WHERE team_code='printing';
INSERT INTO players (team_id, player_name, player_number) SELECT id, 'Rafael Djikstra Natipupulu', 18 FROM teams WHERE team_code='printing';
INSERT INTO players (team_id, player_name, player_number) SELECT id, 'Ahmad Sanusi', 19 FROM teams WHERE team_code='printing';
INSERT INTO players (team_id, player_name, player_number) SELECT id, 'Iswadi Idris', 20 FROM teams WHERE team_code='printing';
INSERT INTO players (team_id, player_name, player_number) SELECT id, 'Ahmad Fauzan', 21 FROM teams WHERE team_code='printing';
INSERT INTO players (team_id, player_name, player_number) SELECT id, 'Galang Djanuradi Susanto', 22 FROM teams WHERE team_code='printing';
INSERT INTO players (team_id, player_name, player_number) SELECT id, 'Prima Bayu Martin Lian', 23 FROM teams WHERE team_code='printing';
INSERT INTO players (team_id, player_name, player_number) SELECT id, 'Ahmad Japar Sidik', 24 FROM teams WHERE team_code='printing';

-- Rewinder
INSERT INTO players (team_id, player_name, player_number) SELECT id, 'Erwin Irawan', 1 FROM teams WHERE team_code='rewinder';

-- Supporting
INSERT INTO players (team_id, player_name, player_number) SELECT id, 'Pendi Editiya', 1 FROM teams WHERE team_code='supporting';
INSERT INTO players (team_id, player_name, player_number) SELECT id, 'Ahmad Farisi Ilal Maulana', 2 FROM teams WHERE team_code='supporting';
INSERT INTO players (team_id, player_name, player_number) SELECT id, 'Deni Eri Pratama', 3 FROM teams WHERE team_code='supporting';
INSERT INTO players (team_id, player_name, player_number) SELECT id, 'Deny Rafdi Firmansyah', 4 FROM teams WHERE team_code='supporting';
INSERT INTO players (team_id, player_name, player_number) SELECT id, 'Sahid Abdul Rochman', 5 FROM teams WHERE team_code='supporting';
INSERT INTO players (team_id, player_name, player_number) SELECT id, 'Abdul Aziz', 6 FROM teams WHERE team_code='supporting';
INSERT INTO players (team_id, player_name, player_number) SELECT id, 'Ivan Adhitya Ramadhan', 7 FROM teams WHERE team_code='supporting';
INSERT INTO players (team_id, player_name, player_number) SELECT id, 'Heri Romadi', 8 FROM teams WHERE team_code='supporting';
INSERT INTO players (team_id, player_name, player_number) SELECT id, 'Muhammad Ilyas', 9 FROM teams WHERE team_code='supporting';
INSERT INTO players (team_id, player_name, player_number) SELECT id, 'Sonhaji', 10 FROM teams WHERE team_code='supporting';

-- Teknik
INSERT INTO players (team_id, player_name, player_number) SELECT id, 'Ladislaus Risangpaiar', 1 FROM teams WHERE team_code='teknik';
INSERT INTO players (team_id, player_name, player_number) SELECT id, 'Banjar Andi Malo Sitorus', 2 FROM teams WHERE team_code='teknik';
INSERT INTO players (team_id, player_name, player_number) SELECT id, 'Ditra Ikhsanulhaqi Suryadi', 3 FROM teams WHERE team_code='teknik';
INSERT INTO players (team_id, player_name, player_number) SELECT id, 'Rizky Priyambudi', 4 FROM teams WHERE team_code='teknik';
INSERT INTO players (team_id, player_name, player_number) SELECT id, 'Hadi Junaedi', 5 FROM teams WHERE team_code='teknik';
INSERT INTO players (team_id, player_name, player_number) SELECT id, 'Ardhanji Fiqri Abdilah', 6 FROM teams WHERE team_code='teknik';
INSERT INTO players (team_id, player_name, player_number) SELECT id, 'Doni Febrian Mulyana', 7 FROM teams WHERE team_code='teknik';
INSERT INTO players (team_id, player_name, player_number) SELECT id, 'Khamdani Pratama', 8 FROM teams WHERE team_code='teknik';
INSERT INTO players (team_id, player_name, player_number) SELECT id, 'Muhammad Sandy Soufian', 9 FROM teams WHERE team_code='teknik';
INSERT INTO players (team_id, player_name, player_number) SELECT id, 'Farhan Hakiki', 10 FROM teams WHERE team_code='teknik';
INSERT INTO players (team_id, player_name, player_number) SELECT id, 'Rifky Azhar Pradipa', 11 FROM teams WHERE team_code='teknik';
INSERT INTO players (team_id, player_name, player_number) SELECT id, 'Ardi Prayoga', 12 FROM teams WHERE team_code='teknik';

-- BTP
INSERT INTO players (team_id, player_name, player_number) SELECT id, 'M. Renaldi', 1 FROM teams WHERE team_code='btp';
INSERT INTO players (team_id, player_name, player_number) SELECT id, 'Fahri A', 2 FROM teams WHERE team_code='btp';
INSERT INTO players (team_id, player_name, player_number) SELECT id, 'Fawaji', 3 FROM teams WHERE team_code='btp';
INSERT INTO players (team_id, player_name, player_number) SELECT id, 'Faiz N H', 4 FROM teams WHERE team_code='btp';
INSERT INTO players (team_id, player_name, player_number) SELECT id, 'Angga F', 5 FROM teams WHERE team_code='btp';
INSERT INTO players (team_id, player_name, player_number) SELECT id, 'Hanip', 6 FROM teams WHERE team_code='btp';
INSERT INTO players (team_id, player_name, player_number) SELECT id, 'Faujan', 7 FROM teams WHERE team_code='btp';
INSERT INTO players (team_id, player_name, player_number) SELECT id, 'Rifky', 8 FROM teams WHERE team_code='btp';
INSERT INTO players (team_id, player_name, player_number) SELECT id, 'Ade A', 9 FROM teams WHERE team_code='btp';

-- Sample matches
INSERT INTO matches (team_home_id, team_away_id, score_home, score_away, match_date, match_status) VALUES
((SELECT id FROM teams WHERE team_code='laminasi'), (SELECT id FROM teams WHERE team_code='ppic'), 3, 0, '2026-01-15 14:00:00', 'finished'),
((SELECT id FROM teams WHERE team_code='btp'), (SELECT id FROM teams WHERE team_code='laminasi'), 2, 1, '2026-01-14 14:00:00', 'finished'),
((SELECT id FROM teams WHERE team_code='ppic'), (SELECT id FROM teams WHERE team_code='btp'), 1, 2, '2026-01-13 14:00:00', 'finished');

-- Event info
INSERT INTO event_info (event_title, event_year, event_vision, event_description, about_k3, event_purpose, background_text) VALUES
('BULAN K3 NASIONAL', 2026,
 'Membangun Ekosistem Pengelolaan K3 Nasional yang Profesional, Andal, dan Kolaboratif',
 'Bulan K3 Nasional 2026 adalah event tahunan... (ringkasan)',
 'Bulan K3 merupakan program nasional tahunan...',
 'Penyelenggaraan Turnamen Mini Soccer dalam rangka Bulan K3 ini bertujuan untuk:\n- Meningkatkan kesadaran...\n- Mendorong gaya hidup sehat...\n- Mempererat hubungan...\n- Menumbuhkan nilai sportivitas...\n- Mendukung penerapan budaya K3.',
 'Dalam rangka memperingati Bulan Kesehatan dan Keselamatan Kerja (K3)...');

-- Schedule (example per week)
INSERT INTO schedule (team_home_id, team_away_id, match_date, match_time, week_number, match_status) VALUES
((SELECT id FROM teams WHERE team_code='teknik'), (SELECT id FROM teams WHERE team_code='laminasi'), '2026-01-21', '19:00:00', 1, 'scheduled'),
((SELECT id FROM teams WHERE team_code='security'), (SELECT id FROM teams WHERE team_code='warehouse'), '2026-01-21', '19:00:00', 1, 'scheduled'),
((SELECT id FROM teams WHERE team_code='supporting'), (SELECT id FROM teams WHERE team_code='hr'), '2026-01-28', '19:00:00', 2, 'scheduled'),
((SELECT id FROM teams WHERE team_code='qc'), (SELECT id FROM teams WHERE team_code='btp'), '2026-01-28', '19:00:00', 2, 'scheduled'),
((SELECT id FROM teams WHERE team_code='teknik'), (SELECT id FROM teams WHERE team_code='laminasi'), '2026-02-04', '19:00:00', 3, 'scheduled');

-- Done

