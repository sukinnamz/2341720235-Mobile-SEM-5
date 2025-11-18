import 'dart:async';
import 'dart:math';

// Class yang mengandung Business Logic Component (BLoC)
class RandomNumberBloc {
  // 4. Buat StreamController untuk Output data (State)
  // StreamController.broadcast() diperlukan karena BLoC mungkin didengarkan oleh banyak widget.
  final _randomStreamController = StreamController<int>.broadcast();

  // Getter untuk Stream (Output state)
  Stream<int> get randomStream => _randomStreamController.stream;

  // 4. Buat StreamController untuk Input event (Perintah)
  final _eventController = StreamController<void>();

  // Getter untuk Sink (Input event)
  StreamSink<void> get eventSink => _eventController.sink;

  // Variabel untuk menyimpan angka acak saat ini
  int _currentNumber = 0;

  // 5. Buat constructor
  RandomNumberBloc() {
    // Mendengarkan Event yang masuk ke Sink
    _eventController.stream.listen((_) {
      _generateRandomNumber();
    });
  }

  // Logika Bisnis: Menghasilkan angka acak dan mengirimkannya ke state stream
  void _generateRandomNumber() {
    final random = Random();
    // Menghasilkan angka acak antara 0 hingga 9 (sesuai contoh praktikum 2)
    _currentNumber = random.nextInt(10);

    // Mengirimkan angka baru ke Output Stream (State)
    _randomStreamController.sink.add(_currentNumber);
  }

  // 6. Buat method dispose() untuk menutup semua controller
  void dispose() {
    _randomStreamController.close();
    _eventController.close();
  }
}
