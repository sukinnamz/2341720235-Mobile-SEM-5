import 'package:flutter/material.dart';
import 'stream.dart'; // Import NumberStream

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'StreamBuilder Praktikum',
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
  // Variabel untuk instance NumberStream
  late NumberStream numberStream;

  @override
  void initState() {
    super.initState();
    // 6. Inisialisasi NumberStream
    numberStream = NumberStream();
  }

  // 7. Edit method build()
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Stream')),
      body: Center(
        // Mengganti Column/Text dengan StreamBuilder
        child: StreamBuilder<int>(
          // Tentukan Stream yang akan didengarkan
          stream: numberStream.getNumberStream(),
          // Tentukan nilai awal sebelum data stream diterima
          initialData: 0,

          // Builder function yang dipanggil setiap kali ada event baru
          builder: (context, snapshot) {
            // Mengecek status koneksi (Langkah 7.a)
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const CircularProgressIndicator();
            }

            // Mengecek apakah ada error
            if (snapshot.hasError) {
              return const Text('Error saat menerima data!');
            }

            // Mengecek apakah ada data
            if (snapshot.hasData) {
              // Menampilkan data yang diterima dari stream (Langkah 7.b)
              return Text(
                snapshot.data.toString(),
                style: const TextStyle(
                  fontSize: 48.0,
                  fontWeight: FontWeight.bold,
                ),
              );
            }

            // Default, jika tidak ada data dan tidak ada error
            return const Text('Tidak ada data');
          },
        ),
      ),
    );
  }
}
