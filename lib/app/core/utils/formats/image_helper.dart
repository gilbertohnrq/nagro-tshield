// coverage:ignore-file
// ignore_for_file: depend_on_referenced_packages

import 'dart:io';
import 'dart:typed_data';

import 'package:image/image.dart' as img;

mixin ImageHelper {
  /// Flips and overrides provided image.
  static String flipImage(String path) {
    // Read the image from file.
    final inputImageFile = File(path);
    final bytes = inputImageFile.readAsBytesSync();
    var image = img.decodeImage(Uint8List.fromList(bytes))!;

    // Flip the image.
    image = img.flip(image, direction: img.FlipDirection.horizontal);

    // Save the flipped image.
    File(path).writeAsBytesSync(Uint8List.fromList(img.encodeJpg(image)));
    return path;
  }
}
