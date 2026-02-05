# Website BULAN K3 NASIONAL 2026 - Mini Soccer Tournament

Website untuk menampilkan informasi turnamen mini soccer dalam rangka Bulan K3 Nasional 2026.

## Fitur

1. **Hero Section** - Menampilkan judul event, tahun, dan visi event
2. **Scoreboard** - Menampilkan hasil pertandingan terbaru (dari database)
3. **Team Section** - Carousel menampilkan semua tim yang berpartisipasi
4. **View Players** - Modal untuk melihat daftar pemain dari setiap tim

## Instalasi

### 1. Persyaratan
- XAMPP (PHP 7.4+ dan MySQL)
- Web browser modern

### 2. Setup Database

1. Buka phpMyAdmin: `http://localhost/phpmyadmin`
2. Import file `database/schema.sql` untuk membuat struktur database
3. Import file `database/sample_data.sql` untuk data sample
4. Atau ikuti instruksi lengkap di `database/README.md`

### 3. Konfigurasi Database

Edit file `config/db.php` jika diperlukan:
```php
define('DB_HOST', 'localhost');
define('DB_USER', 'root');
define('DB_PASS', '');
define('DB_NAME', 'bulan_k3_2026');
```

### 4. Akses Website

Buka browser dan akses:
```
http://localhost/Web-BulanK3/
```

## Struktur Folder

```
Web-BulanK3/
├── api/                    # API endpoints
│   ├── get_teams.php
│   ├── get_players.php
│   └── get_matches.php
├── assets/
│   ├── css/
│   │   └── style.css
│   ├── images/             # Logo dan gambar tim
│   └── js/
│       └── script.js
├── config/
│   └── db.php             # Konfigurasi database
├── database/
│   ├── schema.sql         # Struktur database
│   ├── sample_data.sql    # Data sample
│   └── README.md          # Instruksi database
├── includes/
│   └── functions.php      # Fungsi-fungsi PHP
├── index.php              # Halaman utama
└── README.md              # File ini
```

## Database Schema

### Tabel: teams
- Menyimpan data klub football

### Tabel: players
- Menyimpan data pemain dari setiap tim

### Tabel: matches
- Menyimpan data pertandingan dan skor

### Tabel: event_info
- Menyimpan informasi event K3

## API Endpoints

- `api/get_teams.php` - Mengambil semua data tim
- `api/get_players.php?team_code=xxx` - Mengambil data pemain berdasarkan team code
- `api/get_matches.php` - Mengambil semua data pertandingan

## Penggunaan

1. **Melihat Scoreboard**: Scroll ke bawah dari halaman utama
2. **Melihat Tim**: Scroll ke section Team, gunakan panah untuk navigasi atau tunggu auto-scroll
3. **Melihat Pemain**: Klik tombol "LIHAT PEMAIN" pada card tim

## Catatan

- Pastikan semua gambar tim sudah ada di folder `assets/images/`
- Pastikan database sudah diimport sebelum menggunakan website
- Website responsive untuk mobile dan desktop

## Support

Untuk pertanyaan atau masalah, silakan hubungi developer.

