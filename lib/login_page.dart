import 'package:flutter/material.dart';
import 'library_page.dart';

// Menggunakan StatefulWidget karena kita perlu mengelola state inputan form (email & password)
class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  // Controller untuk mengambil nilai text dari TextField
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  void _login() {
    String email = _emailController.text;
    String password = _passwordController.text;

    // Logika dummy login (email & password harus diisi dengan 'admin')
    if (email == 'admin' && password == 'admin') {
      // Jika berhasil, gunakan Navigator.pushReplacement agar tidak bisa kembali ke halaman login (hapus dari stack)
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const LibraryPage()),
      );
    } else {
      // Jika gagal, tampilkan Snackbar sebagai pesan error
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Login Gagal! Email atau Password salah.'),
          backgroundColor: Colors.red,
        ),
      );
    }
  }

  @override
  void dispose() {
    // Jangan lupa dispose controller saat widget dihancurkan untuk mencegah memory leak
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Login'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center, // Pusatkan konten ke tengah secara vertikal
          children: [
            TextField(
              controller: _emailController,
              decoration: const InputDecoration(
                labelText: 'Email',
                hintText: 'Isi dengan admin',
                border: OutlineInputBorder(), // Menambahkan border pada TextField
              ),
            ),
            const SizedBox(height: 16), // Memberi jarak antar elemen
            TextField(
              controller: _passwordController,
              obscureText: true, // Menyembunyikan input password
              decoration: const InputDecoration(
                labelText: 'Password',
                hintText: 'Isi dengan admin',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 24),
            ElevatedButton(
              onPressed: _login, // Panggil fungsi _login ketika ditekan
              style: ElevatedButton.styleFrom(
                minimumSize: const Size(double.infinity, 50), // Buat tombol memenuhi lebar layar
              ),
              child: const Text('Login', style: TextStyle(fontSize: 18)),
            ),
          ],
        ),
      ),
    );
  }
}
