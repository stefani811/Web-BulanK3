-- Update/Sync Database Hosting - Tambah Kolom Match & Goals ke Tabel Leaderboard
-- Run di: if0_41118739_bulank3
-- mysql -u <user> -p -h sql306.byetcluster.com if0_41118739_bulank3 < update_hosting_database.sql

-- ============================================
-- STEP 1: CREATE/UPDATE LEADERBOARD TABLE
-- ============================================
-- Tambah kolom Match & Goals jika belum ada

ALTER TABLE leaderboard ADD COLUMN IF NOT EXISTS `match` INT DEFAULT 0 COMMENT 'Jumlah pertandingan' AFTER `team_id`;
ALTER TABLE leaderboard ADD COLUMN IF NOT EXISTS `goals` VARCHAR(10) DEFAULT '0:0' COMMENT 'Goal (format: masuk:kemasukan)' AFTER `point`;

-- ============================================
-- STEP 2: UPDATE LEADERBOARD DATA
-- ============================================

-- GROUP A
-- Laminasi: main 2, menang 2, draw 0, kalah 0, g 10:1, point 6
UPDATE leaderboard SET `match`=2, wins=2, draws=0, losses=0, goals='10:1', point=6 
WHERE team_id=(SELECT id FROM teams WHERE team_code='laminasi');

-- PPIC/Accounting: main 1, menang 0, draw 0, kalah 1, g 0:3, point 0
UPDATE leaderboard SET `match`=1, wins=0, draws=0, losses=1, goals='0:3', point=0 
WHERE team_id=(SELECT id FROM teams WHERE team_code='ppic');

-- Teknik: main 1, menang 0, draw 0, kalah 1, g 1:7, point 0
UPDATE leaderboard SET `match`=1, wins=0, draws=0, losses=1, goals='1:7', point=0 
WHERE team_id=(SELECT id FROM teams WHERE team_code='teknik');

-- GROUP B
-- Slitter: main 2, menang 1, draw 0, kalah 1, g 4:2, point 3
UPDATE leaderboard SET `match`=2, wins=1, draws=0, losses=1, goals='4:2', point=3 
WHERE team_id=(SELECT id FROM teams WHERE team_code='slitter');

-- HR: main 1, menang 1, draw 0, kalah 0, g 2:1, point 3
UPDATE leaderboard SET `match`=1, wins=1, draws=0, losses=0, goals='2:1', point=3 
WHERE team_id=(SELECT id FROM teams WHERE team_code='hr');

-- Supporting: main 1, menang 0, draw 0, kalah 1, g 1:3, point 0
UPDATE leaderboard SET `match`=1, wins=0, draws=0, losses=1, goals='1:3', point=0 
WHERE team_id=(SELECT id FROM teams WHERE team_code='supporting');

-- GROUP C
-- Printing: main 1, menang 1, draw 0, kalah 0, g 7:1, point 3
UPDATE leaderboard SET `match`=1, wins=1, draws=0, losses=0, goals='7:1', point=3 
WHERE team_id=(SELECT id FROM teams WHERE team_code='printing');

-- Warehouse: main 1, menang 1, draw 0, kalah 0, g 5:0, point 3
UPDATE leaderboard SET `match`=1, wins=1, draws=0, losses=0, goals='5:0', point=3 
WHERE team_id=(SELECT id FROM teams WHERE team_code='warehouse');

-- Security: main 2, menang 0, draw 0, kalah 2, g 1:12, point 0
UPDATE leaderboard SET `match`=2, wins=0, draws=0, losses=2, goals='1:12', point=0 
WHERE team_id=(SELECT id FROM teams WHERE team_code='security');

-- GROUP D
-- PUK: main 1, menang 1, draw 0, kalah 0, g 5:1, point 3
UPDATE leaderboard SET `match`=1, wins=1, draws=0, losses=0, goals='5:1', point=3 
WHERE team_id=(SELECT id FROM teams WHERE team_code='puk');

-- BTP: main 1, menang 1, draw 0, kalah 0, g 3:2, point 3
UPDATE leaderboard SET `match`=1, wins=1, draws=0, losses=0, goals='3:2', point=3 
WHERE team_id=(SELECT id FROM teams WHERE team_code='btp');

-- QC: main 2, menang 0, draw 0, kalah 2, g 3:8, point 0
UPDATE leaderboard SET `match`=2, wins=0, draws=0, losses=2, goals='3:8', point=0 
WHERE team_id=(SELECT id FROM teams WHERE team_code='quality');

-- End

