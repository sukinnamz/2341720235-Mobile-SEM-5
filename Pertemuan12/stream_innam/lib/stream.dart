// import 'package:flutter/material.dart';

// class ColorStream {
//   // Daftar warna yang akan dialirkan (yielded)
//   final List<Color> colors = [
//     Colors.yellow,
//     Colors.blueGrey,
//     Colors.deepOrange,
//     Colors.purple,
//     Colors.teal,
//     Colors.red, // Tambahan 5 warna
//     Colors.green,
//     Colors.indigo,
//     Colors.pink,
//     Colors.brown,
//   ];

//   // Method asinkronus yang mengembalikan Stream of Color
//   // Tanda '*' pada 'async*' menunjukkan ini adalah generator stream
//   Stream<Color> getColors() async* {
//     // Stream.periodic akan menghasilkan event setiap durasi yang ditentukan
//     // Dalam hal ini, setiap 1 detik.
//     yield* Stream.periodic(const Duration(seconds: 1), (int t) {
//       // Menghitung indeks warna agar berulang (looping)
//       int index = t % colors.length;
//       return colors[index];
//     });
//   }
// }

// prak 2
// import 'dart:async'; // Diperlukan untuk StreamController

// // Class NumberStream (Tambahan untuk Praktikum 2)
// class NumberStream {
//   // 1. Buat StreamController untuk mengelola stream data (integer)
//   final StreamController<int> _controller = StreamController<int>();

//   // 2. Getter untuk Sink (Input)
//   // Sink digunakan untuk menambahkan data ke dalam controller
//   StreamSink<int> get sink => _controller.sink;

//   // 3. Getter untuk Stream (Output)
//   // Stream digunakan untuk menerima/mendengarkan data dari controller
//   Stream<int> get stream => _controller.stream;

//   // Method untuk menambahkan angka ke Sink
//   void addNumberToSink(int newNumber) {
//     sink.add(newNumber);
//   }

//   // Method untuk menutup controller
//   void close() {
//     _controller.close();
//   }

//   /* // Jika Anda ingin mencoba addError() (Soal 7), uncomment method berikut:
//   void addError() {
//     sink.addError('Angka Genap tidak diperbolehkan');
//   }
//   */
// }

// prak 3
// import 'dart:async';

// class NumberStream {
//   // Controller yang mengelola input dan output stream
//   final StreamController<int> _controller = StreamController<int>.broadcast();

//   // Getter untuk Sink (Input data)
//   StreamSink<int> get sink => _controller.sink;

//   // Getter untuk Stream (Output data yang didengarkan)
//   Stream<int> get stream => _controller.stream;

//   // Method untuk menambahkan data (angka) ke Sink
//   void addNumberToSink(int newNumber) {
//     sink.add(newNumber);
//   }

//   // Method untuk menutup controller saat tidak lagi diperlukan
//   void close() {
//     _controller.close();
//   }
// }

// prak 5
import 'dart:async';

class NumberStream {
  // PENTING: Menggunakan Broadcast StreamController
  final StreamController<int> _controller = StreamController<int>.broadcast();

  StreamSink<int> get sink => _controller.sink;

  Stream<int> get stream => _controller.stream;

  void addNumberToSink(int newNumber) {
    sink.add(newNumber);
  }

  void close() {
    _controller.close();
  }
}
