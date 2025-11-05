// prak 9
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // Judul sesuai dengan gambar: "Navigation First Screen"
      title: 'Navigation First Screen',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: const FuturePage(),
    );
  }
}

class FuturePage extends StatefulWidget {
  const FuturePage({super.key});

  @override
  State<FuturePage> createState() => _FuturePageState();
}

class _FuturePageState extends State<FuturePage> {
  // Warna background awal, diasumsikan biru gelap seperti di gambar
  Color resultColor = Colors.blue.shade900;
  String resultText = 'Tekan tombol GO.';

  // Catatan: Teks tombol di gambar tidak terlihat, kita gunakan "GO!" atau "Change Color"

  // Langkah 1 Praktikum 9: Method untuk menampilkan dialog secara asynchronous
  Future<Color?> _showDialog() async {
    // await menjeda eksekusi hingga dialog ditutup (pop)
    final result = await showDialog<Color>(
      context: context,
      builder: (context) {
        return AlertDialog(
          // Judul sesuai gambar
          title: const Text('Very important question'),
          // Konten sesuai gambar
          content: const Text('Please choose a color'),
          actions: <Widget>[
            // Tombol 1: Red
            TextButton(
              onPressed: () => Navigator.of(context).pop(Colors.red),
              child: const Text('Red', style: TextStyle(color: Colors.red)),
            ),
            // Tombol 2: Green
            TextButton(
              onPressed: () => Navigator.of(context).pop(Colors.green),
              child: const Text('Green', style: TextStyle(color: Colors.green)),
            ),
            // Tombol 3: Blue
            TextButton(
              onPressed: () => Navigator.of(context).pop(Colors.blue),
              child: const Text('Blue', style: TextStyle(color: Colors.blue)),
            ),
          ],
        );
      },
    );
    // Mengembalikan hasil (Color atau null)
    return result;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Navigation First Screen')),
      // Background color ditentukan oleh nilai yang dikembalikan
      backgroundColor: resultColor,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            ElevatedButton(
              // Menggunakan teks tombol dari Prak 8 atau "GO!"
              child: const Text('Change Color'),
              onPressed: () {
                // Menangkap hasil Color dari Future _showDialog()
                _showDialog().then((colorValue) {
                  // Hanya setState jika ada perubahan warna yang dikembalikan
                  if (colorValue != null) {
                    setState(() {
                      resultColor = colorValue;
                      resultText =
                          'Warna diubah menjadi ${colorValue.toString()}'; // Opsional: Tampilkan teks perubahan
                    });
                  } else {
                    setState(() {
                      resultText = 'Dialog dibatalkan.';
                    });
                  }
                });
              },
            ),
          ],
        ),
      ),
    );
  }
}
// prak 8
// import 'package:flutter/material.dart';

// void main() {
//   runApp(const MyApp());
// }

// class MyApp extends StatelessWidget {
//   const MyApp({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       // Judul sesuai dengan Codelab: "Navigation First Screen"
//       title: 'Navigation First Screen',
//       theme: ThemeData(primarySwatch: Colors.blue),
//       home: const FuturePage(),
//     );
//   }
// }

// class FuturePage extends StatefulWidget {
//   const FuturePage({super.key});

//   @override
//   State<FuturePage> createState() => _FuturePageState();
// }

// class _FuturePageState extends State<FuturePage> {
//   // Warna background awal adalah biru, sesuai gambar image_26e062.png
//   Color resultColor = Colors.blue;

//   // Method untuk navigasi secara asynchronous
//   Future<Color?> _showNextPage() async {
//     // await akan menjeda eksekusi hingga halaman baru ditutup (pop)
//     final result = await Navigator.of(
//       context,
//     ).push(MaterialPageRoute(builder: (context) => const SecondPage()));
//     // Mengembalikan nilai Color atau null
//     return result as Color?;
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(title: const Text('Navigation First Screen')),
//       // Background color ditentukan oleh variabel state
//       backgroundColor: resultColor,
//       body: Center(
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: <Widget>[
//             ElevatedButton(
//               // Teks tombol sesuai gambar
//               child: const Text('Change Color'),
//               onPressed: () {
//                 // Tidak perlu setState dulu, langsung navigasi

//                 // Menangkap hasil Color dari Future _showNextPage()
//                 _showNextPage().then((colorValue) {
//                   // Hanya setState jika ada perubahan warna yang dikembalikan
//                   if (colorValue != null) {
//                     setState(() {
//                       resultColor = colorValue;
//                     });
//                   }
//                 });
//               },
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }

// // Class Halaman Kedua
// class SecondPage extends StatelessWidget {
//   const SecondPage({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         // Judul sesuai dengan Codelab: "Navigation Second Screen"
//         title: const Text('Navigation Second Screen'),
//       ),
//       // Background default putih, sesuai gambar image_26e086.png
//       backgroundColor: Colors.white,
//       body: Center(
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             // Tombol 1: Mengembalikan warna Merah
//             ElevatedButton(
//               child: const Text('Red'),
//               onPressed: () => Navigator.of(context).pop(Colors.red),
//             ),
//             const SizedBox(height: 20),
//             // Tombol 2: Mengembalikan warna Hijau
//             ElevatedButton(
//               child: const Text('Green'),
//               onPressed: () => Navigator.of(context).pop(Colors.green),
//             ),
//             const SizedBox(height: 20),
//             // Tombol 3: Mengembalikan warna Biru
//             ElevatedButton(
//               child: const Text('Blue'),
//               onPressed: () => Navigator.of(context).pop(Colors.blue),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }

// prak 7
// import 'package:flutter/material.dart';
// import 'package:geolocator/geolocator.dart'; // Praktikum 6 & 7

// void main() {
//   runApp(const MyApp());
// }

// class MyApp extends StatelessWidget {
//   const MyApp({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'FutureBuilder Codelab',
//       theme: ThemeData(primarySwatch: Colors.blue),
//       home: const FuturePage(),
//     );
//   }
// }

// class FuturePage extends StatefulWidget {
//   const FuturePage({super.key});

//   @override
//   State<FuturePage> createState() => _FuturePageState();
// }

// class _FuturePageState extends State<FuturePage> {
//   // Variabel untuk menyimpan Future yang dimulai di initState
//   late Future<Position> _futurePosition;

//   // Method untuk mendapatkan lokasi (dari Praktikum 6)
//   Future<Position> _determinePosition() async {
//     bool serviceEnabled;
//     LocationPermission permission;

//     serviceEnabled = await Geolocator.isLocationServiceEnabled();
//     if (!serviceEnabled) {
//       return Future.error('Location services are disabled.');
//     }

//     permission = await Geolocator.checkPermission();
//     if (permission == LocationPermission.denied) {
//       permission = await Geolocator.requestPermission();
//       if (permission == LocationPermission.denied) {
//         return Future.error('Location permissions are denied');
//       }
//     }

//     if (permission == LocationPermission.deniedForever) {
//       return Future.error(
//         'Location permissions are permanently denied, we cannot request permissions.',
//       );
//     }

//     return await Geolocator.getCurrentPosition();
//   }

//   // Langkah 3 Praktikum 6: Memulai Future di initState
//   @override
//   void initState() {
//     super.initState();
//     _futurePosition = _determinePosition();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(title: const Text('FutureBuilder Location')),
//       body: Center(
//         // Langkah 2 Praktikum 7: Implementasi FutureBuilder (SOAL 12)
//         child: FutureBuilder<Position>(
//           // 1. Future yang dipantau
//           future: _futurePosition,
//           // 2. Fungsi builder yang dipanggil setiap kali status Future berubah
//           builder: (context, snapshot) {
//             // Status 1: Future Belum Selesai (Loading)
//             if (snapshot.connectionState == ConnectionState.waiting) {
//               return const CircularProgressIndicator();
//             }
//             // Status 2: Future Selesai dengan Error
//             else if (snapshot.hasError) {
//               return Text(
//                 'Error Lokasi: ${snapshot.error}',
//                 textAlign: TextAlign.center,
//               );
//             }
//             // Status 3: Future Selesai dengan Data (Sukses)
//             else if (snapshot.hasData) {
//               return Column(
//                 mainAxisAlignment: MainAxisAlignment.center,
//                 children: [
//                   const Icon(Icons.location_on, size: 40, color: Colors.green),
//                   const SizedBox(height: 10),
//                   const Text(
//                     'Lokasi Berhasil Diambil:',
//                     style: TextStyle(fontSize: 16),
//                   ),
//                   Text(
//                     // Akses data dari snapshot.data
//                     'Latitude: ${snapshot.data!.latitude.toStringAsFixed(4)}, \nLongitude: ${snapshot.data!.longitude.toStringAsFixed(4)}',
//                     textAlign: TextAlign.center,
//                     style: const TextStyle(
//                       fontWeight: FontWeight.bold,
//                       fontSize: 18,
//                     ),
//                   ),
//                 ],
//               );
//             }
//             // Status 4: Default (Jika tidak ada data atau error)
//             else {
//               return const Text('Menunggu inisialisasi lokasi.');
//             }
//           },
//         ),
//       ),
//     );
//   }
// }
// prak 6
// import 'package:flutter/material.dart';
// import 'package:geolocator/geolocator.dart'; // Praktikum 6: Geolocator

// void main() {
//   runApp(const MyApp());
// }

// class MyApp extends StatelessWidget {
//   const MyApp({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'Geolocator InitState Codelab',
//       theme: ThemeData(primarySwatch: Colors.blue),
//       home: const FuturePage(),
//     );
//   }
// }

// class FuturePage extends StatefulWidget {
//   const FuturePage({super.key});

//   @override
//   State<FuturePage> createState() => _FuturePageState();
// }

// class _FuturePageState extends State<FuturePage> {
//   // Praktikum 6: Variabel untuk menyimpan Future
//   // Nilai ini akan diinisialisasi di initState
//   late Future<Position> _futurePosition;

//   // Langkah 2 Praktikum 6: Method untuk mendapatkan lokasi
//   // SOAL 11: Menjelaskan maksud kode ini
//   Future<Position> _determinePosition() async {
//     bool serviceEnabled;
//     LocationPermission permission;

//     // Cek apakah layanan lokasi aktif
//     serviceEnabled = await Geolocator.isLocationServiceEnabled();
//     if (!serviceEnabled) {
//       return Future.error('Location services are disabled.');
//     }

//     // Cek status permission
//     permission = await Geolocator.checkPermission();
//     if (permission == LocationPermission.denied) {
//       // Minta permission jika ditolak
//       permission = await Geolocator.requestPermission();
//       if (permission == LocationPermission.denied) {
//         return Future.error('Location permissions are denied');
//       }
//     }

//     if (permission == LocationPermission.deniedForever) {
//       return Future.error(
//         'Location permissions are permanently denied, we cannot request permissions.',
//       );
//     }

//     // Jika semua cek lolos, dapatkan posisi saat ini
//     return await Geolocator.getCurrentPosition();
//   }

//   // Langkah 3 Praktikum 6: Memanggil Future di initState
//   // SOAL 11: Menjelaskan maksud kode ini
//   @override
//   void initState() {
//     super.initState();
//     // Memulai operasi Future segera setelah widget dibuat
//     _futurePosition = _determinePosition();
//   }

//   // Tampilan UI sederhana karena Praktikum 7 akan mengganti ini dengan FutureBuilder
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(title: const Text('Future di initState')),
//       body: Center(
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: <Widget>[
//             // const Text('Praktikum 6: Future dimulai di initState.'),
//             // const Text(
//             //   'Hasil akan diolah dan ditampilkan pada Praktikum 7 (FutureBuilder).',
//             // ),
//             // Kita harus menguji Future secara manual karena belum pakai FutureBuilder:
//             ElevatedButton(
//               child: const Text('Cek Hasil (Manual)'),
//               onPressed: () {
//                 _futurePosition
//                     .then((position) {
//                       // Jika sukses:
//                       print(
//                         'Latitude: ${position.latitude}, Longitude: ${position.longitude}',
//                       );
//                     })
//                     .catchError((e) {
//                       // Jika error:
//                       print('Error Lokasi: $e');
//                     });
//               },
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
//prak 5
// import 'package:flutter/material.dart';

// void main() {
//   runApp(const MyApp());
// }

// class MyApp extends StatelessWidget {
//   const MyApp({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       // SOAL 1: Mengisi nama dengan Innama Maesa
//       title: 'Error Handling Codelab - Innama Maesa',
//       theme: ThemeData(primarySwatch: Colors.blue),
//       home: const FuturePage(),
//     );
//   }
// }

// class FuturePage extends StatefulWidget {
//   const FuturePage({super.key});

//   @override
//   State<FuturePage> createState() => _FuturePageState();
// }

// class _FuturePageState extends State<FuturePage> {
//   String result = 'Tekan tombol GO!';

//   // Langkah 1 Praktikum 5: Method yang melempar Exception (untuk diuji dengan .catchError())
//   Future throwException() async {
//     await Future.delayed(const Duration(seconds: 2));
//     throw Exception('Error di method throwException!');
//   }

//   // Langkah 4 Praktikum 5: Method yang menangani Exception dengan try-catch
//   // SOAL 10: Menjelaskan perbedaan dengan Langkah 1
//   Future handleError() async {
//     try {
//       await Future.delayed(const Duration(seconds: 2));
//       // Melempar error di dalam blok try
//       throw Exception('Error di method handleError! (Ditangkap try-catch)');
//     } catch (e) {
//       // Menangkap error di dalam blok catch
//       print('Error: $e');
//       setState(() {
//         result = e.toString();
//       });
//     } finally {
//       // Blok finally selalu dijalankan
//       print('Complete');
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(title: const Text('Asynchronous Error Handling')),
//       body: Center(
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: <Widget>[
//             const SizedBox(
//               width: 20,
//               height: 20,
//               child: CircularProgressIndicator(),
//             ),
//             const SizedBox(height: 10),
//             Text(result),
//             const SizedBox(height: 10),
//             ElevatedButton(
//               child: const Text('GO!'),
//               onPressed: () {
//                 setState(() {
//                   result = 'Menunggu operasi...';
//                 });

//                 // --- PILIH SALAH SATU UNTUK MENGUJI ---

//                 // Pilihan A: Menguji dengan try-catch di dalam async (Langkah 4 & SOAL 10)
//                 handleError();

//                 // Pilihan B: Menguji dengan then().catchError() (Langkah 2 & SOAL 9)
//                 /*
//                 throwException().then((_) {
//                   setState(() {
//                     result = 'Complete (Sukses)';
//                   });
//                 }).catchError((e) {
//                   setState(() {
//                     result = e.toString();
//                   });
//                 }).whenComplete(() {
//                   print('Complete');
//                 });
//                 */
//               },
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
// prak 4
// import 'package:flutter/material.dart';
// import 'dart:async'; // Diperlukan untuk Future.delayed

// void main() {
//   runApp(const MyApp());
// }

// class MyApp extends StatelessWidget {
//   const MyApp({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       // SOAL 1: Tambahkan nama panggilan pada title
//       title: 'Future.wait Codelab - Innama maesa',
//       theme: ThemeData(primarySwatch: Colors.blue),
//       home: const FuturePage(),
//     );
//   }
// }

// class FuturePage extends StatefulWidget {
//   const FuturePage({super.key});

//   @override
//   State<FuturePage> createState() => _FuturePageState();
// }

// class _FuturePageState extends State<FuturePage> {
//   String result = 'Tekan tombol GO!';

//   // Langkah 1 Praktikum 4: Method Future dengan delay 3 detik (sama seperti Praktikum 2)
//   Future<int> returnOneAsync() async {
//     await Future.delayed(const Duration(seconds: 3));
//     return 1;
//   }

//   Future<int> returnTwoAsync() async {
//     await Future.delayed(const Duration(seconds: 3));
//     return 2;
//   }

//   Future<int> returnThreeAsync() async {
//     await Future.delayed(const Duration(seconds: 3));
//     return 3;
//   }

//   // Method yang menjalankan ketiga Future secara PARALEL
//   Future<List<int>> countParallel() async {
//     // Langkah 4 Praktikum 4: Menggunakan Future.wait
//     // SOAL 8: Menjelaskan perbedaan dengan await sekuensial
//     final futures = Future.wait<int>([
//       returnOneAsync(),
//       returnTwoAsync(),
//       returnThreeAsync(),
//     ]);
//     // Future.wait akan selesai setelah Future terlama selesai (3 detik)
//     return futures;
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(title: const Text('Future.wait Parallel')),
//       body: Center(
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: <Widget>[
//             const SizedBox(
//               width: 20,
//               height: 20,
//               child: CircularProgressIndicator(),
//             ),
//             const SizedBox(height: 10),
//             Text(result),
//             const SizedBox(height: 10),
//             ElevatedButton(
//               child: const Text('GO!'),
//               onPressed: () {
//                 setState(() {
//                   result = 'Menghitung secara Paralel... (Tunggu 3 detik)';
//                 });

//                 // Memanggil method countParallel()
//                 countParallel()
//                     .then((listValues) {
//                       // Hasil dikembalikan sebagai List<int>
//                       int total = listValues[0] + listValues[1] + listValues[2];
//                       setState(() {
//                         result = total.toString(); // Output: 6
//                       });
//                     })
//                     .catchError((e) {
//                       setState(() {
//                         result = 'Error: $e';
//                       });
//                     });
//               },
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
// prak 3
// import 'package:flutter/material.dart';
// import 'dart:async'; // Diperlukan untuk Completer

// void main() {
//   runApp(const MyApp());
// }

// class MyApp extends StatelessWidget {
//   const MyApp({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       // SOAL 1: Tambahkan nama panggilan pada title
//       title: 'Completer Codelab - Innama maesa',
//       theme: ThemeData(primarySwatch: Colors.blue),
//       home: const FuturePage(),
//     );
//   }
// }

// class FuturePage extends StatefulWidget {
//   const FuturePage({super.key});

//   @override
//   State<FuturePage> createState() => _FuturePageState();
// }

// class _FuturePageState extends State<FuturePage> {
//   String result = 'Tekan tombol GO!';

//   // Langkah 2 Praktikum 3: Variabel Completer
//   late Completer completer;

//   // Langkah 2 Praktikum 3: Method untuk membuat dan mengembalikan Future
//   Future getNumber() {
//     completer = Completer<int>();
//     // calculate(); // Versi Sukses (untuk Soal 5)
//     calculateWithError(); // Versi Error (untuk Soal 6)
//     return completer
//         .future; // Mengembalikan Future yang akan diselesaikan nanti
//   }

//   // Langkah 2 Praktikum 3: Method untuk menyelesaikan Future dengan nilai (SUKSES)
//   Future calculate() async {
//     await Future.delayed(const Duration(seconds: 5));
//     completer.complete(42); // Menyelesaikan Future dengan nilai 42
//   }

//   // Langkah 5 Praktikum 3: Method untuk menyelesaikan Future dengan error (ERROR)
//   Future calculateWithError() async {
//     await Future.delayed(const Duration(seconds: 5));
//     completer.completeError(
//       Exception('Terjadi Kesalahan di Completer (Soal 6)!'),
//     ); // Menyelesaikan Future dengan error
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(title: const Text('Completer Async')),
//       body: Center(
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: <Widget>[
//             const SizedBox(
//               width: 20,
//               height: 20,
//               child: CircularProgressIndicator(),
//             ),
//             const SizedBox(height: 10),
//             Text(result),
//             const SizedBox(height: 10),
//             ElevatedButton(
//               child: const Text('GO!'),
//               onPressed: () {
//                 setState(() {
//                   result = 'Menunggu Completer... (Tunggu 5 detik)';
//                 });

//                 // Langkah 3 Praktikum 3: Memanggil getNumber() dan menangani hasil
//                 getNumber()
//                     .then((value) {
//                       setState(() {
//                         result = value
//                             .toString(); // Dipanggil jika SUKSES (calculate)
//                       });
//                     })
//                     .catchError((e) {
//                       // Langkah 6 Praktikum 3: Penanganan error
//                       setState(() {
//                         result =
//                             'An error occurred: $e'; // Dipanggil jika ERROR (calculateWithError)
//                       });
//                     });
//               },
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
// prak 2
// import 'package:flutter/material.dart';

// void main() {
//   runApp(const MyApp());
// }

// class MyApp extends StatelessWidget {
//   const MyApp({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       // SOAL 1: Tambahkan nama panggilan pada title
//       title: 'Async/Await Codelab - Innama maesa',
//       theme: ThemeData(primarySwatch: Colors.blue),
//       home: const FuturePage(),
//     );
//   }
// }

// class FuturePage extends StatefulWidget {
//   const FuturePage({super.key});

//   @override
//   State<FuturePage> createState() => _FuturePageState();
// }

// class _FuturePageState extends State<FuturePage> {
//   String result = 'Tekan tombol GO!';

//   // Langkah 1 Praktikum 2: Tiga method Future dengan delay 3 detik
//   Future<int> returnOneAsync() async {
//     await Future.delayed(const Duration(seconds: 3));
//     return 1;
//   }

//   Future<int> returnTwoAsync() async {
//     await Future.delayed(const Duration(seconds: 3));
//     return 2;
//   }

//   Future<int> returnThreeAsync() async {
//     await Future.delayed(const Duration(seconds: 3));
//     return 3;
//   }

//   // Langkah 2 Praktikum 2: Method count() yang memanggil secara sekuensial
//   // SOAL 4: Menjelaskan maksud kode ini
//   Future<int> count() async {
//     int total = 0;
//     // 'await' memaksa menunggu 3 detik sebelum lanjut
//     total += await returnOneAsync();
//     // 'await' memaksa menunggu 3 detik sebelum lanjut
//     total += await returnTwoAsync();
//     // 'await' memaksa menunggu 3 detik sebelum lanjut
//     total += await returnThreeAsync();
//     return total; // Total 9 detik
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(title: const Text('Async/Await Sequential')),
//       body: Center(
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: <Widget>[
//             const SizedBox(
//               width: 20,
//               height: 20,
//               child: CircularProgressIndicator(),
//             ),
//             const SizedBox(height: 10),
//             Text(result),
//             const SizedBox(height: 10),
//             ElevatedButton(
//               child: const Text('GO!'),
//               onPressed: () {
//                 setState(() {
//                   result = 'Menghitung... (Tunggu 9 detik)';
//                 });

//                 // Langkah 3 Praktikum 2: Memanggil method count()
//                 count().then((value) {
//                   setState(() {
//                     result = value.toString(); // Output: 6
//                   });
//                 });
//               },
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
// prak 1
// import 'package:flutter/material.dart';
// import 'package:http/http.dart' as http;
// import 'dart:convert';

// void main() {
//   runApp(const MyApp());
// }

// class MyApp extends StatelessWidget {
//   const MyApp({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'Books Innama Maesa ',
//       theme: ThemeData(primarySwatch: Colors.blue),
//       home: const FuturePage(),
//     );
//   }
// }

// class FuturePage extends StatefulWidget {
//   const FuturePage({super.key});

//   @override
//   State<FuturePage> createState() => _FuturePageState();
// }

// class _FuturePageState extends State<FuturePage> {
//   String result = 'Tekan tombol GO!';

//   Future getData() async {
//     const String path =
//         'https://www.googleapis.com/books/v1/volumes/YLo8DwAAQBAJ';
//     final url = Uri.parse(path);
//     final response = await http.get(url);

//     if (response.statusCode == 200) {
//       return response.body;
//     } else {
//       throw Exception(
//         'Gagal memuat data buku (Status Code: ${response.statusCode})',
//       );
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(title: const Text('Books Innama Maesa')),
//       body: Center(
//         child: SingleChildScrollView(
//           child: Column(
//             mainAxisAlignment: MainAxisAlignment.center,
//             children: <Widget>[
//               const SizedBox(
//                 width: 20,
//                 height: 20,
//                 child: CircularProgressIndicator(),
//               ),
//               const SizedBox(height: 10),
//               // Menggunakan selectable text agar JSON mudah dicopy jika perlu
//               SelectableText(result),
//               const SizedBox(height: 10),
//               ElevatedButton(
//                 child: const Text('GO!'),
//                 onPressed: () {
//                   setState(() {
//                     result = 'Loading...';
//                   });

//                   getData()
//                       .then((value) {
//                         setState(() {
//                           // Menampilkan seluruh string JSON
//                           result = value.toString();
//                         });
//                       })
//                       .catchError((e) {
//                         setState(() {
//                           result = 'Error: $e';
//                         });
//                       });
//                 },
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
