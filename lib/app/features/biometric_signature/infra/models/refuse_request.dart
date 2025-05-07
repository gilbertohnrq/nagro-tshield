// ignore_for_file: public_member_api_docs, sort_constructors_first, hash_and_equals
import 'dart:convert';

class RefuseRequest {
  List<String> reasons;
  RefuseRequest({
    required this.reasons,
  });

  factory RefuseRequest.mocked({
    List<String>? reasons,
  }) {
    return RefuseRequest(
      reasons: reasons ?? ['Outros'],
    );
  }

  RefuseRequest copyWith({
    List<String>? reasons,
  }) {
    return RefuseRequest(
      reasons: reasons ?? this.reasons,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'reasons': reasons,
    };
  }

  factory RefuseRequest.fromMap(Map<String, dynamic> map) {
    return RefuseRequest(reasons: List<String>.from(map['reasons'] as List));
  }

  String toJson() => json.encode(toMap());

  factory RefuseRequest.fromJson(String source) =>
      RefuseRequest.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() => 'RefuseRequest(reasons: $reasons)';

  @override
  int get hashCode => reasons.hashCode;
}
