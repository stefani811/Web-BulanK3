# Panduan Hosting Gratis untuk Website BULAN K3 NASIONAL 2026

Website ini menggunakan **PHP + MySQL**, jadi perlu hosting yang support kedua teknologi tersebut.

## 🎯 Rekomendasi Hosting Gratis Terbaik

### 1. **InfinityFree** ⭐ (Paling Direkomendasikan)
- **URL**: https://www.infinityfree.net
- **Fitur**:
  - ✅ Unlimited bandwidth & storage
  - ✅ Support PHP 7.4+ dan MySQL
  - ✅ cPanel access
  - ✅ Free SSL certificate
  - ✅ No ads (untuk website kamu)
  - ✅ Subdomain gratis: `namasitus.epizy.com`
- **Cara Setup**:
  1. Daftar di InfinityFree
  2. Buat hosting account
  3. Upload semua file website ke folder `htdocs` via File Manager atau FTP
  4. Import database via phpMyAdmin (ada di cPanel)
  5. Update `config/db.php` dengan kredensial database dari InfinityFree

### 2. **000webhost**
- **URL**: https://www.000webhost.com
- **Fitur**:
  - ✅ 300 MB storage
  - ✅ Support PHP & MySQL
  - ✅ Free SSL
  - ✅ Subdomain: `namasitus.000webhostapp.com`
- **Keterbatasan**: Storage terbatas, tapi cukup untuk website ini

### 3. **Freehostia**
- **URL**: https://www.freehostia.com
- **Fitur**:
  - ✅ 250 MB storage
  - ✅ Support PHP & MySQL
  - ✅ Free subdomain
- **Keterbatasan**: Storage lebih kecil

## 📋 Langkah-Langkah Upload ke InfinityFree

### Step 1: Persiapan File
1. Pastikan semua file website sudah lengkap
2. Zip semua file (kecuali folder `database` - tidak perlu diupload)
3. File yang perlu diupload:
   - `index.php`
   - `config/`
   - `includes/`
   - `api/`
   - `assets/` (css, js, images, fonts)
   - `GambarBagianLatarBelakang/`

### Step 2: Upload ke InfinityFree
1. Login ke InfinityFree
2. Masuk ke **Control Panel**
3. Klik **File Manager**
4. Masuk ke folder `htdocs`
5. Upload semua file website (atau extract zip file)

### Step 3: Setup Database
1. Di Control Panel, klik **MySQL Databases**
2. Buat database baru (contoh: `u123456789_bulank3`)
3. Buat user database dan password
4. Catat:
   - Database name
   - Database username
   - Database password
   - Database host (biasanya `localhost` atau `sqlXXX.epizy.com`)

### Step 4: Import Database
1. Klik **phpMyAdmin** di Control Panel
2. Pilih database yang baru dibuat
3. Klik tab **Import**
4. Upload file `database/schema.sql` (untuk membuat tabel)
5. Upload file `database/sample_data.sql` (untuk data sample)

### Step 5: Update Konfigurasi
1. Edit file `config/db.php` via File Manager
2. Update dengan kredensial dari InfinityFree:
```php
define('DB_HOST', 'localhost'); // atau sqlXXX.epizy.com
define('DB_USER', 'username_dari_infinityfree');
define('DB_PASS', 'password_dari_infinityfree');
define('DB_NAME', 'nama_database_dari_infinityfree');
```

### Step 6: Test Website
1. Buka website di subdomain yang diberikan (contoh: `namasitus.epizy.com`)
2. Pastikan semua section muncul dengan benar
3. Test fitur: Scoreboard, Team, Leaderboard, Schedule

## 🔧 Tips Penting

### 1. Path Gambar
- Pastikan path gambar benar (relatif dari root)
- Contoh: `assets/images/hero-team.jpg` (bukan `C:\xampp\htdocs\...`)

### 2. Permission File
- File PHP: `644` atau `755`
- Folder: `755`

### 3. Error Handling
- Jika ada error, cek error log di Control Panel
- Pastikan PHP version support (minimal PHP 7.4)

### 4. Backup
- Selalu backup database sebelum update
- Download backup via phpMyAdmin secara berkala

## 🌐 Alternatif: VPS Gratis (Advanced)

Jika ingin lebih kontrol, bisa pakai **Oracle Cloud Free Tier**:
- **URL**: https://www.oracle.com/cloud/free/
- **Fitur**: 
  - ✅ 2 VM instances gratis selamanya
  - ✅ 10 TB bandwidth/bulan
  - ✅ Install sendiri: Apache, PHP, MySQL
- **Keterbatasan**: Perlu setup manual (lebih kompleks)

## 📱 Domain Custom (Opsional)

Jika ingin pakai domain sendiri (contoh: `bulank3.com`):
- Beli domain di: Namecheap, GoDaddy, atau Niagahoster
- Point DNS ke InfinityFree (ada tutorial di InfinityFree)
- Atau pakai Cloudflare (gratis) untuk DNS management

## ✅ Checklist Sebelum Go Live

- [ ] Semua file sudah diupload
- [ ] Database sudah diimport
- [ ] `config/db.php` sudah diupdate
- [ ] Semua gambar muncul dengan benar
- [ ] Test di mobile browser
- [ ] Test semua fitur (Scoreboard, Team, Leaderboard, Schedule)
- [ ] SSL sudah aktif (untuk HTTPS)

## 🆘 Troubleshooting

**Website blank/error:**
- Cek error log di Control Panel
- Pastikan PHP version support
- Cek syntax error di file PHP

**Database connection error:**
- Pastikan kredensial di `config/db.php` benar
- Pastikan database sudah dibuat
- Cek database host (bisa jadi bukan `localhost`)

**Gambar tidak muncul:**
- Cek path gambar (harus relatif)
- Pastikan file gambar sudah diupload
- Cek permission file (harus readable)

**Schedule/Leaderboard kosong:**
- Pastikan database sudah diimport dengan benar
- Cek apakah tabel `schedule` dan `matches` ada datanya
- Test query di phpMyAdmin

---

**Selamat! Website kamu sudah siap dihosting gratis! 🎉**

