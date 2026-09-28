# 🚑 P3K Kuis Flutter: Cheat Sheet Adaptasi Tema App

Halo! Tenang, tarik napas dulu. Jangan panik kalau tema kuis tiba-tiba berubah 180 derajat dari latihan kita (misal dari Buku jadi Film atau Makanan). Kuncinya bukan menghafal ulang, tapi **mencocokkan pola**. 

Anggap saja ini panduan "Copy-Paste & Edit" darurat kamu. Mari kita mulai!

---

## 1. 🧠 Mindset Dasar (Melihat Pola)

Apapun tema aplikasinya (Buku, Film, Makanan, Pahlawan), alur kerja aplikasi daftar (List-Detail) **selalu sama persis**:

1. **Model Data:** Siapkan "cetakan" datanya.
2. **Halaman List:** Tampilkan banyak data dalam bentuk daftar (ListView/GridView).
3. **Halaman Detail:** Saat satu item diklik, tampilkan detail lengkapnya.

Hanya namanya saja yang berubah. Pola kodingannya? 100% sama!

---

## 2. 🛠️ Langkah 1: Merombak Data Model (`bookModels.dart`)

> [!TIP]
> **Analogi:** Class model itu seperti **cetakan kue**. Kalau sebelumnya kita bikin cetakan buku, sekarang kita tinggal ubah bentuk cetakannya jadi cetakan film.

### A. Ubah Nama Class
Ganti nama `class BookModel` menjadi nama baru, misalnya `class MovieModel`.

### B. Sesuaikan Atribut (Variabel)
Ingat aturan tipe data ini saat membuat cetakan:
- `String` -> Untuk teks biasa (Nama, Deskripsi, URL Gambar).
- `int` -> Untuk angka bulat (Tahun, Jumlah Halaman).
- `double` -> Untuk angka desimal (Rating, Harga).

**Contoh Sebelum (Tema Buku):**
```dart
class BookModel {
  String title;
  int pages;
  double rating;
  String imageUrl;

  BookModel({
    required this.title,
    required this.pages,
    required this.rating,
    required this.imageUrl,
  });
}
```

**Contoh Sesudah (Tema Film):**
```dart
class MovieModel {
  String judul; // Ganti title jadi judul
  int tahunRilis; // Ganti pages jadi tahunRilis
  double rating; // Tetap sama
  String posterUrl; // Ganti imageUrl jadi posterUrl

  MovieModel({
    required this.judul,
    required this.tahunRilis,
    required this.rating,
    required this.posterUrl,
  });
}
```
*Pastikan nama di dalam `required this...` sama persis dengan nama variabel di atasnya!*

---

## 3. 🔍 Langkah 2: Menyesuaikan Halaman List (Misal `HomePage` / `LibraryPage`)

Di halaman List, kita akan menampilkan banyak data.

### A. Gunakan Fitur "Find and Replace" (Jurus Rahasia)
Jangan ubah variabel satu per satu, nanti ada yang terlewat dan error!
- Di VS Code atau Android Studio: Tekan `Ctrl + F` (Windows) atau `Cmd + F` (Mac).
- Ketik kata lama: `book`
- Klik tanda panah (Replace) dan ketik kata baru: `movie`
- Tekan tombol **Replace All** (ikon kotak sebelahan).
- *Ulangi langkah ini untuk kata dengan huruf besar, misal `Book` menjadi `Movie`.*

### B. Mengubah Pemanggilan Data ke UI
Setelah variabel diganti, pastikan kamu memanggil atribut yang baru saat menampilkan teks:
- Sebelum: `Text(book.title)`
- Sesudah: `Text(movie.judul)`

### C. Melempar Data ke Halaman Detail (Navigator)
Saat list diklik, kita harus membawa data (paket) ke halaman detail. Pastikan "paket" yang dilempar sudah berubah nama.
```dart
// Di dalam onTap / InkWell
Navigator.push(
  context,
  MaterialPageRoute(
    builder: (context) => DetailPage(
      movie: movieList[index], // <-- Pastikan ini jadi movie, bukan book lagi
    ),
  ),
);
```

---

## 4. 📦 Langkah 3: Menyesuaikan Halaman Detail

Ini adalah bagian di mana pemula **paling sering mengalami error!**

> [!IMPORTANT]
> **Analogi Constructor:** Halaman detail itu seperti rumah penerima paket. Kalau paket yang datang namanya `movie`, maka si penerima (Constructor) harus bersiap menerima `movie`. Jangan sampai paketnya `movie`, tapi penerimanya masih nyari `book`!

### A. Merombak Constructor Penerima Data
Ubah variabel penerima dan constructor-nya di bagian paling atas halaman Detail:

**Sebelum (Menerima Buku):**
```dart
class DetailPage extends StatelessWidget {
  final BookModel book; // <-- Variabel penerima

  const DetailPage({Key? key, required this.book}) : super(key: key); // <-- Constructor
// ...
```

**Sesudah (Menerima Film):**
```dart
class DetailPage extends StatelessWidget {
  final MovieModel movie; // <-- Ganti tipe data dan namanya

  const DetailPage({Key? key, required this.movie}) : super(key: key); // <-- Ganti this.book jadi this.movie
// ...
```

### B. Menampilkan Data (Mapping ke Widget)
Sama seperti di halaman List, panggil data baru kamu di dalam widget:
- Untuk Teks: `Text(movie.judul)`
- Untuk Gambar: `Image.network(movie.posterUrl)`

---

## 5. 🚑 Troubleshooting Darurat (P3K Error Flutter)

Mentok pas di-run? Cek 3 penyakit umum ini:

> [!WARNING]
> **1. Layar Merah: "Null check operator used on a null value" / "Unexpected Null Value"**
> - **Penyebab:** Ada data yang harusnya ada isinya, tapi malah kosong (`null`). Sering terjadi saat mengambil data dari JSON/API (dummy data).
> - **Solusi:** Cek file data list/dummy kamu. Pastikan atributnya terisi semua. Misal kamu mewajibkan `posterUrl` pakai `required`, pastikan di data list-nya tidak ada yang `posterUrl: null` atau kelupaan diisi.

> [!CAUTION]
> **2. Error "Type Mismatch" (misal: String is not a subtype of type int)**
> - **Penyebab:** Kamu mencoba memasukkan teks (`String`) ke variabel yang mintanya angka (`int`), atau sebaliknya.
> - **Solusi:** Cek kembali `ModelData` dan sumber datamu. Kalau harganya pakai kutip `"50000"`, maka di model harus `String`. Kalau tanpa kutip `50000`, maka di model harus `int`. 
> - **Penting:** Widget `Text()` WAJIB berisi `String`. Kalau mau nampilin variabel `int`, ubah ke string dulu dengan fungsi toString(): `Text(movie.tahunRilis.toString())`.

> [!NOTE]
> **3. Gambar Tidak Muncul / Error Network Image**
> - **Penyebab:** Link URL gambar mati, tipe gambarnya tidak didukung, atau salah panggil widget.
> - **Solusi:** 
>   - Pastikan URL gambar berakhiran `.jpg` atau `.png`.
>   - Pastikan menggunakan `Image.network()` untuk gambar dari link internet, BUKAN `Image.asset()`.
>   - Coba copy link gambarnya ke browser, kalau tidak terbuka berarti link-nya memang rusak (ganti link gambar lain).

Semangat kuisnya! Ingat, koding itu tentang memahami logika dan pola, bukan cuma sekadar hafalan sintaks. Pelan-pelan, teliti dari atas ke bawah, pasti bisa! 🚀
