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
INSERT INTO event_info (event_title, event_year, event_vision, event_description, about_k3, event_purpose) VALUES
(
    'BULAN K3 NASIONAL',
    2026,
    'Membangun Ekosistem Pengelolaan K3 Nasional yang Profesional, Andal, dan Kolaboratif',
    'Bulan K3 Nasional 2026 adalah event tahunan yang diselenggarakan untuk meningkatkan kesadaran dan pemahaman tentang Keselamatan dan Kesehatan Kerja (K3) di seluruh Indonesia. Event ini diisi dengan berbagai kegiatan termasuk turnamen mini soccer antar divisi.',
    'Bulan K3 (Keselamatan dan Kesehatan Kerja) Nasional adalah program tahunan yang dicanangkan oleh pemerintah Indonesia untuk meningkatkan kesadaran dan komitmen seluruh lapisan masyarakat, khususnya dunia kerja, terhadap pentingnya penerapan K3. Program ini bertujuan untuk menciptakan budaya keselamatan dan kesehatan kerja yang berkelanjutan di seluruh sektor industri dan organisasi di Indonesia.',
    'Tujuan utama diadakan event Bulan K3 Nasional 2026 ini adalah:\n1. Meningkatkan kesadaran dan pemahaman tentang pentingnya K3 di tempat kerja\n2. Membangun budaya keselamatan yang kuat di seluruh organisasi\n3. Meningkatkan kolaborasi antar divisi melalui kegiatan olahraga\n4. Meningkatkan semangat kebersamaan dan kerja tim\n5. Mempromosikan gaya hidup sehat melalui olahraga\n6. Memberikan edukasi tentang K3 melalui kegiatan yang menyenangkan dan interaktif'
);

