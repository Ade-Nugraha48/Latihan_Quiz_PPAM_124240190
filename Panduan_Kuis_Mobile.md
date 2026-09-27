# Panduan Menghadapi Kuis Praktikum Mobile (Flutter)

Dokumen ini adalah "Cheat Sheet" untuk membantu memahami struktur aplikasi kuis yang baru saja kita buat. Kamu bisa menjadikan ini sebagai acuan utama ketika kuis sesungguhnya memiliki skenario yang sedikit berbeda.

---

## 1. Alur Arsitektur Aplikasi (Konsep Sederhana)
Aplikasi ini menggunakan alur mirip MVC (Model-View-Controller) yang disederhanakan ala Flutter:
- **Model (`bookModels.dart`)**: Berisi Blueprint / Cetakan (Class) dari entitas data yang akan dipakai, sekaligus Dummy Data yang berbentuk List (Array).
- **View (`_page.dart`)**: Berisi UI, yaitu `login_page.dart` (Halaman Login), `library_page.dart` (Tampilan Daftar), dan `detail_page.dart` (Tampilan Detail).
- **Controller (Logic)**: Logic diselipkan langsung pada View. Contoh: Logic validasi email/password ada di `login_page.dart`, dan logic navigasi ada pada `onTap` di `library_page.dart`.

### Mengapa StatefulWidget vs StatelessWidget?
- **StatefulWidget (`login_page.dart`)**: Digunakan karena ada inputan `TextField`. Layar perlu berinteraksi dengan "State" nilai inputan user.
- **StatelessWidget (`library_page.dart` & `detail_page.dart`)**: Digunakan karena halaman ini hanya sekedar *menerima* dan *menampilkan* data yang statis (tidak berubah setelah layar dirender).

---

## 2. Checklist Penyesuaian Kuis (Worst Case Scenario)
Jika tema berubah drastis (Misal: dari **Buku** menjadi **Makanan**, **Karakter Game**, dll), ikuti urutan langkah-langkah *refactoring* ini:

### A. Ubah Model (SANGAT PENTING - KERJAKAN PERTAMA)
1. Buka file `bookModels.dart` (atau rename filenya).
2. Ubah nama class `BookModel` menjadi `FoodModel` atau nama yang diminta soal.
3. Ubah seluruh properti (misal dari `title`, `author` menjadi `foodName`, `price`, dll).
4. Ubah List dummy datanya `List<BookModel> bookList = [...]` menjadi nama list baru dan sesuaikan isian valuenya sesuai properti baru tersebut.

### B. Ubah Parameter di Halaman Detail (detail_page.dart)
1. Buka `detail_page.dart`.
2. Ubah import model-nya ke file baru (jika kamu me-rename file model).
3. Di dalam Class, ubah variabel *receiver*-nya:
   ```dart
   // SEBELUM
   final BookModel book;
   const DetailPage({super.key, required this.book});

   // SESUDAH
   final FoodModel food;
   const DetailPage({super.key, required this.food});
   ```
4. Ubah variabel pemanggil di UI (misal: `book.title` diganti `food.foodName`).

### C. Sesuaikan Halaman Daftar (library_page.dart)
1. Pada `itemCount: bookList.length`, ganti dengan list data barumu.
2. Di dalam `itemBuilder`, saat mengambil data spesifik:
   ```dart
   // SEBELUM
   final BookModel book = bookList[index];
   
   // SESUDAH
   final FoodModel food = foodList[index];
   ```
3. Lemparan Navigation juga harus diubah propertinya:
   ```dart
   // SEBELUM
   builder: (context) => DetailPage(book: book), // book: (parameter DetailPage), book (dari itemBuilder)
   
   // SESUDAH
   builder: (context) => DetailPage(food: food),
   ```
4. Sesuaikan properti text yang di-*binding* di Card (misal `food.foodName`).

### D. Mengubah GridView menjadi ListView (Jika diminta)
Jika soal tidak meminta bentuk kotak-kotak Grid, melainkan baris list biasa ke bawah (ListTile), hapus `GridView.builder` dan ganti jadi `ListView.builder`:
```dart
body: ListView.builder(
  itemCount: foodList.length,
  itemBuilder: (context, index) {
    final FoodModel food = foodList[index];
    return Card(
      child: ListTile(
        leading: Image.network(food.imageUrl, width: 50, height: 50, fit: BoxFit.cover),
        title: Text(food.foodName),
        subtitle: Text(food.price),
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => DetailPage(food: food)),
          );
        },
      ),
    );
  }
)
```

---

## 3. Tips Debugging Cepat (Error Handling)

- **Layar Blank/Merah "RenderFlex overflowed"**:
  Biasanya karena `Text` terlalu panjang atau `Image` kepanjangan. 
  *Solusi:* Bungkus `Text` dengan `Expanded` (kalau dalam Row) atau gunakan batasan `maxLines` & `overflow: TextOverflow.ellipsis`.

- **Error "Null Check Operator Used on a Null Value" atau "Type Mismatch"**:
  Terjadi karena kamu melempar data dengan tipe A tapi menerima di halaman detail dengan tipe B.
  *Solusi:* Cek ulang bagian ini di `library_page.dart`: `builder: (context) => DetailPage(variabel: variabel)` dan pastikan di dalam `detail_page.dart` constructornya menggunakan class yang benar.

- **Gambar Gagal Load (URL Error)**:
  Seringkali Dummy data URL yang diberikan error. Selalu pasang penangkal error bawaan Flutter di Widget Image:
  ```dart
  Image.network(
    data.imageUrl,
    errorBuilder: (context, error, stackTrace) {
      return Icon(Icons.broken_image); // Munculkan icon jika gambar error
    },
  )
  ```

- **Tombol Back di AppBar hilang atau ada dua**:
  Gunakan `automaticallyImplyLeading: false` pada `AppBar()` di halaman utama setelah Login, supaya tidak bisa memencet back ke halaman Login (Karena Navigation-nya menggunakan `pushReplacement`).
