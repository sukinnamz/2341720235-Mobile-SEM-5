import 'package:flutter/material.dart';
import 'dart:async'; // Diperlukan untuk StreamSubscription
import 'stream.dart'; // Import class ColorStream

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Stream Praktikum',
      theme: ThemeData(
        // Gantilah warna tema sesuai kesukaan Anda (contoh: deepPurple)
        primarySwatch: Colors.deepPurple,
      ),
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
  // Variabel untuk menampung warna saat ini
  Color currentColor = Colors.yellow;

  // Variabel untuk menampung langganan stream
  late StreamSubscription subscription;

  // Instance dari ColorStream
  late ColorStream colorStream;

  @override
  void initState() {
    super.initState();
    // Inisialisasi ColorStream
    colorStream = ColorStream();

    // Memulai mendengarkan stream dan mengubah state (warna)
    changeColor();
  }

  // Method untuk mendengarkan stream
  void changeColor() {
    // Melakukan 'listen' pada stream
    subscription = colorStream.getColors().listen((eventColor) {
      // Mengubah state (warna) setiap kali data baru diterima dari stream
      setState(() {
        currentColor = eventColor;
      });
    });
  }

  // Penting: Batalkan langganan ketika widget dihancurkan
  @override
  void dispose() {
    subscription.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // Tambahkan nama panggilan Anda pada title (contoh: Stream - Budi)
        title: const Text('Stream - Innam'),
      ),
      // Latar belakang diubah berdasarkan state currentColor
      body: Container(color: currentColor),
    );
  }
}
