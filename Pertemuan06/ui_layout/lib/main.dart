import 'package:flutter/material.dart';

// You can run this main function with the MyApp widget.
void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: Scaffold(body: Center(child: RecipeCard())),
      title: 'Innama Maesa Putri - 2341720235',
    );
  }
}

class RecipeCard extends StatelessWidget {
  const RecipeCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(20.0),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.red, width: 2.0),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          // Kolom teks
          Container(
            padding: const EdgeInsets.all(12.0),
            color: Colors.white,
            width: 200,
            child: const Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                // Judul
                Text(
                  'Onigiri',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
                SizedBox(height: 8),

                // Deskripsi
                Text(
                  'Onigiri adalah makanan tradisional Jepang berupa nasi kepal '
                  'yang biasanya dibentuk segitiga atau bulat dan dibungkus dengan nori. '
                  'Isian bisa berupa tuna, salmon, umeboshi, atau ayam teriyaki.',
                  style: TextStyle(fontSize: 12, color: Colors.black87),
                ),
                SizedBox(height: 12),

                // Rating & Review
                RatingAndReviews(),
                SizedBox(height: 12),

                // Statistik resep
                RecipeStats(),
              ],
            ),
          ),

          // Gambar
          Expanded(child: Image.asset('onigiri.jpg', fit: BoxFit.cover)),
        ],
      ),
    );
  }
}

// Widget Rating
class RatingAndReviews extends StatelessWidget {
  const RatingAndReviews({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 4.0, horizontal: 8.0),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.red, width: 1.0),
        borderRadius: BorderRadius.circular(4.0),
      ),
      child: const Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Row(
            children: <Widget>[
              Icon(Icons.star, color: Colors.red, size: 16),
              Icon(Icons.star, color: Colors.red, size: 16),
              Icon(Icons.star, color: Colors.red, size: 16),
              Icon(Icons.star, color: Colors.red, size: 16),
              Icon(Icons.star_border, color: Colors.red, size: 16),
            ],
          ),
          Text(
            '95 Reviews',
            style: TextStyle(fontSize: 12, color: Colors.black87),
          ),
        ],
      ),
    );
  }
}

// Widget Statistik
class RecipeStats extends StatelessWidget {
  const RecipeStats({super.key});

  Widget _buildStatColumn(IconData icon, String title, String value) {
    return Expanded(
      child: Container(
        decoration: const BoxDecoration(
          border: Border(right: BorderSide(color: Colors.grey, width: 0.5)),
        ),
        padding: const EdgeInsets.symmetric(vertical: 4.0),
        child: Column(
          children: <Widget>[
            Icon(icon, color: Colors.red, size: 20),
            Text(
              title,
              style: const TextStyle(
                fontSize: 10,
                color: Colors.red,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              value,
              style: const TextStyle(fontSize: 12, color: Colors.black),
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey, width: 1.0),
      ),
      child: Row(
        children: <Widget>[
          _buildStatColumn(Icons.calendar_today, 'PREP', '15 min'),
          _buildStatColumn(Icons.timer, 'COOK', '20 min'),
          Expanded(
            child: Container(
              padding: const EdgeInsets.symmetric(vertical: 4.0),
              child: const Column(
                children: <Widget>[
                  Icon(Icons.restaurant, color: Colors.red, size: 20),
                  Text(
                    'FEEDS',
                    style: TextStyle(
                      fontSize: 10,
                      color: Colors.red,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    '2-3',
                    style: TextStyle(fontSize: 12, color: Colors.black),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
