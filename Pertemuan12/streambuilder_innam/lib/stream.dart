import 'dart:async';

class NumberStream {
  // Method untuk mendapatkan Stream of Integer
  // Tanda '*' pada 'async*' tidak digunakan di sini.
  // Kita langsung menggunakan Stream.periodic() yang lebih sederhana.
  Stream<int> getNumberStream() {
    // Stream.periodic akan menghasilkan event setiap 1 detik.
    return Stream.periodic(
      const Duration(seconds: 1),
      // t adalah hitungan (count) dari event yang telah terjadi (0, 1, 2, ...)
      (int t) {
        // Mengembalikan angka (contoh: t % 10)
        return t;
      },
    ).take(
      10,
    ); // Ambil 10 nilai pertama (0 sampai 9), atau hapus take(10) agar berlanjut terus.
    // Jika Anda ingin angka 6 yang muncul pertama kali, Anda bisa memodifikasi logika di atas.
  }
}
