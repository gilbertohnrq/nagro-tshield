// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class CreditResponse {
  bool? isAvailableCredit;
  String? message;
  int? term;

  CreditResponse(
      {required this.isAvailableCredit,
      required this.message,
      required this.term});

  CreditResponse copyWith({
    bool? isAvailableCredit,
    String? message,
    int? term,
  }) {
    return CreditResponse(
      isAvailableCredit: isAvailableCredit ?? this.isAvailableCredit,
      message: message ?? this.message,
      term: term ?? this.term,
    );
  }

  factory CreditResponse.mocked({
    bool? isAvailableCredit,
    String? message,
    int? term,
  }) {
    return CreditResponse(
      isAvailableCredit: isAvailableCredit ?? true,
      message: message ?? '',
      term: term ?? 1,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'isAvailableCredit': isAvailableCredit,
      'message': message,
      'term': term,
    };
  }

  factory CreditResponse.fromMap(Map<String, dynamic> map) {
    return CreditResponse(
      isAvailableCredit: map['isAvailableCredit'] != null
          ? map['isAvailableCredit'] as bool
          : null,
      message: map['message'] != null ? map['message'] as String : null,
      term: map['term'] != null ? map['term'] as int : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory CreditResponse.fromJson(String source) =>
      CreditResponse.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() =>
      'CreditResponse(isAvailableCredit: $isAvailableCredit, message: $message, term: $term)';

  @override
  bool operator ==(covariant CreditResponse other) {
    if (identical(this, other)) return true;

    return other.isAvailableCredit == isAvailableCredit &&
        other.message == message &&
        other.term == term;
  }

  @override
  int get hashCode =>
      isAvailableCredit.hashCode ^ message.hashCode ^ term.hashCode;
}
