import 'package:flutter/material.dart';

class ColorStream {
  // Daftar warna yang akan dialirkan (yielded)
  final List<Color> colors = [
    Colors.yellow,
    Colors.blueGrey,
    Colors.deepOrange,
    Colors.purple,
    Colors.teal,
    Colors.red, // Tambahan 5 warna
    Colors.green,
    Colors.indigo,
    Colors.pink,
    Colors.brown,
  ];

  // Method asinkronus yang mengembalikan Stream of Color
  // Tanda '*' pada 'async*' menunjukkan ini adalah generator stream
  Stream<Color> getColors() async* {
    // Stream.periodic akan menghasilkan event setiap durasi yang ditentukan
    // Dalam hal ini, setiap 1 detik.
    yield* Stream.periodic(const Duration(seconds: 1), (int t) {
      // Menghitung indeks warna agar berulang (looping)
      int index = t % colors.length;
      return colors[index];
    });
  }
}
