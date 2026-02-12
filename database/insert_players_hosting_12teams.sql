-- Insert players HANYA untuk 12 teams yang ada di database hosting lama
-- Cocok dengan teams: btp, laminasi, ppic, printing, hr, puk, quality, security, slitter, supporting, teknik, warehouse
-- Run setelah TRUNCATE TABLE players:
-- mysql -u root -p -h sql306.byetcluster.com if0_41118739_u123456789_bulank3 < insert_players_hosting_12teams.sql

-- LAMINASI (17 pemain)
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

-- PPIC (2 pemain)
INSERT INTO players (team_id, player_name, player_number) SELECT id, 'Hendrik Hermawan', 1 FROM teams WHERE team_code='ppic';
INSERT INTO players (team_id, player_name, player_number) SELECT id, 'Fahman Fauzi', 2 FROM teams WHERE team_code='ppic';

-- HR (4 pemain)
INSERT INTO players (team_id, player_name, player_number) SELECT id, 'Argha Elton S', 1 FROM teams WHERE team_code='hr';
INSERT INTO players (team_id, player_name, player_number) SELECT id, 'Dea Iswandi', 2 FROM teams WHERE team_code='hr';
INSERT INTO players (team_id, player_name, player_number) SELECT id, 'Suhendar', 3 FROM teams WHERE team_code='hr';
INSERT INTO players (team_id, player_name, player_number) SELECT id, 'Pebriyanto', 4 FROM teams WHERE team_code='hr';

-- WAREHOUSE (15 pemain)
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

-- QC (13 pemain)
-- QUALITY SQUAD (moved QC players here)
INSERT INTO players (team_id, player_name, player_number) SELECT id, 'Dimas Suryana', 1 FROM teams WHERE team_code='quality';
INSERT INTO players (team_id, player_name, player_number) SELECT id, 'Bahrun Supriyadi', 2 FROM teams WHERE team_code='quality';
INSERT INTO players (team_id, player_name, player_number) SELECT id, 'Ahmad Rijalul Arifin', 3 FROM teams WHERE team_code='quality';
INSERT INTO players (team_id, player_name, player_number) SELECT id, 'Agri Priyambudi', 4 FROM teams WHERE team_code='quality';
INSERT INTO players (team_id, player_name, player_number) SELECT id, 'Huseini Muji', 5 FROM teams WHERE team_code='quality';
INSERT INTO players (team_id, player_name, player_number) SELECT id, 'Gian Vembana', 6 FROM teams WHERE team_code='quality';
INSERT INTO players (team_id, player_name, player_number) SELECT id, 'Fani Nur Rahman', 7 FROM teams WHERE team_code='quality';
INSERT INTO players (team_id, player_name, player_number) SELECT id, 'Maman Lukman', 8 FROM teams WHERE team_code='quality';
INSERT INTO players (team_id, player_name, player_number) SELECT id, 'Moh Yuda', 9 FROM teams WHERE team_code='quality';
INSERT INTO players (team_id, player_name, player_number) SELECT id, 'Syarip Hidayat', 10 FROM teams WHERE team_code='quality';
INSERT INTO players (team_id, player_name, player_number) SELECT id, 'Daffa', 11 FROM teams WHERE team_code='quality';
INSERT INTO players (team_id, player_name, player_number) SELECT id, 'Sul Assari', 12 FROM teams WHERE team_code='quality';
INSERT INTO players (team_id, player_name, player_number) SELECT id, 'Tri Dwiyono', 13 FROM teams WHERE team_code='quality';

-- SLITTER (27 pemain)
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

-- PRINTING (24 pemain)
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

-- SUPPORTING (10 pemain)
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

-- TEKNIK (12 pemain)
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

-- BTP (9 pemain)
INSERT INTO players (team_id, player_name, player_number) SELECT id, 'M. Renaldi', 1 FROM teams WHERE team_code='btp';
INSERT INTO players (team_id, player_name, player_number) SELECT id, 'Fahri A', 2 FROM teams WHERE team_code='btp';
INSERT INTO players (team_id, player_name, player_number) SELECT id, 'Fawaji', 3 FROM teams WHERE team_code='btp';
INSERT INTO players (team_id, player_name, player_number) SELECT id, 'Faiz N H', 4 FROM teams WHERE team_code='btp';
INSERT INTO players (team_id, player_name, player_number) SELECT id, 'Angga F', 5 FROM teams WHERE team_code='btp';
INSERT INTO players (team_id, player_name, player_number) SELECT id, 'Hanip', 6 FROM teams WHERE team_code='btp';
INSERT INTO players (team_id, player_name, player_number) SELECT id, 'Faujan', 7 FROM teams WHERE team_code='btp';
INSERT INTO players (team_id, player_name, player_number) SELECT id, 'Rifky', 8 FROM teams WHERE team_code='btp';
INSERT INTO players (team_id, player_name, player_number) SELECT id, 'Ade A', 9 FROM teams WHERE team_code='btp';

-- PUK
-- (Belum ada data pemain, bisa ditambah kemudian)

-- QUALITY
-- (Belum ada data pemain, bisa ditambah kemudian)

-- End

-- Additional individual players provided (use team_code or team_name match)
-- Rewinder
INSERT INTO players (team_id, player_name, player_number)
SELECT id, 'Erwin Irawan', 1 FROM teams WHERE LOWER(team_code) = 'rewinder' OR LOWER(team_name) = 'rewinder';

-- Accounting
INSERT INTO players (team_id, player_name, player_number)
SELECT id, 'Rendra Rediantoni', 1 FROM teams WHERE LOWER(team_code) = 'accounting' OR LOWER(team_name) = 'accounting';
INSERT INTO players (team_id, player_name, player_number)
SELECT id, 'Ilyasa Arsingih Putro', 2 FROM teams WHERE LOWER(team_code) = 'accounting' OR LOWER(team_name) = 'accounting';
INSERT INTO players (team_id, player_name, player_number)
SELECT id, 'Ahmad Isa Habibulloh', 3 FROM teams WHERE LOWER(team_code) = 'accounting' OR LOWER(team_name) = 'accounting';

-- HSE
INSERT INTO players (team_id, player_name, player_number)
SELECT id, 'Faiz Erlangga', 1 FROM teams WHERE LOWER(team_code) = 'hse' OR LOWER(team_name) = 'hse' OR LOWER(team_name) = 'hse';
INSERT INTO players (team_id, player_name, player_number)
SELECT id, 'Raden Hanif', 2 FROM teams WHERE LOWER(team_code) = 'hse' OR LOWER(team_name) = 'hse' OR LOWER(team_name) = 'hse';

-- Information Technology
INSERT INTO players (team_id, player_name, player_number)
SELECT id, 'Heri Ramandus G', 1 FROM teams WHERE LOWER(team_code) = 'information_technology' OR LOWER(team_name) = 'information technology' OR LOWER(team_name) = 'information_technology' OR LOWER(team_code) = 'it';

