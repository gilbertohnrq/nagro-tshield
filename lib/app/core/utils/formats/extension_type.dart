// coverage:ignore-file
import 'dart:io';
import 'dart:typed_data';

// ignore: depend_on_referenced_packages
import 'package:path/path.dart' as path;

Future<bool> checkFileIsBinary(String? filePath) async {
  if (filePath == null) {
    return false;
  }

  final String extension = path.extension(filePath).toLowerCase();
  if (extension == '.pdf') {
    return false;
  }

  final file = File(filePath);
  if (await file.exists()) {
    final Uint8List bytes = await file.readAsBytes();
    if (bytes.length >= 4 &&
        bytes[0] == 0x25 &&
        bytes[1] == 0x50 &&
        bytes[2] == 0x44 &&
        bytes[3] == 0x46) {
      return false;
    } else {
      return true;
    }
  } else {
    return false;
  }
}
