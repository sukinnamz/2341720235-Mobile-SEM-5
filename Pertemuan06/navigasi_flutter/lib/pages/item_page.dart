import 'package:flutter/material.dart';
import '../models/item.dart';

class ItemPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final itemArgs = ModalRoute.of(context)!.settings.arguments as Item;

    return Scaffold(
      appBar: AppBar(title: Text(itemArgs.name)),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Hero(
                tag: itemArgs.name,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(12),
                  child: Image.asset(
                    // pakai Image.asset kalau dari assets
                    itemArgs.image,
                    width: double.infinity,
                    height: 200,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              SizedBox(height: 16),

              // Nama Produk
              Text(
                itemArgs.name,
                style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 8),

              // Harga
              Text(
                "Rp ${itemArgs.price}",
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.green,
                ),
              ),
              SizedBox(height: 8),

              // Stok
              Text(
                "Stok: ${itemArgs.stock}",
                style: TextStyle(fontSize: 16, color: Colors.grey[700]),
              ),
              SizedBox(height: 8),

              // Rating
              Row(
                children: List.generate(5, (i) {
                  return Icon(
                    i < itemArgs.rating.round()
                        ? Icons.star
                        : Icons.star_border,
                    color: Colors.orange,
                  );
                }),
              ),
              SizedBox(height: 20),

              // Deskripsi tambahan
              Text(
                "Deskripsi Produk",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 8),
              Text(
                "Produk ini adalah ${itemArgs.name}. "
                "Dijual dengan kualitas terbaik dan harga terjangkau. "
                "Cocok untuk kebutuhan sehari-hari Anda.",
                style: TextStyle(fontSize: 14, height: 1.5),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        child: Padding(
          padding: EdgeInsets.all(8),
          child: Text(
            'Innama Maesa Putri - 2341720235',
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
          ),
        ),
      ),
    );
  }
}
