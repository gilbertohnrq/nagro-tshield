// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class ToSimulate {
  final String firstDueDate;
  final int numberOfInstallments;
  final double amount;

  ToSimulate(
      {required this.firstDueDate,
      required this.numberOfInstallments,
      required this.amount});

  ToSimulate copyWith(
      {String? firstDueDate, int? numberOfInstallments, double? amount}) {
    return ToSimulate(
        firstDueDate: firstDueDate ?? this.firstDueDate,
        numberOfInstallments: numberOfInstallments ?? this.numberOfInstallments,
        amount: amount ?? this.amount);
  }

  factory ToSimulate.mocked(
      {String? firstDueDate, int? numberOfInstallments, double? amount}) {
    return ToSimulate(
        firstDueDate: firstDueDate ?? DateTime.now().toString(),
        numberOfInstallments: numberOfInstallments ?? 24,
        amount: amount ?? 3000.0);
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'firstDueDate': firstDueDate, // Alterado para String
      'numberOfInstallments': numberOfInstallments,
      'amount': amount
    };
  }

  factory ToSimulate.fromMap(Map<String, dynamic> map) {
    return ToSimulate(
      amount: map['amount'] as double,
      firstDueDate: map['firstDueDate'] as String, // Alterado para String
      numberOfInstallments: map['numberOfInstallments'] as int,
    );
  }

  String toJson() => json.encode(toMap());

  factory ToSimulate.fromJson(String source) =>
      ToSimulate.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() =>
      'Tosimulate(firstDueDate: $firstDueDate, numberOfInstallments: $numberOfInstallments)';

  @override
  bool operator ==(covariant ToSimulate other) {
    if (identical(this, other)) return true;

    return other.firstDueDate == firstDueDate &&
        other.numberOfInstallments == numberOfInstallments;
  }

  @override
  int get hashCode => firstDueDate.hashCode ^ numberOfInstallments.hashCode;
}
