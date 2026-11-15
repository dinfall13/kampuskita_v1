# Catatan Penggunaan AI (AI Usage Log)

Dokumen ini mencatat pemanfaatan kecerdasan buatan (AI) selama pengembangan **KampusKita App (v0.0)**.

## Bagian yang Dibantu AI
- Meminta Bantuan untuk membantu membuat Pembuatan draf dokumentasi teknis (`README.md` dan `CHANGELOG.md`).
- Penyesuaian kode pengujian unit pada `test/widget_test.dart`.

## Penyesuaian yang Dilakukan Secara Mandiri
- Menyesuaikan teks deskripsi, judul, dan pemilihan ikon agar relevan dengan konsep aplikasi informasi akademik mahasiswa (**KampusKita**).
- Mengatur jarak (*padding* dan `SizedBox`) serta skema warna agar proporsional saat dijalankan pada tampilan layar lebar di Google Chrome.

# Catatan Penggunaan AI (AI Usage Log)

## Versi v0.2 (Form & Validasi Input)
- **Bagian yang Dibantu AI:** Penyusunan struktur `Form` dengan `GlobalKey<FormState>`, fungsi logika `validator` pada `TextFormField`, serta penyusunan dokumentasi pembaruan `README.md` dan `CHANGELOG.md`.
- **Penyesuaian Mandiri:** Menyesuaikan aturan validasi agar sesuai dengan kebutuhan data mahasiswa (NIM minimal 8 digit angka dan validasi domain email), mengatur tampilan kartu status `setState`, serta menguji skenario input kosong maupun input valid secara langsung pada Flutter Web (Chrome).