// ignore_for_file: public_member_api_docs, sort_constructors_first
// ignore_for_file: non_constant_identifier_names

import 'dart:convert';
import 'dart:io';

import 'package:dio/dio.dart';

enum OcrDocumentRequestType {
  RG,
  CNH,
}

class OcrDocumentRequest {
  final File? docFront;
  final File? docBack;
  final File? docQRCode;

  OcrDocumentRequest({
    this.docFront,
    this.docBack,
    this.docQRCode,
  }) : assert(
          (docFront?.existsSync() == true) ||
              (docBack?.existsSync() == true) ||
              (docQRCode?.existsSync() == true),
          'Pelo menos um dos campos docFront, docBack ou docQRCode deve ser informado.',
        );

  OcrDocumentRequest copyWith({
    OcrDocumentRequestType? type,
    File? docFront,
    File? docBack,
    File? docQRCode,
  }) {
    return OcrDocumentRequest(
      // type: type ?? this.type,
      docFront: docFront ?? this.docFront,
      docBack: docBack ?? this.docBack,
      docQRCode: docQRCode ?? this.docQRCode,
    );
  }

  factory OcrDocumentRequest.mocked({
    OcrDocumentRequestType? type,
    File? docFront,
    File? docBack,
    File? docQRCode,
  }) {
    return OcrDocumentRequest(
      docFront: docFront,
      docBack: docBack,
      docQRCode: docQRCode,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'docFront': docFront?.path,
      'docBack': docBack?.path,
      'docQRCode': docQRCode?.path,
    };
  }

  String toJson() => json.encode(toMap());

  @override
  String toString() {
    return 'OcrDocumentRequest( docFront: $docFront, docBack: $docBack, docQRCode: $docQRCode)';
  }

  @override
  bool operator ==(covariant OcrDocumentRequest other) {
    if (identical(this, other)) return true;
    return other.docFront == docFront &&
        other.docFront == docFront &&
        other.docBack == docBack &&
        other.docQRCode == docQRCode;
  }

  @override
  int get hashCode {
    return (docFront?.hashCode ?? 0) ^
        (docBack?.hashCode ?? 0) ^
        (docQRCode?.hashCode ?? 0);
  }

  Future<FormData> toFormData() async {
    final formData = FormData();
    if (docFront != null && await docFront!.exists()) {
      formData.files.add(MapEntry(
        'docFront',
        await MultipartFile.fromFile(docFront!.path, filename: 'docFront.txt'),
      ));
    }
    if (docBack != null && await docBack!.exists()) {
      formData.files.add(MapEntry(
        'docBack',
        await MultipartFile.fromFile(docBack!.path, filename: 'docBack.txt'),
      ));
    }
    if (docQRCode != null && await docQRCode!.exists()) {
      formData.files.add(MapEntry(
        'docQRCode',
        await MultipartFile.fromFile(
          docQRCode!.path,
        ),
      ));
    }
    return formData;
  }
}
