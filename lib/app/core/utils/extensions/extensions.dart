// coverage:ignore-file
import 'dart:io';

import 'package:device_info_plus/device_info_plus.dart';
import 'package:finan/app/core/theme/size_config.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:url_launcher/url_launcher.dart';

extension HexColor on Color {
  /// String is in the format "aabbcc" or "ffaabbcc" with an optional leading "#".
  static Color fromHex(String hexString) {
    final buffer = StringBuffer();
    if (hexString.length == 6 || hexString.length == 7) buffer.write('ff');
    buffer.write(hexString.replaceFirst('#', ''));
    return Color(int.parse(buffer.toString(), radix: 16));
  }

  String toHex() {
    // Remove alpha channel and format as #RRGGBB
    return '#${value.toRadixString(16).padLeft(8, '0').substring(2).toUpperCase()}';
  }

  // Getter alternative
  String get hex =>
      '#${value.toRadixString(16).padLeft(8, '0').substring(2).toUpperCase()}';
}

extension StringExtension on String {
  String formatCurrency() {
    final formatter = NumberFormat.currency(locale: "pt_BR", symbol: "R\$ ");
    final number = double.parse(replaceAll("R\$ ", "").replaceAll(",", "."));
    return formatter.format(number);
  }

  String capitalizeFirst() {
    return "${this[0].toUpperCase()}${substring(1)}";
  }
}

String removeAccent(String texto) {
  const String comAcentos = 'áàâãäéèêëíìîïóòôõöúùûüçÁÀÂÃÄÉÈÊËÍÌÎÏÓÒÔÕÖÚÙÛÜÇ';
  const String semAcentos = 'aaaaaeeeeiiiiooooouuuucAAAAAEEEEIIIIOOOOOUUUUC';

  return texto.split('').map((char) {
    final index = comAcentos.indexOf(char);
    return index != -1 ? semAcentos[index] : char;
  }).join('');
}

extension ProportionalNum on num {
  double get w => toDouble() * SizeConfig.scaleWidth;
  double get h => toDouble() * SizeConfig.scaleHeight;
  double get sp {
    final scaleText = SizeConfig.scaleWidth < SizeConfig.scaleHeight
        ? SizeConfig.scaleWidth
        : SizeConfig.scaleHeight;
    return toDouble() * scaleText;
  }
}

extension StringMayBeNull on String? {
  bool get isNullOrEmpty => this == null || this!.isEmpty;
  bool get isNotNullAndNotEmpty => this != null && this!.isNotEmpty;
}

String cleanValue(String value) {
  final regex = RegExp(r'R\$\s*([\d.]+,\d{2})');
  final match = regex.firstMatch(value);
  return match != null ? match.group(1) ?? '' : '';
}

int convertToCentsByInt(String value) {
  value = value.replaceAll('.', '').replaceAll(',', '.');
  return (double.parse(value) * 100).toInt();
}

double convertToCentsByDouble(String value) {
  value = value.replaceAll('.', '').replaceAll(',', '.');
  return double.parse(value);
}

String formatCurrency(double value) {
  // Formata o valor para o padrão monetário com duas casas decimais
  final String formattedValue = value.toStringAsFixed(2).replaceAll('.', ',');

  // Adiciona separador de milhar
  final List<String> parts = formattedValue.split(',');
  final String integerPart = parts[0];
  final String fractionalPart = parts.length > 1 ? ',${parts[1]}' : '';

  // Adiciona os pontos como separadores de milhar
  final StringBuffer sb = StringBuffer();
  for (int i = 0; i < integerPart.length; i++) {
    if (i > 0 && (integerPart.length - i) % 3 == 0) {
      sb.write('.');
    }
    sb.write(integerPart[i]);
  }

  return sb.toString() + fractionalPart;
}

double calculatePercentage(int value, double percentage) {
  return (value * percentage) / 100;
}

String applyNumberByString(String value, double percent) {
  final stringValue = cleanValue(value);
  final intValue = convertToCentsByInt(stringValue);
  final percentValue = calculatePercentage(intValue, percent);
  final finalValue = formatCurrency(percentValue);
  return finalValue.toString();
}

String applyMInNumberByString(String value, double percent) {
  final stringValue = cleanValue(value);
  final intValue = convertToCentsByInt(stringValue);
  double percentValue = calculatePercentage(intValue, percent);
  if (percentValue < 1600) {
    percentValue = 1600;
  }
  final finalValue = formatCurrency(percentValue);
  return finalValue.toString();
}

double applyNumberByDouble(String value) {
  final stringValue = cleanValue(value);
  final doubleValue = convertToCentsByDouble(stringValue);

  return doubleValue;
}

Future<bool> verifyAndroidVersion() async {
  final DeviceInfoPlugin deviceInfoPlugin = DeviceInfoPlugin();
  if (Platform.isAndroid) {
    final androidInfo = await deviceInfoPlugin.androidInfo;

    return androidInfo.version.release == '10';
  }
  return false;
}

Future<void> launchVideo(String videoUrl) async {
  final Uri url = Uri.parse(videoUrl);
  if (!await launchUrl(
    url,
    mode: LaunchMode.externalApplication,
  )) {
    throw Exception('Could not launch $videoUrl');
  }
}
