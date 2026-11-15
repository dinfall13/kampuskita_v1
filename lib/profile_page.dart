import 'package:flutter/material.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  // 1. GlobalKey untuk mengelola state dan validasi Form
  final _formKey = GlobalKey<FormState>();

  // 2. TextEditingController untuk menangkap nilai input
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _nimController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();

  // 3. State sederhana untuk menampilkan ringkasan data yang tersimpan
  String _savedSummary = 'Belum ada data profil/presensi yang disimpan.';

  @override
  void dispose() {
    // Membersihkan controller saat halaman ditutup
    _nameController.dispose();
    _nimController.dispose();
    _emailController.dispose();
    super.dispose();
  }

  void _submitForm() {
    // Menjalankan seluruh validator pada TextFormField
    if (_formKey.currentState!.validate()) {
      setState(() {
        _savedSummary =
            'Tersimpan: ${_nameController.text.trim()} (${_nimController.text.trim()}) • ${_emailController.text.trim()}';
      });

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(
            'Data berhasil divalidasi & disimpan untuk ${_nameController.text.trim()}!',
          ),
          backgroundColor: Colors.green.shade700,
          behavior: SnackBarBehavior.floating,
        ),
      );
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: const Text(
            'Periksa kembali kolom yang masih berwarna merah!',
          ),
          backgroundColor: Colors.red.shade700,
          behavior: SnackBarBehavior.floating,
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Form Profil & Presensi'),
        backgroundColor: const Color(0xFF1565C0),
        foregroundColor: Colors.white,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const Text(
                'Lengkapi Data Mahasiswa',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 6),
              const Text(
                'Semua kolom wajib diisi sesuai format yang ditentukan.',
                style: TextStyle(color: Colors.black54),
              ),
              const SizedBox(height: 16),

              // Input 1: Nama Lengkap (Wajib diisi + Panjang minimal 3 karakter)
              TextFormField(
                controller: _nameController,
                decoration: const InputDecoration(
                  labelText: 'Nama Lengkap',
                  hintText: 'Contoh: Naufai Daulah Imana',
                  prefixIcon: Icon(Icons.person),
                  border: OutlineInputBorder(),
                  filled: true,
                  fillColor: Colors.white,
                ),
                validator: (value) {
                  if (value == null || value.trim().isEmpty) {
                    return 'Nama lengkap wajib diisi.';
                  }
                  if (value.trim().length < 3) {
                    return 'Nama minimal harus terdiri dari 3 karakter.';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 14),

              // Input 2: NIM (Wajib diisi + Panjang minimal 8 digit & harus angka)
              TextFormField(
                controller: _nimController,
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(
                  labelText: 'NIM Mahasiswa',
                  hintText: 'Contoh: 2026000123',
                  prefixIcon: Icon(Icons.badge),
                  border: OutlineInputBorder(),
                  filled: true,
                  fillColor: Colors.white,
                ),
                validator: (value) {
                  if (value == null || value.trim().isEmpty) {
                    return 'NIM wajib diisi.';
                  }
                  if (value.trim().length < 8) {
                    return 'NIM minimal harus terdiri dari 8 digit angka.';
                  }
                  if (int.tryParse(value.trim()) == null) {
                    return 'NIM hanya boleh berisi angka.';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 14),

              // Input 3: Email Kampus (Wajib diisi + Format mengandung @ dan titik)
              TextFormField(
                controller: _emailController,
                keyboardType: TextInputType.emailAddress,
                decoration: const InputDecoration(
                  labelText: 'Email Mahasiswa',
                  hintText: 'Contoh: naufai@kampuskita.ac.id',
                  prefixIcon: Icon(Icons.email),
                  border: OutlineInputBorder(),
                  filled: true,
                  fillColor: Colors.white,
                ),
                validator: (value) {
                  if (value == null || value.trim().isEmpty) {
                    return 'Alamat email wajib diisi.';
                  }
                  if (!value.contains('@') || !value.contains('.')) {
                    return 'Format email tidak valid (harus mengandung @ dan domain).';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 20),

              // Tombol Submit Form
              ElevatedButton.icon(
                onPressed: _submitForm,
                icon: const Icon(Icons.save),
                label: const Text('Validasi & Simpan Data'),
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF1565C0),
                  foregroundColor: Colors.white,
                  padding: const EdgeInsets.symmetric(vertical: 14),
                ),
              ),
              const SizedBox(height: 8),

              // Tombol Kembali (Navigator.pop)
              OutlinedButton.icon(
                onPressed: () {
                  Navigator.pop(context);
                },
                icon: const Icon(Icons.arrow_back),
                label: const Text('Kembali'),
                style: OutlinedButton.styleFrom(
                  padding: const EdgeInsets.symmetric(vertical: 14),
                ),
              ),
              const SizedBox(height: 20),

              // Card Status State Sederhana
              Card(
                color: Colors.blue.shade50,
                elevation: 0,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                  side: BorderSide(color: Colors.blue.shade200),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(14),
                  child: Row(
                    children: [
                      const Icon(Icons.info_outline, color: Color(0xFF1565C0)),
                      const SizedBox(width: 10),
                      Expanded(
                        child: Text(
                          _savedSummary,
                          style: const TextStyle(
                            fontSize: 13,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}