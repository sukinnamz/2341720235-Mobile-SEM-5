import 'package:flutter/material.dart';
import 'random_bloc.dart'; // Import BLoC

// 10. Buat StatefulWidget
class RandomScreen extends StatefulWidget {
  const RandomScreen({super.key});

  @override
  State<RandomScreen> createState() => _RandomScreenState();
}

class _RandomScreenState extends State<RandomScreen> {
  // 11. Buat variabel untuk instance BLoC
  late RandomNumberBloc _bloc;

  @override
  void initState() {
    super.initState();
    _bloc = RandomNumberBloc();
  }

  // 12. Buat method dispose()
  @override
  void dispose() {
    _bloc.dispose();
    super.dispose();
  }

  // 13. Edit method build()
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('BLoC Random Number')),
      body: Center(
        // Menggunakan StreamBuilder untuk mendengarkan Stream dari BLoC
        child: StreamBuilder<int>(
          stream: _bloc.randomStream,
          initialData: 0, // Nilai awal
          builder: (context, snapshot) {
            final number = snapshot.data ?? 0;
            return Text(
              number.toString(),
              style: const TextStyle(
                fontSize: 96.0,
                fontWeight: FontWeight.bold,
              ),
            );
          },
        ),
      ),
      // Tombol Floating Action Button (FAB) sebagai Input Event
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // Mengirimkan event ke BLoC melalui eventSink
          _bloc.eventSink.add(null);
        },
        child: const Icon(Icons.refresh),
      ),
    );
  }
}
