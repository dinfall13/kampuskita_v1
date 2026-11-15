### 4. Pembaruan File `CHANGELOG.md` dengan Entri `v0.2` (Poin 8)
Buka **`CHANGELOG.md`**, lalu tambahkan entri versi **`[0.2.0]`** di bagian paling atas:

```markdown
# Changelog

Semua perubahan penting pada proyek **KampusKita App** dicatat dalam berkas ini.

## [0.2.0] - 2026-11-15

### Added
- Mengimplementasikan widget `Form` dengan `GlobalKey<FormState>` dan 3 `TextFormField` (Nama Lengkap, NIM, Email) pada `lib/profile_page.dart`.
- Menambahkan validasi wajib diisi, validasi panjang minimal karakter, validasi format angka untuk NIM, serta validasi format email (`@` dan `.`).
- Menerapkan pengelolaan state lokal menggunakan `StatefulWidget` dan `setState` untuk memperbarui kartu ringkasan data tersimpan secara dinamis.
- Menambahkan umpan balik visual menggunakan `SnackBar` (hijau saat validasi berhasil dan merah saat terjadi kesalahan input) serta pembersihan memori controller melalui `dispose()`.

## [0.1.0] - 2026-11-15

### Added
- Implementasi UI Blueprint KampusKita dan navigasi 3 layar terhubung (`HomePage`, `FeaturePage`, `ProfilePage`) menggunakan `Navigator.push` dan `Navigator.pop`.

## [0.0.0] - 2026-11-15

### Added
- Struktur awal aplikasi (`lib/main.dart` dan `lib/home_page.dart`) serta tampilan *prototype* beranda.