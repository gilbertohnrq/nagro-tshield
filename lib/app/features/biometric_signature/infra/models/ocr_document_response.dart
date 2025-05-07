import 'dart:convert';

class OcrDocumentResponse {
  final String? ssp;
  final String? cnh;
  final String? rg;
  final String? uf;
  final String? motherName;

  const OcrDocumentResponse({
    this.ssp,
    this.cnh,
    this.rg,
    this.uf,
    this.motherName,
  });

  OcrDocumentResponse copyWith({
    String? ssp,
    String? cnh,
    String? rg,
    String? uf,
    String? motherName,
  }) {
    return OcrDocumentResponse(
      ssp: ssp ?? this.ssp,
      cnh: cnh ?? this.cnh,
      rg: rg ?? this.rg,
      uf: uf ?? this.uf,
      motherName: motherName ?? this.motherName,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'ssp': ssp,
      'cnh': cnh,
      'rg': rg,
      'uf': uf,
      'mothers_name': motherName,
    };
  }

  factory OcrDocumentResponse.fromMap(Map<String, dynamic> map) {
    return OcrDocumentResponse(
      ssp: map['ssp'] as String?,
      cnh: map['cnh'] as String?,
      rg: map['rg'] as String?,
      uf: map['uf'] as String?,
      motherName: map['motherName'] as String?,
    );
  }

  String toJson() => json.encode(toMap());

  factory OcrDocumentResponse.fromJson(String source) =>
      OcrDocumentResponse.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'OcrDocumentResponse(ssp: $ssp, cnh: $cnh, rg: $rg, uf: $uf, motherName: $motherName)';
  }

  @override
  bool operator ==(covariant OcrDocumentResponse other) {
    if (identical(this, other)) return true;

    return other.ssp == ssp &&
        other.cnh == cnh &&
        other.rg == rg &&
        other.uf == uf &&
        other.motherName == motherName;
  }

  @override
  int get hashCode {
    return ssp.hashCode ^
        cnh.hashCode ^
        rg.hashCode ^
        uf.hashCode ^
        motherName.hashCode;
  }

  static OcrDocumentResponse mocked() {
    return const OcrDocumentResponse(
      ssp: '1234567890',
      cnh: '1234567890',
      rg: '1234567890',
    );
  }
}
