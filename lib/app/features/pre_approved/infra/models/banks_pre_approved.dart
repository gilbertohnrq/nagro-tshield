// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class BanksPreApprovedModel {
  final String code;
  final String label;

  BanksPreApprovedModel({
    required this.code,
    required this.label,
  });

  BanksPreApprovedModel copyWith({
    String? code,
    String? label,
  }) {
    return BanksPreApprovedModel(
      code: code ?? this.code,
      label: label ?? this.label,
    );
  }
 factory BanksPreApprovedModel.mocked({
    String? code,
    String? label,
  }) {
    return BanksPreApprovedModel(
      code: code ?? '323',
      label: label ?? 'MERCADO PAGO - CONTA DO MERCADO LIVRE',
    );
  }



  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'code': code,
      'label': label,
    };
  }

  factory BanksPreApprovedModel.fromMap(Map<String, dynamic> map) {
    return BanksPreApprovedModel(
      code: map['code'] as String,
      label: map['label'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory BanksPreApprovedModel.fromJson(String source) =>
      BanksPreApprovedModel.fromMap(
          json.decode(source) as Map<String, dynamic>);

  @override
  String toString() => 'BanksPreApprovedModel(code: $code, label: $label)';

  @override
  bool operator ==(covariant BanksPreApprovedModel other) {
    if (identical(this, other)) return true;

    return other.code == code && other.label == label;
  }

  @override
  int get hashCode => code.hashCode ^ label.hashCode;

  static List<BanksPreApprovedModel> listMocked() {
    return [
      BanksPreApprovedModel.mocked(),
      BanksPreApprovedModel.mocked(),
      BanksPreApprovedModel.mocked(),
    ];
  }
}
