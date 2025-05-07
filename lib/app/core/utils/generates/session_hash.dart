// coverage:ignore-file

import 'dart:convert';
import 'package:crypto/crypto.dart';
import 'package:uuid/uuid.dart';

String generateSessionHash() {
  final uuid = const Uuid().v4();

  final bytes = utf8.encode(uuid);

  final digest = sha256.convert(bytes);

  return digest.toString();
}
