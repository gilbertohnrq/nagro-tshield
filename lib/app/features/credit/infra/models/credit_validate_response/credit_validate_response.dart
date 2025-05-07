// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class CreditValidateResponse {
  bool isAvailableCredit;
  String message;

  CreditValidateResponse(
      {required this.isAvailableCredit, required this.message});

  CreditValidateResponse copyWith({
    bool? isAvailableCredit,
    String? message,
  }) {
    return CreditValidateResponse(
      isAvailableCredit: isAvailableCredit ?? this.isAvailableCredit,
      message: message ?? this.message,
    );
  }

  factory CreditValidateResponse.mocked({
    bool? isAvailableCredit,
    String? message,
  }) {
    return CreditValidateResponse(
      isAvailableCredit: isAvailableCredit ?? true,
      message: message ?? 'sucesso',
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'isAvailableCredit': isAvailableCredit,
      'message': message,
    };
  }

  factory CreditValidateResponse.fromMap(Map<String, dynamic> map) {
    return CreditValidateResponse(
      isAvailableCredit: map['isAvailableCredit'] as bool,
      message: map['message'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory CreditValidateResponse.fromJson(String source) =>
      CreditValidateResponse.fromMap(
          json.decode(source) as Map<String, dynamic>);

  @override
  String toString() =>
      'CreditValidateResponse(isAvailableCredit: $isAvailableCredit, message: $message)';

  @override
  bool operator ==(covariant CreditValidateResponse other) {
    if (identical(this, other)) return true;

    return other.isAvailableCredit == isAvailableCredit &&
        other.message == message;
  }

  @override
  int get hashCode => isAvailableCredit.hashCode ^ message.hashCode;
}
