import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('KampusKita'),
        backgroundColor: Colors.blue.shade100,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const Icon(
              Icons.school,
              size: 80,
              color: Colors.blue,
            ),
            const SizedBox(height: 16),
            const Text(
              'Selamat Datang di KampusKita',
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            const Text(
              'Aplikasi Informasi Akademik, Jadwal Kuliah, dan Pengumuman Kampus.',
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 15, color: Colors.black54),
            ),
            const SizedBox(height: 24),
            const Card(
              elevation: 2,
              child: ListTile(
                leading: Icon(Icons.calendar_today, color: Colors.blue),
                title: Text('Jadwal Perkuliahan'),
                subtitle: Text('Cek jadwal mata kuliah harian Anda.'),
              ),
            ),
            const SizedBox(height: 8),
            const Card(
              elevation: 2,
              child: ListTile(
                leading: Icon(Icons.campaign, color: Colors.blue),
                title: Text('Pengumuman Kampus'),
                subtitle: Text('Informasi terbaru seputar kegiatan akademik.'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}