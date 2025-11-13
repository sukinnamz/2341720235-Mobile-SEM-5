// import 'package:flutter/material.dart';
// import 'dart:async'; // Diperlukan untuk StreamSubscription
// import 'stream.dart'; // Import class ColorStream

// void main() {
//   runApp(const MyApp());
// }

// class MyApp extends StatelessWidget {
//   const MyApp({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'Stream Praktikum',
//       theme: ThemeData(
//         // Gantilah warna tema sesuai kesukaan Anda (contoh: deepPurple)
//         primarySwatch: Colors.deepPurple,
//       ),
//       home: const StreamHomePage(),
//     );
//   }
// }

// class StreamHomePage extends StatefulWidget {
//   const StreamHomePage({super.key});

//   @override
//   State<StreamHomePage> createState() => _StreamHomePageState();
// }

// class _StreamHomePageState extends State<StreamHomePage> {
//   // Variabel untuk menampung warna saat ini
//   Color currentColor = Colors.yellow;

//   // Variabel untuk menampung langganan stream
//   late StreamSubscription subscription;

//   // Instance dari ColorStream
//   late ColorStream colorStream;

//   @override
//   void initState() {
//     super.initState();
//     // Inisialisasi ColorStream
//     colorStream = ColorStream();

//     // Memulai mendengarkan stream dan mengubah state (warna)
//     changeColor();
//   }

//   // Method untuk mendengarkan stream
//   void changeColor() {
//     // Melakukan 'listen' pada stream
//     subscription = colorStream.getColors().listen((eventColor) {
//       // Mengubah state (warna) setiap kali data baru diterima dari stream
//       setState(() {
//         currentColor = eventColor;
//       });
//     });
//   }

//   // Penting: Batalkan langganan ketika widget dihancurkan
//   @override
//   void dispose() {
//     subscription.cancel();
//     super.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         // Tambahkan nama panggilan Anda pada title (contoh: Stream - Budi)
//         title: const Text('Stream - Innam'),
//       ),
//       // Latar belakang diubah berdasarkan state currentColor
//       body: Container(color: currentColor),
//     );
//   }
// }

// prak 2

import 'package:flutter/material.dart';
import 'dart:math'; // Diperlukan untuk Random
import 'stream.dart'; // Import class NumberStream

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Stream Praktikum',
      theme: ThemeData(primarySwatch: Colors.deepPurple),
      home: const StreamHomePage(),
    );
  }
}

class StreamHomePage extends StatefulWidget {
  const StreamHomePage({super.key});

  @override
  State<StreamHomePage> createState() => _StreamHomePageState();
}

class _StreamHomePageState extends State<StreamHomePage> {
  // Variabel untuk menampung angka yang diterima dari stream
  int lastNumber = 0;

  // Instance dari NumberStream
  late NumberStream numberStream;

  @override
  void initState() {
    super.initState();
    // 7. Inisialisasi NumberStream
    numberStream = NumberStream();

    // 8. Memulai mendengarkan stream.
    // Data yang diterima akan mengubah state (lastNumber)
    numberStream.stream.listen((number) {
      setState(() {
        lastNumber = number;
      });
    });
  }

  // 9. Batalkan langganan dan tutup StreamController saat widget di-dispose
  @override
  void dispose() {
    numberStream.close();
    super.dispose();
  }

  // 10. Method untuk menghasilkan angka acak dan menambahkannya ke sink
  void addRandomNumber() {
    Random random = Random();
    // Menghasilkan angka acak antara 0 hingga 9
    int myNum = random.nextInt(10);

    // Menambahkan angka ke stream melalui sink
    numberStream.addNumberToSink(myNum);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Stream')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            // Teks untuk menampilkan angka terakhir dari stream
            Text(
              // Menampilkan angka terakhir yang diterima
              lastNumber.toString(),
              style: const TextStyle(
                fontSize: 48.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 50),
            // Button untuk memicu penambahan angka acak
            ElevatedButton(
              onPressed: addRandomNumber,
              child: const Text('New Random Number'),
            ),
          ],
        ),
      ),
    );
  }
}
