-- Insert/Update schedule untuk WEEK 1-5 dengan 12 teams hosting
-- Menggunakan team_code lookups (aman)
-- Run di hosting database:
-- mysql -u <user> -p -h sql306.byetcluster.com if0_41118739_u123456789_bulank3 < insert_schedule_hosting.sql

-- Backup schedule lama dulu jika perlu
-- ALTER TABLE schedule RENAME TO schedule_backup;

-- Atau hapus schedule lama:
-- TRUNCATE TABLE schedule;

-- Insert schedule WEEK 1-7
INSERT INTO schedule (team_home_id, team_away_id, match_date, match_time, week_number, match_status) VALUES

-- WEEK 1: 21 Jan 2026
((SELECT id FROM teams WHERE team_code='ppic'), (SELECT id FROM teams WHERE team_code='laminasi'), '2026-01-21', '19:00:00', 1, 'scheduled'),
((SELECT id FROM teams WHERE team_code='security'), (SELECT id FROM teams WHERE team_code='warehouse'), '2026-01-21', '19:00:00', 1, 'scheduled'),

-- WEEK 2: 28 Jan 2026
((SELECT id FROM teams WHERE team_code='supporting'), (SELECT id FROM teams WHERE team_code='hr'), '2026-01-28', '19:00:00', 2, 'scheduled'),
((SELECT id FROM teams WHERE team_code='quality'), (SELECT id FROM teams WHERE team_code='btp'), '2026-01-28', '19:00:00', 2, 'scheduled'),

-- WEEK 3: 04 Feb 2026
((SELECT id FROM teams WHERE team_code='teknik'), (SELECT id FROM teams WHERE team_code='laminasi'), '2026-02-04', '19:00:00', 3, 'scheduled'),
((SELECT id FROM teams WHERE team_code='printing'), (SELECT id FROM teams WHERE team_code='security'), '2026-02-04', '19:00:00', 3, 'scheduled'),

-- WEEK 4: 11 Feb 2026
((SELECT id FROM teams WHERE team_code='slitter'), (SELECT id FROM teams WHERE team_code='supporting'), '2026-02-11', '19:00:00', 4, 'scheduled'),
((SELECT id FROM teams WHERE team_code='puk'), (SELECT id FROM teams WHERE team_code='quality'), '2026-02-11', '19:00:00', 4, 'scheduled'),

-- WEEK 5: 18 Feb 2026 (Puasa)
((SELECT id FROM teams WHERE team_code='teknik'), (SELECT id FROM teams WHERE team_code='ppic'), '2026-02-18', '19:00:00', 5, 'scheduled'),
((SELECT id FROM teams WHERE team_code='warehouse'), (SELECT id FROM teams WHERE team_code='printing'), '2026-02-18', '19:00:00', 5, 'scheduled'),
((SELECT id FROM teams WHERE team_code='slitter'), (SELECT id FROM teams WHERE team_code='hr'), '2026-02-18', '19:00:00', 5, 'scheduled'),
((SELECT id FROM teams WHERE team_code='btp'), (SELECT id FROM teams WHERE team_code='puk'), '2026-02-18', '19:00:00', 5, 'scheduled'),

-- WEEK 6: 25 Feb 2026 (Semifinal - Placeholder)
((SELECT id FROM teams WHERE team_code='laminasi'), (SELECT id FROM teams WHERE team_code='printing'), '2026-02-25', '18:00:00', 6, 'scheduled'),
((SELECT id FROM teams WHERE team_code='warehouse'), (SELECT id FROM teams WHERE team_code='btp'), '2026-02-25', '20:00:00', 6, 'scheduled'),

-- WEEK 7: 04 Mar 2026 (3rd Place & Final - Placeholder)
((SELECT id FROM teams WHERE team_code='teknik'), (SELECT id FROM teams WHERE team_code='supporting'), '2026-03-04', '18:00:00', 7, 'scheduled'),
((SELECT id FROM teams WHERE team_code='laminasi'), (SELECT id FROM teams WHERE team_code='btp'), '2026-03-04', '20:00:00', 7, 'scheduled');

-- End

-- End
