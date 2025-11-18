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

// import 'package:flutter/material.dart';
// import 'dart:math'; // Diperlukan untuk Random
// import 'stream.dart'; // Import class NumberStream

// void main() {
//   runApp(const MyApp());
// }

// class MyApp extends StatelessWidget {
//   const MyApp({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'Stream Praktikum',
//       theme: ThemeData(primarySwatch: Colors.deepPurple),
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
//   // Variabel untuk menampung angka yang diterima dari stream
//   int lastNumber = 0;

//   // Instance dari NumberStream
//   late NumberStream numberStream;

//   @override
//   void initState() {
//     super.initState();
//     // 7. Inisialisasi NumberStream
//     numberStream = NumberStream();

//     // 8. Memulai mendengarkan stream.
//     // Data yang diterima akan mengubah state (lastNumber)
//     numberStream.stream.listen((number) {
//       setState(() {
//         lastNumber = number;
//       });
//     });
//   }

//   // 9. Batalkan langganan dan tutup StreamController saat widget di-dispose
//   @override
//   void dispose() {
//     numberStream.close();
//     super.dispose();
//   }

//   // 10. Method untuk menghasilkan angka acak dan menambahkannya ke sink
//   void addRandomNumber() {
//     Random random = Random();
//     // Menghasilkan angka acak antara 0 hingga 9
//     int myNum = random.nextInt(10);

//     // Menambahkan angka ke stream melalui sink
//     numberStream.addNumberToSink(myNum);
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(title: const Text('Stream')),
//       body: Center(
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: <Widget>[
//             // Teks untuk menampilkan angka terakhir dari stream
//             Text(
//               // Menampilkan angka terakhir yang diterima
//               lastNumber.toString(),
//               style: const TextStyle(
//                 fontSize: 48.0,
//                 fontWeight: FontWeight.bold,
//               ),
//             ),
//             const SizedBox(height: 50),
//             // Button untuk memicu penambahan angka acak
//             ElevatedButton(
//               onPressed: addRandomNumber,
//               child: const Text('New Random Number'),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }

// prak 3
// import 'package:flutter/material.dart';
// import 'dart:math';
// import 'dart:async'; // Diperlukan untuk StreamTransformer
// import 'stream.dart'; // Import class NumberStream

// void main() {
//   runApp(const MyApp());
// }

// class MyApp extends StatelessWidget {
//   const MyApp({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'Stream Transformer Praktikum',
//       theme: ThemeData(primarySwatch: Colors.deepPurple),
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
//   // Variabel untuk menampung angka hasil transformasi
//   int lastNumber = 0;
//   late NumberStream numberStream;

//   // 1. Variabel untuk StreamTransformer
//   late StreamTransformer<int, int> transformer;

//   @override
//   void initState() {
//     super.initState();
//     numberStream = NumberStream();

//     // 2. Inisialisasi StreamTransformer
//     // Transformer ini mengalikan setiap angka yang masuk dengan 10.
//     transformer = StreamTransformer.fromHandlers(
//       handleData: (data, sink) {
//         // Logika transformasi: mengalikan dengan 10
//         sink.add(data * 10);
//       },
//     );

//     // 3. Menerapkan transformer pada stream sebelum mendengarkan (listen)
//     numberStream.stream
//         .transform(transformer) // Menerapkan transformasi (x10)
//         .listen((number) {
//           setState(() {
//             lastNumber = number;
//           });
//         });
//   }

//   @override
//   void dispose() {
//     // Menutup stream controller
//     numberStream.close();
//     super.dispose();
//   }

//   void addRandomNumber() {
//     Random random = Random();
//     int myNum = random.nextInt(10); // Menghasilkan angka 0-9

//     // Angka 0-9 dikirim ke sink, lalu ditransformasi menjadi 0-90
//     numberStream.addNumberToSink(myNum);
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(title: const Text('Stream')),
//       body: Center(
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: <Widget>[
//             // Teks menampilkan angka hasil transformasi (0, 10, ..., 90)
//             Text(
//               lastNumber.toString(),
//               style: const TextStyle(
//                 fontSize: 48.0,
//                 fontWeight: FontWeight.bold,
//               ),
//             ),
//             const SizedBox(height: 50),
//             ElevatedButton(
//               onPressed: addRandomNumber,
//               child: const Text('New Random Number'),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }

// prak 4
// import 'package:flutter/material.dart';
// import 'dart:math';
// import 'dart:async'; // Diperlukan untuk StreamSubscription dan StreamTransformer
// import 'stream.dart'; // Import class NumberStream

// void main() {
//   runApp(const MyApp());
// }

// class MyApp extends StatelessWidget {
//   const MyApp({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'Stream Subscription Praktikum',
//       theme: ThemeData(primarySwatch: Colors.deepPurple),
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
//   int lastNumber = 0;
//   late NumberStream numberStream;
//   late StreamTransformer<int, int> transformer;

//   // 1. Tambahkan variabel untuk StreamSubscription
//   late StreamSubscription subscription;

//   // 1. Tambahkan variabel untuk StreamSubscription kedua (untuk Soal 9)
//   late StreamSubscription subscription2;

//   @override
//   void initState() {
//     super.initState();
//     numberStream = NumberStream();

//     // Inisialisasi Transformer dari Praktikum 3
//     transformer = StreamTransformer.fromHandlers(
//       handleData: (data, sink) {
//         sink.add(data * 10);
//       },
//     );

//     // 2. Edit initState(): Menerapkan listen dengan Subscription
//     subscription = numberStream.stream
//         .transform(transformer)
//         .listen(
//           (number) {
//             // 3. Tambahkan logika event: onData (data diterima)
//             setState(() {
//               lastNumber = number;
//             });
//           },
//           // 4. Tambahkan properti onError
//           onError: (e) {
//             setState(() {
//               lastNumber = -1; // Menyetel -1 saat error
//             });
//             print('Error yang diterima: $e');
//           },
//           // 4. Tambahkan properti onDone
//           onDone: () {
//             print('Stream selesai!'); // Dicetak saat stream selesai/ditutup
//           },
//         );

//     // 3. Inisialisasi Subscription kedua (diperlukan untuk Soal 9)
//     subscription2 = numberStream.stream.transform(transformer).listen((number) {
//       // Hanya untuk inisialisasi, tidak mengubah UI di sini
//     });
//   }

//   // 5. Tambahkan method baru untuk menghentikan langganan
//   void stopSubscription() async {
//     // Memeriksa apakah langganan aktif sebelum membatalkannya
//     if (subscription.isPaused) {
//       subscription.resume();
//     } else {
//       // 8. Batalkan langganan
//       subscription.cancel();
//       setState(() {
//         lastNumber = -1; // Menyetel -1 setelah dibatalkan
//       });
//     }
//   }

//   // 6. Pindah ke method dispose()
//   @override
//   void dispose() {
//     // Batalkan langganan yang masih aktif saat widget dihancurkan
//     subscription.cancel();
//     subscription2.cancel(); // Batalkan subscription kedua
//     numberStream.close();
//     super.dispose();
//   }

//   // 8. Edit method addRandomNumber()
//   void addRandomNumber() {
//     Random random = Random();
//     int myNum = random.nextInt(10);

//     // Memeriksa apakah langganan aktif sebelum menambahkan data
//     if (!subscription.isPaused) {
//       numberStream.addNumberToSink(myNum);
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(title: const Text('Stream')),
//       body: Center(
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: <Widget>[
//             Text(
//               lastNumber.toString(),
//               style: const TextStyle(
//                 fontSize: 48.0,
//                 fontWeight: FontWeight.bold,
//               ),
//             ),
//             const SizedBox(height: 50),
//             ElevatedButton(
//               onPressed: addRandomNumber,
//               child: const Text('New Random Number'),
//             ),
//             const SizedBox(height: 20),
//             // 7. Tambahkan button kedua untuk menghentikan langganan
//             ElevatedButton(
//               onPressed: stopSubscription,
//               child: const Text('Stop Subscription'),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }

// prak 5

import 'package:flutter/material.dart';
import 'dart:math';
import 'dart:async';
import 'stream.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Multiple Stream Subscriptions Praktikum',
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
  // Variabel state dan Stream logic
  int lastNumber = 0;
  late NumberStream numberStream;
  late StreamTransformer<int, int> transformer;
  late StreamSubscription subscription;
  late StreamSubscription subscription2;

  // Variabel untuk menampung riwayat angka
  String allNumbers = '';

  @override
  void initState() {
    super.initState();
    numberStream = NumberStream();

    // Inisialisasi Transformer (x10)
    transformer = StreamTransformer.fromHandlers(
      handleData: (data, sink) {
        sink.add(data * 10);
      },
    );

    // 1. Listener Pertama: Memperbarui angka besar di tengah
    subscription = numberStream.stream
        .transform(transformer)
        .listen(
          (number) {
            setState(() {
              lastNumber = number;
            });
          },
          onError: (e) => print('Error: $e'),
          onDone: () => print('Stream 1 selesai!'),
        );

    // 2. Listener Kedua: Memperbarui riwayat angka panjang (allNumbers)
    subscription2 = numberStream.stream.transform(transformer).listen((number) {
      setState(() {
        // Menambahkan angka ke string dengan pemisah '-'
        allNumbers += number.toString() + '-';
      });
    }, onDone: () => print('Stream 2 selesai!'));
  }

  // Method untuk menghentikan kedua langganan
  void stopSubscription() async {
    // Membatalkan kedua langganan
    subscription.cancel();
    subscription2.cancel();

    // Set lastNumber menjadi -1 untuk menunjukkan stream terhenti
    setState(() {
      lastNumber = -1;
    });
    print('Semua langganan telah dihentikan.');
  }

  @override
  void dispose() {
    subscription.cancel();
    subscription2.cancel();
    numberStream.close();
    super.dispose();
  }

  void addRandomNumber() {
    Random random = Random();
    int myNum = random.nextInt(10);

    // Kirim data ke sink
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
            // Teks 1: Riwayat angka panjang
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: Text(
                allNumbers,
                textAlign: TextAlign.center,
                style: const TextStyle(fontSize: 16.0),
              ),
            ),
            const SizedBox(height: 50),
            // Teks 2: Angka terakhir yang diterima (digunakan untuk memverifikasi)
            Text(
              lastNumber.toString(),
              style: const TextStyle(
                fontSize: 48.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 50),
            ElevatedButton(
              onPressed: addRandomNumber,
              child: const Text('New Random Number'),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: stopSubscription,
              child: const Text('Stop Stream'), // Ganti teks button
            ),
          ],
        ),
      ),
    );
  }
}
