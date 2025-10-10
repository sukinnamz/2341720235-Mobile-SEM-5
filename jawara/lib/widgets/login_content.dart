// lib/widgets/login_content.dart

import 'package:flutter/material.dart';
import 'action_button.dart';
import 'custom_text_field.dart';

class LoginContent extends StatelessWidget {
  const LoginContent({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      key: const ValueKey('login'), // Kunci untuk animasi
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        const Text(
          'Selamat Datang,',
          style: TextStyle(
            fontSize: 28,
            fontWeight: FontWeight.bold,
            color: Colors.black87,
          ),
        ),
        const SizedBox(height: 8),
        Text(
          'Login untuk mengakses sistem Jawara Pintar',
          style: TextStyle(fontSize: 16, color: Colors.grey[600]),
        ),
        const SizedBox(height: 32),
        const CustomTextField(label: 'Email', hint: 'Masukkan email aktif'),
        const SizedBox(height: 24),
        const CustomTextField(
          label: 'Password',
          hint: 'Masukkan password',
          isObscure: true,
        ),
        const SizedBox(height: 40),
        ActionButton(
          label: 'Login',
          onPressed: () {
            Navigator.of(context).pushNamedAndRemoveUntil(
              '/dashboard',
              (Route<dynamic> route) =>
                  false, // Ini memastikan semua rute sebelumnya (Login) dihapus
            );
          },
        ),
      ],
    );
  }
}
