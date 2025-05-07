// ignore_for_file: public_member_api_docs, sort_constructors_first
// ignore_for_file: non_constant_identifier_names
import 'dart:convert';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:finan/app/core/utils/formats/extension_type.dart';
import 'package:http_parser/http_parser.dart';

class SignContractRequest {
  File? selfie;
  File? encrypted;
  String? doc_qrcode;
  String ip;
  String device_code;
  String lat;
  String lng;
  bool isBinary;

  SignContractRequest({
    this.selfie,
    this.encrypted,
    this.doc_qrcode,
    this.isBinary = false,
    required this.ip,
    required this.device_code,
    required this.lat,
    required this.lng,
  });

  SignContractRequest copyWith({
    File? selfie,
    File? encrypted,
    String? doc_qrcode,
    String? ip,
    String? device_code,
    String? lat,
    String? lng,
    bool? isBinary,
  }) {
    return SignContractRequest(
        selfie: selfie ?? this.selfie,
        encrypted: encrypted ?? this.encrypted,
        doc_qrcode: doc_qrcode ?? this.doc_qrcode,
        ip: ip ?? this.ip,
        device_code: device_code ?? this.device_code,
        lat: lat ?? this.lat,
        lng: lng ?? this.lng,
        isBinary: isBinary ?? this.isBinary);
  }

  factory SignContractRequest.mocked({
    File? selfie,
    File? encrypted,
    String? doc_qrcode,
    String? ip,
    String? device_code,
    String? lat,
    String? lng,
  }) {
    return SignContractRequest(
      selfie: selfie ?? File('selfie'),
      encrypted: encrypted ?? File('encrypted'),
      doc_qrcode: doc_qrcode,
      ip: ip ?? 'ip',
      device_code: device_code ?? 'device_code',
      lat: lat ?? 'lat',
      lng: lng ?? 'lng',
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'selfie': selfie?.path,
      'encrypted': encrypted?.path,
      'doc_qrcode': doc_qrcode,
      'ip': ip,
      'device_code': device_code,
      'lat': lat,
      'lng': lng
    };
  }

  factory SignContractRequest.fromMap(Map<String, dynamic> map) {
    return SignContractRequest(
      selfie: map['selfie'] != null ? File(map['selfie']) : null,
      encrypted: map['encrypted'] != null ? File(map['encrypted']) : null,
      doc_qrcode: map['doc_qrcode'] as String?,
      ip: map['ip'] as String,
      device_code: map['device_code'] as String,
      lat: map['lat'] as String,
      lng: map['lng'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory SignContractRequest.fromJson(String source) =>
      SignContractRequest.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'SignContractRequest(selfie: $selfie, encrypted: $encrypted, doc_qrcode: $doc_qrcode, ip: $ip, device_code: $device_code, lat: $lat, lng: $lng)';
  }

  @override
  bool operator ==(covariant SignContractRequest other) {
    if (identical(this, other)) return true;

    return other.selfie == selfie &&
        other.encrypted == encrypted &&
        other.doc_qrcode == doc_qrcode &&
        other.ip == ip &&
        other.device_code == device_code &&
        other.lat == lat &&
        other.lng == lng;
  }

  @override
  int get hashCode {
    return selfie.hashCode ^
        encrypted.hashCode ^
        doc_qrcode.hashCode ^
        ip.hashCode ^
        device_code.hashCode ^
        lat.hashCode ^
        lng.hashCode;
  }

  Future<FormData> toFormData() async {
    final formData = FormData();

    formData.fields.add(MapEntry('device_code', device_code));
    formData.fields.add(MapEntry('lat', lat));
    formData.fields.add(MapEntry('lng', lng));
    formData.fields.add(MapEntry('ip', ip));
    formData.fields.add(
        MapEntry('isBinary', (await checkFileIsBinary(doc_qrcode)).toString()));
    if (selfie != null) {
      formData.files.add(MapEntry(
        'selfie',
        await MultipartFile.fromFile(selfie!.path, filename: 'selfie.txt'),
      ));
    }
    if (encrypted != null) {
      formData.files.add(MapEntry(
        'encrypted',
        await MultipartFile.fromFile(encrypted!.path,
            filename: 'encrypted.txt'),
      ));
    }

    if (doc_qrcode != null) {
      formData.files.add(MapEntry(
          'doc_qrcode',
          await MultipartFile.fromFile(doc_qrcode!,
              contentType: MediaType('application', 'pdf'))));
    }

    return formData;
  }
}
