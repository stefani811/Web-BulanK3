-- Database Schema for BULAN K3 NASIONAL 2026 Mini Soccer Tournament
-- Created for Web-BulanK3 Project

-- Create Database
CREATE DATABASE IF NOT EXISTS bulan_k3_2026 CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;
USE bulan_k3_2026;

-- Table: teams (Data Klub Football)
CREATE TABLE IF NOT EXISTS teams (
    id INT AUTO_INCREMENT PRIMARY KEY,
    team_code VARCHAR(50) UNIQUE NOT NULL COMMENT 'Kode unik tim (btp, laminasi, ppic, dll)',
    team_name VARCHAR(255) NOT NULL COMMENT 'Nama lengkap tim',
    team_logo VARCHAR(255) COMMENT 'Path ke file logo tim',
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    INDEX idx_team_code (team_code)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Table: players (Data Pemain)
CREATE TABLE IF NOT EXISTS players (
    id INT AUTO_INCREMENT PRIMARY KEY,
    team_id INT NOT NULL,
    player_name VARCHAR(255) NOT NULL COMMENT 'Nama lengkap pemain',
    player_number INT COMMENT 'Nomor punggung pemain',
    position VARCHAR(50) COMMENT 'Posisi pemain (GK, DF, MF, FW)',
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    FOREIGN KEY (team_id) REFERENCES teams(id) ON DELETE CASCADE,
    INDEX idx_team_id (team_id),
    INDEX idx_player_number (player_number)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Table: matches (Data Pertandingan/Scoreboard)
CREATE TABLE IF NOT EXISTS matches (
    id INT AUTO_INCREMENT PRIMARY KEY,
    team_home_id INT NOT NULL COMMENT 'ID tim tuan rumah',
    team_away_id INT NOT NULL COMMENT 'ID tim tamu',
    score_home INT DEFAULT 0 COMMENT 'Skor tim tuan rumah',
    score_away INT DEFAULT 0 COMMENT 'Skor tim tamu',
    match_date DATETIME COMMENT 'Tanggal dan waktu pertandingan',
    match_status ENUM('scheduled', 'ongoing', 'finished') DEFAULT 'finished' COMMENT 'Status pertandingan',
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    FOREIGN KEY (team_home_id) REFERENCES teams(id) ON DELETE CASCADE,
    FOREIGN KEY (team_away_id) REFERENCES teams(id) ON DELETE CASCADE,
    INDEX idx_match_date (match_date),
    INDEX idx_match_status (match_status)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Table: event_info (Informasi Event K3)
CREATE TABLE IF NOT EXISTS event_info (
    id INT AUTO_INCREMENT PRIMARY KEY,
    event_title VARCHAR(255) NOT NULL DEFAULT 'BULAN K3 NASIONAL',
    event_year INT NOT NULL DEFAULT 2026,
    event_vision TEXT COMMENT 'Visi event',
    event_description TEXT COMMENT 'Deskripsi event',
    about_k3 TEXT COMMENT 'Penjelasan tentang Bulan K3',
    event_purpose TEXT COMMENT 'Tujuan diadakan event',
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

