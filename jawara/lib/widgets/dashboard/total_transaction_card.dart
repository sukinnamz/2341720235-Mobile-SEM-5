// lib/widgets/dashboard/total_transaction_card.dart

import 'package:flutter/material.dart';

class TotalTransactionCard extends StatelessWidget {
  final int transactionCount;

  const TotalTransactionCard({super.key, required this.transactionCount});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 2,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      color: Colors.yellow.shade100,
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              "💰 Jumlah Transaksi : $transactionCount",
              style: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Color(0xFF333333),
              ),
            ),
            const Icon(Icons.receipt_long, color: Colors.amber, size: 30),
          ],
        ),
      ),
    );
  }
}
