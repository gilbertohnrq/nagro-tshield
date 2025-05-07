import 'dart:convert';

class RefuseResponse {
  String message;
  RefuseResponse({required this.message});

  RefuseResponse copyWith({
    String? message,
  }) {
    return RefuseResponse(
      message: message ?? this.message,
    );
  }

  factory RefuseResponse.mocked({
    String? message,
  }) {
    return RefuseResponse(
      message: message ?? 'Sucesso',
    );
  }

  Map<String, dynamic> toMap() {
    final result = <String, dynamic>{};

    result.addAll({'message': message});

    return result;
  }

  factory RefuseResponse.fromMap(Map<String, dynamic> map) {
    return RefuseResponse(
      message: map['message'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory RefuseResponse.fromJson(String source) =>
      RefuseResponse.fromMap(json.decode(source));

  @override
  String toString() => 'RefuseResponse(message: $message)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is RefuseResponse && other.message == message;
  }

  @override
  int get hashCode => message.hashCode;
}
