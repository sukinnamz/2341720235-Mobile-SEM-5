// lib/widgets/dashboard/summary_value_card.dart

import 'package:flutter/material.dart';
import '../../constants/app_colors.dart'; // Pastikan file ini ada

class SummaryValueCard extends StatelessWidget {
  final String title;
  final String value;
  final Color color;
  final IconData icon;
  final Color iconColor;

  const SummaryValueCard({
    super.key,
    required this.title,
    required this.value,
    required this.color,
    required this.icon,
    required this.iconColor,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 2,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      color: color,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  title,
                  style: TextStyle(fontSize: 14, color: Colors.grey[700]),
                ),
                Icon(icon, color: iconColor, size: 24),
              ],
            ),
            const SizedBox(height: 8),
            Text(
              value,
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: iconColor,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
