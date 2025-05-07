// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class GetAddressRequest {
  String cep;

  GetAddressRequest({
    required this.cep,
  });


  GetAddressRequest copyWith({
    String? cep,
  }) {
    return GetAddressRequest(
      cep: cep ?? this.cep,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'cep': cep,
    };
  }

  factory GetAddressRequest.fromMap(Map<String, dynamic> map) {
    return GetAddressRequest(
      cep: map['cep'],
    );
  }

  factory GetAddressRequest.mocked({
    String? cep,
  }) {
    return GetAddressRequest(
      cep: cep ?? '12345678',
    );
  }

  String toJson() => json.encode(toMap());

  factory GetAddressRequest.fromJson(String source) => GetAddressRequest.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() => 'GetAddressRequest(cep: $cep)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is GetAddressRequest &&
        other.cep == cep;
  }

  @override
  int get hashCode => cep.hashCode;
}
