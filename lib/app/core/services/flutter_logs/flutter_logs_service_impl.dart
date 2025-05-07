// coverage:ignore-file
import 'dart:async';
import 'dart:developer';
import 'dart:io';

import 'package:finan/app/core/services/flutter_logs/flutter_logs_service.dart';
import 'package:flutter_logs/flutter_logs.dart';
import 'package:path_provider/path_provider.dart';

class FlutterLogsServiceImpl extends IFlutterLogsService {
  @override
  Future<void> init() async {
    await FlutterLogs.initLogs(
        logLevelsEnabled: [
          LogLevel.INFO,
          LogLevel.WARNING,
          LogLevel.ERROR,
          LogLevel.SEVERE
        ],
        timeStampFormat: TimeStampFormat.TIME_FORMAT_READABLE,
        directoryStructure: DirectoryStructure.FOR_DATE,
        logTypesEnabled: ["device", "network", "errors"],
        logFileExtension: LogFileExtension.TXT,
        logsWriteDirectoryName: "MyLogs",
        logsExportDirectoryName: "Exported",
        debugFileOperations: true,
        isDebuggable: true);

    await FlutterLogs.clearLogs();
  }

  @override
  Future<void> registerLog(
      String tag, String subTag, String message, LogLevel level) async {
    await FlutterLogs.logThis(
        tag: tag, subTag: subTag, logMessage: message, level: level);
  }

  Future<String?> export() async {
    final Completer<String?> completer = Completer();

    FlutterLogs.channel.setMethodCallHandler((call) async {
      if (call.method == 'logsExported') {
        final zipName = call.arguments.toString();

        final Directory? externalDirectory = Platform.isIOS
            ? await getApplicationDocumentsDirectory()
            : await getExternalStorageDirectory();

        if (externalDirectory != null) {
          final File file = File("${externalDirectory.path}/$zipName");

          if (file.existsSync()) {
            completer.complete(file.path);
          } else {
            completer.completeError(
                "Arquivo de log não encontrado no armazenamento.");
          }
        } else {
          completer.completeError("Falha ao obter o diretório externo.");
        }
      }
    });

    FlutterLogs.exportLogs(exportType: ExportType.ALL).then((value) {
      log('Finished exporting FlutterLogs...');
    });
    return completer.future;
  }
}
