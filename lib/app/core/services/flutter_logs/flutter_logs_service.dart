// coverage:ignore-file
import 'package:flutter_logs/flutter_logs.dart';

abstract class IFlutterLogsService {
  Future<void> init();
  Future<void> registerLog(
      String tag, String subTag, String message, LogLevel level);
}
