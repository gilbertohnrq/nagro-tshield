import 'dart:core';

class NagroPerformance {
  final Stopwatch _stopwatch;

  // Construtor
  NagroPerformance() : _stopwatch = Stopwatch();

  // Inicia o cronômetro
  void start() {
    _stopwatch.start();
  }

  // Para o cronômetro
  void stop() {
    _stopwatch.stop();
  }

  // Reseta o cronômetro
  void reset() {
    _stopwatch.reset();
  }

  Duration get elapsed => _stopwatch.elapsed;

  // Retorna o tempo decorrido em milissegundos
  int get elapsedMilliseconds => _stopwatch.elapsedMilliseconds;

  // Retorna o tempo decorrido em segundos
  double get elapsedSeconds => _stopwatch.elapsed.inSeconds.toDouble();

  // Retorna o tempo decorrido em formato legível
  String get elapsedTimeFormatted {
    final elapsed = _stopwatch.elapsed;
    final hours = elapsed.inHours;
    final minutes = elapsed.inMinutes % 60;
    final seconds = elapsed.inSeconds % 60;
    final milliseconds = (elapsed.inMilliseconds % 1000) ~/ 10;
    return '$hours:$minutes:$seconds.$milliseconds';
  }
}
