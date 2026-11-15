# KampusKita App

Aplikasi informasi akademik mahasiswa berbasis Flutter untuk memudahkan akses jadwal perkuliahan, tugas, dan pengumuman kampus dalam satu platform.

## Fitur Saat Ini (v0.0)
- Tampilan halaman beranda (*Home*) dengan identitas aplikasi.
- Kartu pratinjau informasi untuk **Jadwal Perkuliahan** dan **Pengumuman Kampus**.
- Desain antarmuka responsif berbasis Material Design 3.

## Tangkapan Layar
![Tampilan Awal v0.0](assets/screenshots/v0_home.png)

## Cara Menjalankan Aplikasi
1. Pastikan Flutter SDK sudah terinstal dan terdeteksi (`flutter doctor`).
2. Unduh dependensi proyek dengan perintah:
   ```bash
   flutter pub get

   # KampusKita App (v0.2)

Aplikasi informasi akademik mahasiswa berbasis Flutter yang dilengkapi navigasi antar-layar dan formulir validasi data mahasiswa.

## Fitur Utama
- **Dashboard Akademik (`v0.0`)**: Kartu profil mahasiswa, *grid menu* layanan utama (Jadwal, Nilai, Pengumuman, Presensi), serta daftar pengumuman terbaru.
- **Navigasi 3 Layar (`v0.1`)**: Perpindahan layar terstruktur antara Beranda (`HomePage`), Layanan Akademik (`FeaturePage`), dan Profil (`ProfilePage`) menggunakan `Navigator.push` dan `Navigator.pop`.
- **Form & Validasi Input (`v0.2`)**:
  - Formulir data mahasiswa (`Nama Lengkap`, `NIM`, dan `Email`) menggunakan `Form`, `GlobalKey`, dan `TextFormField`.
  - Validasi wajib diisi, panjang karakter minimal, dan pengecekan format (angka NIM & format email `@`).
  - Manajemen state sederhana menggunakan `StatefulWidget` & `setState` serta umpan balik langsung melalui `SnackBar`.

## Tangkapan Layar
### Tampilan Awal (v0.0)
![Tampilan Awal v0.0]

### Validasi Form & User Feedback (v0.2)
![Validasi Error Form]
![Validasi Sukses Form]

## Cara Menjalankan Aplikasi
1. Pastikan Flutter SDK sudah terinstal dan terdeteksi (`flutter doctor`).
2. Unduh dependensi proyek:
   ```bash
   flutter pub get