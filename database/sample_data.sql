-- Sample Data for BULAN K3 NASIONAL 2026 Mini Soccer Tournament
-- Insert sample teams, players, and matches

USE bulan_k3_2026;

-- Insert Teams
INSERT INTO teams (team_code, team_name, team_logo) VALUES
('btp', 'BTP Packaging - Bina Tunas Mini Soccer', 'assets/images/team-btp.png'),
('laminasi', 'Laminasi FC', 'assets/images/team-laminasi.png'),
('ppic', 'PPIC Accounting Football Club', 'assets/images/team-ppic.png'),
('printing', 'FC Printing', 'assets/images/FC Printing.png'),
('hr', 'HR FC', 'assets/images/HR FC.png'),
('puk', 'PUK SP PPMI', 'assets/images/PUK SP PPMI.png'),
('quality', 'Quality Squad 1991', 'assets/images/Quality Squad 1991.png'),
('security', 'Security FC', 'assets/images/Security FC.png'),
('slitter', 'Slitter FC', 'assets/images/Slitter FC.png'),
('supporting', 'Supporting Division', 'assets/images/Supporting Division.png'),
('teknik', 'Teknik FC', 'assets/images/Teknik FC.png'),
('warehouse', 'Warehouse FC', 'assets/images/Warehouse FC.png');

-- Insert Players for BTP Packaging
INSERT INTO players (team_id, player_name, player_number, position) VALUES
(1, 'Ahmad Rizki', 1, 'GK'),
(1, 'Budi Santoso', 2, 'DF'),
(1, 'Cahyo Pratama', 3, 'DF'),
(1, 'Dedi Kurniawan', 4, 'DF'),
(1, 'Eko Wijaya', 5, 'DF'),
(1, 'Fajar Nugroho', 6, 'MF'),
(1, 'Gunawan Sari', 7, 'MF'),
(1, 'Hadi Susanto', 8, 'MF'),
(1, 'Indra Permana', 9, 'FW'),
(1, 'Joko Widodo', 10, 'FW'),
(1, 'Kurniawan Setiawan', 11, 'FW'),
(1, 'Lukman Hakim', 12, 'MF'),
(1, 'Muhammad Ali', 13, 'DF'),
(1, 'Nur Hidayat', 14, 'MF'),
(1, 'Oki Setiawan', 15, 'FW');

-- Insert Players for Laminasi FC
INSERT INTO players (team_id, player_name, player_number, position) VALUES
(2, 'Prasetyo Adi', 1, 'GK'),
(2, 'Qori Sandria', 2, 'DF'),
(2, 'Rizki Maulana', 3, 'DF'),
(2, 'Surya Pratama', 4, 'DF'),
(2, 'Teguh Wijaya', 5, 'DF'),
(2, 'Udin Sedunia', 6, 'MF'),
(2, 'Vino G Bastian', 7, 'MF'),
(2, 'Wahyu Kurniawan', 8, 'MF'),
(2, 'Xavier Tan', 9, 'FW'),
(2, 'Yoga Pratama', 10, 'FW'),
(2, 'Zulkifli Hasan', 11, 'FW'),
(2, 'Ahmad Fauzi', 12, 'MF'),
(2, 'Bambang Sutrisno', 13, 'DF'),
(2, 'Candra Wijaya', 14, 'MF'),
(2, 'Doni Setiawan', 15, 'FW');

-- Insert Players for PPIC Accounting FC
INSERT INTO players (team_id, player_name, player_number, position) VALUES
(3, 'Eko Prasetyo', 1, 'GK'),
(3, 'Faisal Rahman', 2, 'DF'),
(3, 'Guntur Wijaya', 3, 'DF'),
(3, 'Hendra Kurniawan', 4, 'DF'),
(3, 'Iwan Setiawan', 5, 'DF'),
(3, 'Joko Susilo', 6, 'MF'),
(3, 'Kurniawan Adi', 7, 'MF'),
(3, 'Lukman Hakim', 8, 'MF'),
(3, 'Muhammad Rizki', 9, 'FW'),
(3, 'Nur Hidayat', 10, 'FW'),
(3, 'Oki Setiawan', 11, 'FW'),
(3, 'Prasetyo Adi', 12, 'MF'),
(3, 'Qori Sandria', 13, 'DF'),
(3, 'Rizki Maulana', 14, 'MF'),
(3, 'Surya Pratama', 15, 'FW');

-- Insert Sample Matches (Latest matches first)
INSERT INTO matches (team_home_id, team_away_id, score_home, score_away, match_date, match_status) VALUES
(2, 3, 3, 0, '2026-01-15 14:00:00', 'finished'),
(1, 2, 2, 1, '2026-01-14 14:00:00', 'finished'),
(3, 1, 1, 2, '2026-01-13 14:00:00', 'finished'),
(4, 5, 2, 2, '2026-01-12 14:00:00', 'finished'),
(6, 7, 1, 0, '2026-01-11 14:00:00', 'finished'),
(8, 9, 3, 1, '2026-01-10 14:00:00', 'finished'),
(10, 11, 0, 2, '2026-01-09 14:00:00', 'finished'),
(12, 4, 1, 1, '2026-01-08 14:00:00', 'finished');

-- Insert Event Information
INSERT INTO event_info (event_title, event_year, event_vision, event_description, about_k3, event_purpose, background_text) VALUES
(
    'BULAN K3 NASIONAL',
    2026,
    'Membangun Ekosistem Pengelolaan K3 Nasional yang Profesional, Andal, dan Kolaboratif',
    'Bulan K3 Nasional 2026 adalah event tahunan yang diselenggarakan untuk meningkatkan kesadaran dan pemahaman tentang Keselamatan dan Kesehatan Kerja (K3) di seluruh Indonesia. Event ini diisi dengan berbagai kegiatan termasuk turnamen mini soccer antar divisi.',
    'Bulan K3 merupakan program nasional tahunan untuk meningkatkan penerapan Kesehatan dan Keselamatan Kerja (K3), guna menciptakan lingkungan kerja yang aman, sehat, produktif, serta menumbuhkan budaya keselamatan sebagai tanggung jawab bersama.',
    'Penyelenggaraan Turnamen Mini Soccer dalam rangka Bulan K3 ini bertujuan untuk:\nMeningkatkan kesadaran karyawan akan pentingnya kesehatan dan keselamatan kerja.\nMendorong gaya hidup sehat melalui aktivitas olahraga.\nMempererat hubungan dan kerja sama antar karyawan lintas departemen.\nMenumbuhkan nilai sportivitas, disiplin, dan kebersamaan di lingkungan kerja.\nMendukung penerapan budaya K3 secara berkelanjutan di PT Indofood CBP Sukses Makmur Tbk.',
    'Dalam rangka memperingati Bulan Kesehatan dan Keselamatan Kerja (K3), PT Indofood CBP Sukses Makmur Tbk menyelenggarakan kegiatan Turnamen Mini Soccer sebagai salah satu bentuk implementasi budaya K3 di lingkungan kerja.\nKegiatan ini bertujuan untuk meningkatkan kesadaran karyawan akan pentingnya kesehatan fisik, keselamatan kerja, serta mempererat kebersamaan dan sportivitas antar karyawan melalui aktivitas olahraga yang positif dan aman.'
);

-- Insert Schedule (Week 1 - Example dates starting from Feb 2, 2026)
INSERT INTO schedule (team_home_id, team_away_id, match_date, match_time, week_number, match_status) VALUES
-- Monday Feb 2
(4, 2, '2026-02-02', '20:00:00', 1, 'scheduled'),
-- Tuesday Feb 3
(8, 9, '2026-02-03', '22:00:00', 1, 'scheduled'),
-- Wednesday Feb 4
(1, 3, '2026-02-04', '19:00:00', 1, 'scheduled'),
-- Thursday Feb 5
(6, 7, '2026-02-05', '21:00:00', 1, 'scheduled'),
-- Friday Feb 6
(10, 11, '2026-02-06', '20:00:00', 1, 'scheduled'),
-- Saturday Feb 7
(12, 4, '2026-02-07', '19:00:00', 1, 'scheduled'),
-- Sunday Feb 8
(2, 5, '2026-02-08', '21:00:00', 1, 'scheduled');

