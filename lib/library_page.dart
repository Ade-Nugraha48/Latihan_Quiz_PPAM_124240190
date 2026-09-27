import 'package:flutter/material.dart';
import 'bookModels.dart'; // Import model data kita
import 'detail_page.dart';

// Menggunakan StatelessWidget karena halaman ini hanya menampilkan data yang sudah ada (tidak ada perubahan state dinamis)
class LibraryPage extends StatelessWidget {
  const LibraryPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Library Buku'),
        automaticallyImplyLeading: false, // Menghilangkan tombol back karena ini halaman utama setelah login
      ),
      // GridView.builder cocok untuk menampilkan data banyak dalam bentuk grid (Card View)
      body: GridView.builder(
        padding: const EdgeInsets.all(8.0),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2, // Jumlah kolom pada Grid
          childAspectRatio: 0.6, // Rasio lebar/tinggi item, disesuaikan agar gambar dan teks muat
          crossAxisSpacing: 8, // Spasi horizontal antar grid
          mainAxisSpacing: 8, // Spasi vertikal antar grid
        ),
        itemCount: bookList.length, // Menentukan jumlah item dari list data di bookModels.dart
        itemBuilder: (context, index) {
          final BookModel book = bookList[index]; // Ambil data spesifik per index dari List

          // InkWell/GestureDetector digunakan agar seluruh area Card bisa di-tap/diklik
          return InkWell(
            onTap: () {
              // Navigasi ke DetailPage dengan membawa (passing) objek 'book' yang sedang di-klik
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => DetailPage(book: book),
                ),
              );
            },
            child: Card(
              elevation: 4,
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  // Expanded digunakan agar gambar mengambil sisa ruang kosong dari Card
                  Expanded(
                    child: ClipRRect(
                      borderRadius: const BorderRadius.vertical(top: Radius.circular(10)),
                      child: Image.network(
                        book.imageUrl,
                        fit: BoxFit.cover, // Gambar di-crop agar pas memenuhi area
                        errorBuilder: (context, error, stackTrace) => 
                            const Center(child: Icon(Icons.broken_image, size: 50)), // Jika gagal meload gambar URL
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // Tampilkan Judul Buku
                        Text(
                          book.title,
                          style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
                          maxLines: 2, // Batasi maksimal baris teks agar Card tidak terlalu panjang
                          overflow: TextOverflow.ellipsis, // Tambahkan "..." jika teks terlalu panjang dan terpotong
                        ),
                        const SizedBox(height: 4),
                        // Tampilkan Penulis dan Tahun
                        Text(
                          '${book.author} (${book.year})',
                          style: const TextStyle(fontSize: 12, color: Colors.grey),
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
