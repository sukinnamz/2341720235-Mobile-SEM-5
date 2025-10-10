import 'package:flutter/material.dart';
import 'package:jawara/pages/auth_page.dart';
import 'package:jawara/pages/dashboard_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Jawara Pintar',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        fontFamily: 'Poppins',
        scaffoldBackgroundColor: Colors.white,
      ),
      debugShowCheckedModeBanner: false,
      // Menggunakan struktur rute seperti yang Anda minta
      initialRoute: '/',
      routes: {
        '/': (context) => const AuthPage(),
        '/dashboard': (context) =>
            const DashboardPage(), // Ganti dengan halaman dashboard yang sebenarnya
        // Anda bisa menambahkan rute lain di sini nanti, contoh:
        // '/home': (context) => const HomePage(),
      },
    );
  }
}
