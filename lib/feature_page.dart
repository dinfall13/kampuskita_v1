import 'package:flutter/material.dart';
import 'data_modul.dart';
import 'profile_page.dart';

class FeaturePage extends StatefulWidget {
  final String initialTab;

  const FeaturePage({
    super.key,
    this.initialTab = 'Layanan Akademik',
  });

  @override
  State<FeaturePage> createState() => _FeaturePageState();
}

class _FeaturePageState extends State<FeaturePage> {
  // 1. List penyimpanan sementara berisi mock data awal (Read)
  final List<DataModul> _items = [
    DataModul(
      id: '1',
      title: 'Pemrograman Mobile (Flutter)',
      scheduleOrDetail: 'Senin, 08:00 - 10:30 WIB • Lab Komputer 2',
      category: 'Jadwal Kuliah',
    ),
    DataModul(
      id: '2',
      title: 'Basis Data Lanjut',
      scheduleOrDetail: 'Rabu, 10:30 - 13:00 WIB • Ruang B.304',
      category: 'Jadwal Kuliah',
    ),
    DataModul(
      id: '3',
      title: 'Tugas Praktikum Bab 6 (CRUD)',
      scheduleOrDetail: 'Deadline: Minggu, 23:59 WIB',
      category: 'Tugas Akademik',
    ), DataModul(
      id: '4',
      title: 'Uts Pemrograman Bergerak',
      scheduleOrDetail: 'Selasa, 07.50 - 11.09 | Lab Komputer Cc lt 04-1A',
      category: 'UTS',
    ),
  ];

  // Menampilkan feedback SnackBar setelah aksi CRUD
  void _showFeedback(String message, {bool isDelete = false}) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
        backgroundColor: isDelete ? Colors.orange.shade800 : Colors.green.shade700,
        behavior: SnackBarBehavior.floating,
        duration: const Duration(seconds: 2),
      ),
    );
  }

  // Dialog Form untuk Tambah (Create) & Ubah Data (Update)
  void _showItemFormDialog({DataModul? existingItem, int? index}) {
    final isEdit = existingItem != null;
    final titleController = TextEditingController(
      text: isEdit ? existingItem.title : '',
    );
    final detailController = TextEditingController(
      text: isEdit ? existingItem.scheduleOrDetail : '',
    );
    String selectedCategory =
        isEdit ? existingItem.category : 'Jadwal Kuliah';

    showDialog(
      context: context,
      builder: (context) {
        return StatefulBuilder(
          builder: (context, setDialogState) {
            return AlertDialog(
              title: Text(isEdit ? 'Ubah Data Akademik' : 'Tambah Data Baru'),
              content: SingleChildScrollView(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    TextField(
                      controller: titleController,
                      decoration: const InputDecoration(
                        labelText: 'Judul Mata Kuliah / Agenda',
                        border: OutlineInputBorder(),
                      ),
                    ),
                    const SizedBox(height: 12),
                    TextField(
                      controller: detailController,
                      decoration: const InputDecoration(
                        labelText: 'Waktu / Ruangan / Keterangan',
                        border: OutlineInputBorder(),
                      ),
                    ),
                    const SizedBox(height: 12),
                    DropdownButtonFormField<String>(
                      initialValue: selectedCategory,
                      decoration: const InputDecoration(
                        labelText: 'Kategori',
                        border: OutlineInputBorder(),
                      ),
                      items: const [
                        DropdownMenuItem(
                          value: 'Jadwal Kuliah',
                          child: Text('Jadwal Kuliah'),
                        ),
                        DropdownMenuItem(
                          value: 'Tugas Akademik',
                          child: Text('Tugas Akademik'),
                        ),
                        DropdownMenuItem(
                          value: 'Pengumuman',
                          child: Text('Pengumuman'),
                        ),
                      ],
                      onChanged: (val) {
                        if (val != null) {
                          setDialogState(() {
                            selectedCategory = val;
                          });
                        }
                      },
                    ),
                  ],
                ),
              ),
              actions: [
                TextButton(
                  onPressed: () => Navigator.pop(context),
                  child: const Text('Batal'),
                ),
                ElevatedButton(
                  onPressed: () {
                    final title = titleController.text.trim();
                    final detail = detailController.text.trim();

                    if (title.isEmpty || detail.isEmpty) {
                      return;
                    }

                    setState(() {
                      if (isEdit && index != null) {
                        // Proses UPDATE
                        _items[index].title = title;
                        _items[index].scheduleOrDetail = detail;
                        _items[index].category = selectedCategory;
                      } else {
                        // Proses CREATE
                        _items.add(
                          DataModul(
                            id: DateTime.now().millisecondsSinceEpoch.toString(),
                            title: title,
                            scheduleOrDetail: detail,
                            category: selectedCategory,
                          ),
                        );
                      }
                    });

                    Navigator.pop(context);
                    _showFeedback(
                      isEdit
                          ? 'Data "$title" berhasil diperbarui!'
                          : 'Data "$title" berhasil ditambahkan!',
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFF1565C0),
                    foregroundColor: Colors.white,
                  ),
                  child: Text(isEdit ? 'Simpan Perubahan' : 'Tambah'),
                ),
              ],
            );
          },
        );
      },
    );
  }

  // Proses DELETE data
  void _deleteItem(int index) {
    final removedTitle = _items[index].title;
    setState(() {
      _items.removeAt(index);
    });
    _showFeedback('Data "$removedTitle" telah dihapus.', isDelete: true);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.initialTab),
        backgroundColor: const Color(0xFF1565C0),
        foregroundColor: Colors.white,
        actions: [
          // Tombol cepat untuk mengosongkan daftar (uji Empty State)
          if (_items.isNotEmpty)
            IconButton(
              tooltip: 'Kosongkan Semua Data',
              icon: const Icon(Icons.delete_sweep),
              onPressed: () {
                setState(() {
                  _items.clear();
                });
                _showFeedback('Semua data dikosongkan.', isDelete: true);
              },
            ),
        ],
      ),
      // Tombol Tambah Data (Create)
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () => _showItemFormDialog(),
        backgroundColor: const Color(0xFF1565C0),
        foregroundColor: Colors.white,
        icon: const Icon(Icons.add),
        label: const Text('Tambah Data'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Daftar ${widget.initialTab}',
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Chip(
                  label: Text('Total: ${_items.length}'),
                  backgroundColor: Colors.blue.shade50,
                ),
              ],
            ),
            const SizedBox(height: 12),

            // 2. Tampilan Empty State vs ListView.builder
            Expanded(
              child: _items.isEmpty
                  ? Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.inbox_outlined,
                            size: 72,
                            color: Colors.grey.shade400,
                          ),
                          const SizedBox(height: 12),
                          const Text(
                            'Belum Ada Data Tersimpan',
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              color: Colors.black54,
                            ),
                          ),
                          const SizedBox(height: 6),
                          const Text(
                            'Tekan tombol "+ Tambah Data" di bawah untuk menambahkan jadwal atau agenda baru.',
                            textAlign: TextAlign.center,
                            style: TextStyle(color: Colors.black45),
                          ),
                        ],
                      ),
                    )
                  : ListView.builder(
                      itemCount: _items.length,
                      itemBuilder: (context, index) {
                        final item = _items[index];
                        return Card(
                          margin: const EdgeInsets.only(bottom: 10),
                          elevation: 1,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: ListTile(
                            leading: CircleAvatar(
                              backgroundColor: Colors.blue.shade50,
                              child: const Icon(
                                Icons.menu_book,
                                color: Color(0xFF1565C0),
                              ),
                            ),
                            title: Text(
                              item.title,
                              style: const TextStyle(fontWeight: FontWeight.bold),
                            ),
                            subtitle: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const SizedBox(height: 2),
                                Text(item.scheduleOrDetail),
                                const SizedBox(height: 4),
                                Container(
                                  padding: const EdgeInsets.symmetric(
                                    horizontal: 8,
                                    vertical: 2,
                                  ),
                                  decoration: BoxDecoration(
                                    color: Colors.blue.shade50,
                                    borderRadius: BorderRadius.circular(6),
                                  ),
                                  child: Text(
                                    item.category,
                                    style: const TextStyle(
                                      fontSize: 11,
                                      color: Color(0xFF1565C0),
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            isThreeLine: true,
                            // Tombol Aksi Update & Delete per baris
                            trailing: Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                IconButton(
                                  tooltip: 'Ubah Data',
                                  icon: const Icon(
                                    Icons.edit,
                                    color: Colors.blue,
                                  ),
                                  onPressed: () => _showItemFormDialog(
                                    existingItem: item,
                                    index: index,
                                  ),
                                ),
                                IconButton(
                                  tooltip: 'Hapus Data',
                                  icon: const Icon(
                                    Icons.delete,
                                    color: Colors.red,
                                  ),
                                  onPressed: () => _deleteItem(index),
                                ),
                              ],
                            ),
                          ),
                        );
                      },
                    ),
            ),

            const SizedBox(height: 8),
            // Navigasi ke halaman lain tetap terjaga
            Row(
              children: [
                Expanded(
                  child: OutlinedButton.icon(
                    onPressed: () => Navigator.pop(context),
                    icon: const Icon(Icons.arrow_back),
                    label: const Text('Beranda'),
                  ),
                ),
                const SizedBox(width: 8),
                Expanded(
                  child: ElevatedButton.icon(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const ProfilePage(),
                        ),
                      );
                    },
                    icon: const Icon(Icons.person),
                    label: const Text('Profil'),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFF1565C0),
                      foregroundColor: Colors.white,
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 56), // Ruang agar tidak tertutup FloatingActionButton
          ],
        ),
      ),
    );
  }
}