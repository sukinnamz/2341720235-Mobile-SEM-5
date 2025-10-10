// lib/widgets/register_content.dart

import 'package:flutter/material.dart';
import 'action_button.dart';
import 'custom_dropdown_field.dart';
import 'custom_text_field.dart';
import 'file_upload_field.dart';

class RegisterContent extends StatelessWidget {
  // Callback untuk memberitahu AuthPage agar pindah ke tab Login
  final VoidCallback onRegisterSuccess;

  const RegisterContent({
    super.key,
    required this.onRegisterSuccess, // Terima callback
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      key: const ValueKey('register'),
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        const Text(
          'Daftar Akun',
          style: TextStyle(
            fontSize: 28,
            fontWeight: FontWeight.bold,
            color: Colors.black87,
          ),
        ),
        const SizedBox(height: 8),
        Text(
          'Lengkapi formulir untuk membuat akun',
          style: TextStyle(fontSize: 16, color: Colors.grey[600]),
        ),
        const SizedBox(height: 32),
        // ... (Field lainnya)
        const CustomTextField(
          label: 'Nama lengkap',
          hint: 'Masukkan nama lengkap',
        ),
        const SizedBox(height: 24),
        const CustomTextField(label: 'NIK', hint: 'Masukkan NIK sesuai KTP'),
        const SizedBox(height: 24),
        const CustomTextField(label: 'Email', hint: 'Masukkan email aktif'),
        const SizedBox(height: 24),
        // CATATAN: Field No Telepon tidak perlu diubah di sini, tapi di custom_text_field.dart
        const CustomTextField(
          label: 'No Telepon',
          hint: '08xxxxxxxxxx',
          isNumeric: true,
        ),
        const SizedBox(height: 24),
        const CustomTextField(
          label: 'Password',
          hint: 'Masukkan password',
          isObscure: true,
        ),
        const SizedBox(height: 24),
        const CustomTextField(
          label: 'Konfirmasi Password',
          hint: 'Masukkan ulang password',
          isObscure: true,
        ),
        const SizedBox(height: 24),
        const CustomDropdownField(
          label: 'Jenis Kelamin',
          hint: '-- Pilih Jenis Kelamin --',
          items: ['Laki-laki', 'Perempuan'],
        ),
        const SizedBox(height: 24),
        const CustomDropdownField(
          label: 'Rumah',
          hint: '-- Pilih Rumah --',
          items: ['Tipe A', 'Tipe B', 'Tipe C'],
        ),
        const SizedBox(height: 24),
        const FileUploadField(),
        const SizedBox(height: 40),
        ActionButton(
          label: 'Buat Akun',
          onPressed: () {
            // TODO: Tambahkan logika validasi dan pengiriman data di sini.

            // Setelah proses register selesai/berhasil:
            onRegisterSuccess(); // Panggil callback untuk pindah ke tab Login
          },
        ),
        const SizedBox(height: 24), // Tambahkan padding di bagian bawah
      ],
    );
  }
}
