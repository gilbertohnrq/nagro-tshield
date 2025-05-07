import 'dart:convert';
import 'dart:io';

import 'package:path_provider/path_provider.dart';

Future<File> convertStringToFile(String text, {String? fileName}) async {
  final directory = await getApplicationDocumentsDirectory();
  final file = File('${directory.path}/${fileName ?? 'my_text_file.txt'}');
  return file.writeAsString(text);
}

Future<File> convertBase64ToJpgFile(String base64String,
    {String? fileName}) async {
  final directory = await getApplicationDocumentsDirectory();
  final file = File('${directory.path}/${fileName ?? 'image.jpg'}');
  final bytes = base64Decode(base64String);
  return await file.writeAsBytes(bytes);
}
