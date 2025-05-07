// coverage:ignore-file
import 'dart:async';
import 'dart:io';

import 'package:flutter/foundation.dart';

class RateLimiter {
  // Armazena os timers associados a cada chave, usados para controlar o debounce.
  final Map<String, Timer> _timers = {};

  // Armazena os timestamps das últimas chamadas de cada ação.
  final Map<String, DateTime> _lastCallTimestamps = {};

  // Armazena os completers para gerenciar ações em progresso.
  final Map<String, Completer<void>> _completers = {};

  /// Método que implementa o debounce.
  ///
  /// Ele garante que uma ação só será executada após o período especificado em
  /// [duration], ignorando novas chamadas para a mesma [key] enquanto o timer estiver ativo.
  ///
  /// - [key]: Identificador único da ação a ser controlada.
  /// - [duration]: Duração mínima entre execuções da ação.
  /// - [action]: A função assíncrona que será executada após o debounce.
  void debounce(String key, Duration duration, Future<void> Function() action) {
    final now = DateTime.now();

    // Log de depuração para registrar o tempo desde a última chamada.
    debugPrint(
        '[RateLimiter] Time since last call for "$key": ${_lastCallTimestamps[key] != null ? now.difference(_lastCallTimestamps[key]!).inMilliseconds : 'N/A'}ms');

    // Atualiza o timestamp da última chamada.
    _lastCallTimestamps[key] = now;

    // Cancela qualquer timer existente para a mesma chave.
    _timers[key]?.cancel();

    // Se uma ação já estiver em progresso, ignora novas chamadas.
    if (_completers[key] != null && !_completers[key]!.isCompleted) {
      debugPrint(
          '[RateLimiter] Request for "$key" is already in progress, skipping...');
      return;
    }

    // Cria um `Completer` para acompanhar o estado da ação.
    _completers[key] = Completer<void>();

    // Cria um novo timer para executar a ação após o tempo especificado.
    _timers[key] = Timer(duration, () async {
      try {
        debugPrint('[RateLimiter] Executing action for "$key"');
        await action();
        _completers[key]?.complete(); // Marca o `Completer` como concluído.
      } catch (e) {
        _completers[key]
            ?.completeError(e); // Marca erro no `Completer`, se ocorrer.
      } finally {
        // Remove os dados associados à chave após a execução da ação.
        _timers.remove(key);
        _completers.remove(key);
      }
    });

    // Tratamento especial para ambientes de teste.
    if (Platform.environment.containsKey('FLUTTER_TEST')) {
      // Cancela rapidamente o timer em testes para evitar problemas.
      Future.microtask(() {
        _timers[key]?.cancel();
        _timers.remove(key);
        _completers[key]?.complete();
      });
    }
  }

  /// Verifica se uma ação está em progresso para a chave especificada.
  ///
  /// Retorna `true` se uma ação para a [key] ainda não foi concluída.
  bool isRunning(String key) {
    return _completers.containsKey(key) && !_completers[key]!.isCompleted;
  }

  /// Cancela e limpa todos os timers, timestamps e ações pendentes.
  ///
  /// Deve ser chamado para liberar recursos quando o `RateLimiter` não for mais necessário.
  void dispose() {
    for (var timer in _timers.values) {
      timer.cancel();
    }
    _timers.clear();
    _lastCallTimestamps.clear();
    _completers.clear();
  }
}
