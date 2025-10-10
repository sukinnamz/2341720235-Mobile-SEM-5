// lib/widgets/custom_text_field.dart

import 'package:flutter/material.dart';
import 'package:flutter/services.dart'; // Import ini untuk FilteringTextInputFormatter

class CustomTextField extends StatelessWidget {
  final String label;
  final String hint;
  final bool isObscure;
  final bool isNumeric; // Properti baru untuk input angka

  const CustomTextField({
    super.key,
    required this.label,
    required this.hint,
    this.isObscure = false,
    this.isNumeric = false, // Nilai default false
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: TextStyle(
            fontSize: 16,
            color: Colors.grey[800],
            fontWeight: FontWeight.w500,
          ),
        ),
        const SizedBox(height: 8.0),
        TextField(
          obscureText: isObscure,
          // Mengatur keyboard dan formatter jika isNumeric true
          keyboardType: isNumeric ? TextInputType.phone : TextInputType.text,
          inputFormatters: isNumeric
              ? [
                  FilteringTextInputFormatter.digitsOnly,
                ] // Hanya terima digit (0-9)
              : null,
          decoration: InputDecoration(
            hintText: hint,
            hintStyle: TextStyle(color: Colors.grey[400]),
            filled: true,
            fillColor: Colors.grey[100],
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12.0),
              borderSide: BorderSide.none,
            ),
            contentPadding: const EdgeInsets.symmetric(
              vertical: 16.0,
              horizontal: 20.0,
            ),
          ),
        ),
      ],
    );
  }
}
