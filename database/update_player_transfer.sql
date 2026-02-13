-- Update Transfer Pemain & Hapus Team HSE
-- Run di: if0_41118739_bulank3
-- mysql -u <user> -p -h sql306.byetcluster.com if0_41118739_bulank3 < update_player_transfer.sql

-- ============================================
-- STEP 1: TRANSFER PEMAIN KE PUK
-- ============================================

-- Sul Assari (dari Slitter ke PUK)
UPDATE players SET team_id=(SELECT id FROM teams WHERE team_code='puk')
WHERE player_name='Sul Assari';

-- Dadang Darusalam (dari Laminasi ke PUK)
UPDATE players SET team_id=(SELECT id FROM teams WHERE team_code='puk')
WHERE player_name='Dadang Darusalam';

-- Dodi Ariaji (dari Laminasi ke PUK)
UPDATE players SET team_id=(SELECT id FROM teams WHERE team_code='puk')
WHERE player_name='Dodi Ariaji';

-- Zio Erianda (dari Slitter ke PUK)
UPDATE players SET team_id=(SELECT id FROM teams WHERE team_code='puk')
WHERE player_name='Zio Erianda';

-- Deni Bahtiar (dari Laminasi ke PUK)
UPDATE players SET team_id=(SELECT id FROM teams WHERE team_code='puk')
WHERE player_name='Deni Bahtiar';

-- Masturo (dari Printing ke PUK)
UPDATE players SET team_id=(SELECT id FROM teams WHERE team_code='puk')
WHERE player_name='Masturo';

-- Iskandar (dari Slitter ke PUK)
UPDATE players SET team_id=(SELECT id FROM teams WHERE team_code='puk')
WHERE player_name='Iskandar';

-- Nurwenda (dari Printing ke PUK)
UPDATE players SET team_id=(SELECT id FROM teams WHERE team_code='puk')
WHERE player_name='Nurwenda';

-- Erwin Irawan (dari Rewinder ke PUK)
UPDATE players SET team_id=(SELECT id FROM teams WHERE team_code='puk')
WHERE player_name='Erwin Irawan';

-- Tri Dwiyono (dari QC ke PUK)
UPDATE players SET team_id=(SELECT id FROM teams WHERE team_code='puk')
WHERE player_name='Tri Dwiyono';

-- Supriyatna (dari Slitter ke PUK)
UPDATE players SET team_id=(SELECT id FROM teams WHERE team_code='puk')
WHERE player_name='Supriyatna';

-- ============================================
-- STEP 2: TRANSFER PEMAIN HSE KE HR
-- ============================================

-- Faiz Erlangga (dari HSE ke HR)
UPDATE players SET team_id=(SELECT id FROM teams WHERE team_code='hr')
WHERE player_name='Faiz Erlangga' AND team_id=(SELECT id FROM teams WHERE team_code='hse');

-- Raden Hanif (dari HSE ke HR)
UPDATE players SET team_id=(SELECT id FROM teams WHERE team_code='hr')
WHERE player_name='Raden Hanif' AND team_id=(SELECT id FROM teams WHERE team_code='hse');

-- ============================================
-- STEP 3: DELETE REMAINING HSE PLAYERS (if any)
-- ============================================

DELETE FROM players WHERE team_id=(SELECT id FROM teams WHERE team_code='hse');

-- ============================================
-- STEP 4: DELETE HSE TEAM
-- ============================================

DELETE FROM teams WHERE team_code='hse';

-- End
