import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    // variabel titleSection
    Widget titleSection = Container(
      padding: const EdgeInsets.all(
        32,
      ), // sesuai soal, padding 32 di setiap sisi
      child: Row(
        children: [
          Expanded(
            /* soal 1 */
            child: Column(
              crossAxisAlignment:
                  CrossAxisAlignment.start, // kolom mulai dari kiri
              children: [
                /* soal 2 */
                Container(
                  padding: const EdgeInsets.only(bottom: 8), // padding bawah 8
                  child: const Text(
                    'Wisata Gunung di Batu',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ),
                const Text(
                  'Batu, Malang, Indonesia',
                  style: TextStyle(
                    color: Colors.grey, // warna abu-abu
                  ),
                ),
              ],
            ),
          ),
          /* soal 3 */
          const Icon(Icons.star, color: Colors.red),
          const Text('41'),
        ],
      ),
    );

    Color color = Theme.of(context).primaryColor;

    Widget buttonSection = Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        _buildButtonColumn(color, Icons.call, 'CALL'),
        _buildButtonColumn(color, Icons.near_me, 'ROUTE'),
        _buildButtonColumn(color, Icons.share, 'SHARE'),
      ],
    );

    Widget imageSection = Image.asset(
      'gunung_panderman.jpeg',
      width: 600,
      height: 240,
      fit: BoxFit.cover,
    );

    Widget textSection = Container(
      padding: const EdgeInsets.all(32),
      child: const Text(
        'Gunung Panderman adalah salah satu destinasi wisata '
        'favorit di Batu, Malang. Dari puncaknya, wisatawan dapat '
        'menikmati pemandangan kota Batu dan sekitarnya yang indah. '
        '\n\n'
        'Disusun oleh:\n'
        'Innama Maesa Putri\n'
        'NIM: 2341720235',
        softWrap: true,
      ),
    );

    return MaterialApp(
      title: 'Flutter layout: Innama Maesa Putri dan 2341720235',
      home: Scaffold(
        appBar: AppBar(title: const Text('Flutter layout demo')),
        body: ListView(
          children: [
            imageSection,
            titleSection, // ganti Hello World dengan titleSection
            buttonSection,
            textSection,
          ],
        ),
      ),
    );
  }

  Column _buildButtonColumn(Color color, IconData icon, String label) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(icon, color: color),
        Container(
          margin: const EdgeInsets.only(top: 8),
          child: Text(
            label,
            style: TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.w400,
              color: color,
            ),
          ),
        ),
      ],
    );
  }
}
