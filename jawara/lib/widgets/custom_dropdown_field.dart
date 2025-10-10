// lib/widgets/custom_dropdown_field.dart

import 'package:flutter/material.dart';

class CustomDropdownField extends StatelessWidget {
  final String label;
  final String hint;
  final List<String> items;

  const CustomDropdownField({
    super.key,
    required this.label,
    required this.hint,
    required this.items,
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
        DropdownButtonFormField<String>(
          decoration: InputDecoration(
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
          hint: Text(hint, style: TextStyle(color: Colors.grey[400])),
          items: items.map((String value) {
            return DropdownMenuItem<String>(value: value, child: Text(value));
          }).toList(),
          onChanged: (_) {},
        ),
      ],
    );
  }
}
