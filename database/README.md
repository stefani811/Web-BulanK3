# Database Setup untuk BULAN K3 NASIONAL 2026

## Instruksi Setup Database

### 1. Buat Database di phpMyAdmin atau MySQL

Buka phpMyAdmin di browser: `http://localhost/phpmyadmin`

### 2. Import Database Schema

**Cara 1: Melalui phpMyAdmin**
1. Pilih tab "Import"
2. Klik "Choose File" dan pilih file `schema.sql`
3. Klik "Go" untuk menjalankan import

**Cara 2: Melalui Command Line**
```bash
mysql -u root -p < schema.sql
```

### 3. Import Sample Data

**Cara 1: Melalui phpMyAdmin**
1. Pilih database `bulan_k3_2026`
2. Pilih tab "Import"
3. Klik "Choose File" dan pilih file `sample_data.sql`
4. Klik "Go" untuk menjalankan import

**Cara 2: Melalui Command Line**
```bash
mysql -u root -p bulan_k3_2026 < sample_data.sql
```

### 4. Verifikasi Database

Setelah import, pastikan tabel-tabel berikut sudah dibuat:
- `teams` - Data klub football
- `players` - Data pemain
- `matches` - Data pertandingan/scoreboard
- `event_info` - Informasi event K3

## Struktur Database

### Tabel: teams
- `id` - Primary key
- `team_code` - Kode unik tim (btp, laminasi, ppic, dll)
- `team_name` - Nama lengkap tim
- `team_logo` - Path ke file logo tim

### Tabel: players
- `id` - Primary key
- `team_id` - Foreign key ke teams
- `player_name` - Nama lengkap pemain
- `player_number` - Nomor punggung
- `position` - Posisi pemain (GK, DF, MF, FW)

### Tabel: matches
- `id` - Primary key
- `team_home_id` - ID tim tuan rumah
- `team_away_id` - ID tim tamu
- `score_home` - Skor tim tuan rumah
- `score_away` - Skor tim tamu
- `match_date` - Tanggal dan waktu pertandingan
- `match_status` - Status (scheduled, ongoing, finished)

### Tabel: event_info
- `id` - Primary key
- `event_title` - Judul event
- `event_year` - Tahun event
- `event_vision` - Visi event
- `event_description` - Deskripsi event
- `about_k3` - Penjelasan tentang Bulan K3
- `event_purpose` - Tujuan event

## Konfigurasi Database

Edit file `config/db.php` jika diperlukan:
- `DB_HOST` - Host database (default: localhost)
- `DB_USER` - Username database (default: root)
- `DB_PASS` - Password database (default: kosong)
- `DB_NAME` - Nama database (default: bulan_k3_2026)

## API Endpoints

Setelah database setup, API berikut tersedia:
- `api/get_teams.php` - Mengambil semua data tim
- `api/get_players.php?team_code=xxx` - Mengambil data pemain berdasarkan team code
- `api/get_matches.php` - Mengambil semua data pertandingan

