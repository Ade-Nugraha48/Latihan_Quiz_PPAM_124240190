import 'package:flutter/material.dart';
import 'bookModels.dart'; // Import model data untuk mendefinisikan tipe data parameter

// StatelessWidget karena kita hanya menampilkan data yang diterima tanpa mengubahnya secara lokal
class DetailPage extends StatelessWidget {
  // Mendefinisikan variabel 'book' yang akan menerima data lemparan (passing data)
  final BookModel book;

  // Constructor wajib mengisi parameter 'book' (required) saat memanggil class ini
  const DetailPage({super.key, required this.book});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(book.title), // Judul appBar diambil dari properti title buku
      ),
      // SingleChildScrollView agar keseluruhan halaman bisa di-scroll secara vertikal
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center, // Memusatkan konten di tengah (horizontal)
          children: [
            // Menampilkan Cover Buku dengan Rounded Corners
            ClipRRect(
              borderRadius: BorderRadius.circular(8.0),
              child: Image.network(
                book.imageUrl,
                height: 300,
                fit: BoxFit.cover,
                errorBuilder: (context, error, stackTrace) => 
                    const Icon(Icons.broken_image, size: 100),
              ),
            ),
            const SizedBox(height: 16),
            // Menampilkan Judul
            Text(
              book.title,
              style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 8),
            // Menampilkan Info Dasar (Penulis, Tahun)
            Text(
              'Oleh: ${book.author} | Tahun: ${book.year}',
              style: const TextStyle(fontSize: 16, fontStyle: FontStyle.italic, color: Colors.grey),
            ),
            const SizedBox(height: 16),
            // Menggunakan Divider untuk pemisah visual antar section
            const Divider(),
            // Menampilkan detail lainnya secara terstruktur menggunakan fungsi Helper
            _buildDetailRow('Genre', book.genre),
            _buildDetailRow('Penerbit', book.publisher),
            _buildDetailRow('Halaman', '${book.pages} halaman'),
            _buildDetailRow('Rating', '${book.rating} / 5.0'),
            const Divider(),
            const SizedBox(height: 8),
            // Menampilkan Label Deskripsi
            const Align(
              alignment: Alignment.centerLeft, // Label diratakan ke kiri
              child: Text(
                'Deskripsi:',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
            ),
            const SizedBox(height: 8),
            // Menampilkan Isi Deskripsi Buku
            Text(
              book.description,
              style: const TextStyle(fontSize: 16, height: 1.5), // height mengatur spasi antar baris
              textAlign: TextAlign.justify, // Teks rata kanan-kiri
            ),
          ],
        ),
      ),
    );
  }

  // Fungsi helper (Method tambahan) untuk membangun widget Row (baris) agar kode rapi dan tidak redundan
  Widget _buildDetailRow(String label, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4.0), // Spasi atas-bawah tiap baris
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start, // Label dan value sejajar di atas
        children: [
          // Lebar tetap untuk label agar titik duanya (:) sejajar rapi
          SizedBox(
            width: 100,
            child: Text(
              label,
              style: const TextStyle(fontWeight: FontWeight.bold),
            ),
          ),
          const Text(': '),
          // Expanded agar value mengambil sisa ruang, mencegah error overflow jika teks terlalu panjang
          Expanded(
            child: Text(value),
          ),
        ],
      ),
    );
  }
}
