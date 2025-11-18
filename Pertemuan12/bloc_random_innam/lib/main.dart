import 'package:flutter/material.dart';
import 'random_screen.dart'; // Import RandomScreen

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'BLoC Random',
      theme: ThemeData(primarySwatch: Colors.deepPurple),
      // Menampilkan RandomScreen
      home: const RandomScreen(),
    );
  }
}
