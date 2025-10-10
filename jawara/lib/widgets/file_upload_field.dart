// lib/widgets/file_upload_field.dart

import 'package:flutter/material.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:file_selector/file_selector.dart';

class FileUploadField extends StatefulWidget {
  const FileUploadField({super.key});

  @override
  State<FileUploadField> createState() => _FileUploadFieldState();
}

class _FileUploadFieldState extends State<FileUploadField> {
  // Variabel untuk menyimpan nama file yang dipilih
  String? _fileName;

  // Fungsi untuk membuka dialog pemilihan file
  Future<void> _pickFile() async {
    // 1. Definisikan tipe file yang diizinkan (hanya gambar)
    const XTypeGroup typeGroup = XTypeGroup(
      label: 'images',
      extensions: <String>['jpg', 'png', 'jpeg', 'pdf'],
    );

    // 2. Membuka dialog pemilih file
    // Menggunakan openFile() karena Anda ingin memilih 1 file saja
    final XFile? file = await openFile(
      acceptedTypeGroups: <XTypeGroup>[typeGroup],
    );

    if (file != null) {
      // Jika file berhasil dipilih
      setState(() {
        // file.name berisi nama file (mis: 'foto.png')
        _fileName = file.name;

        // file.path berisi path file lokal (mis: '/tmp/foto.png')
        // Anda bisa menggunakan file.path untuk mengunggah
        // Contoh: print(file.path);
      });
    } else {
      // User membatalkan pemilihan (file akan null)
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Foto Identitas',
          style: TextStyle(
            fontSize: 16,
            color: Colors.grey[800],
            fontWeight: FontWeight.w500,
          ),
        ),
        const SizedBox(height: 8.0),

        // Membungkus DottedBorder dengan GestureDetector
        GestureDetector(
          onTap: _pickFile, // Panggil fungsi saat area diklik
          child: DottedBorder(
            borderType: BorderType.RRect,
            radius: const Radius.circular(12),
            color: _fileName != null
                ? Colors.green
                : Colors.grey[400]!, // Warna border berubah jika file ada
            strokeWidth: 1.5,
            dashPattern: const [6, 6],
            child: Container(
              height: 150,
              decoration: BoxDecoration(
                color: Colors.grey.withOpacity(0.05),
                borderRadius: BorderRadius.circular(12),
              ),
              child: Center(
                child: _fileName != null
                    ? Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Icon(
                            Icons.check_circle,
                            size: 40,
                            color: Colors.green,
                          ),
                          const SizedBox(height: 8),
                          // Menampilkan nama file yang dipilih
                          Padding(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 10.0,
                            ),
                            child: Text(
                              'File dipilih: $_fileName',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                color: Colors.green[700],
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ],
                      )
                    : Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.upload_file_outlined,
                            size: 40,
                            color: Colors.grey[500],
                          ),
                          const SizedBox(height: 8),
                          Text(
                            'Upload foto KK/KTP (.png/.jpg)',
                            style: TextStyle(color: Colors.grey[600]),
                          ),
                        ],
                      ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
