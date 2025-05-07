// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class FromSimulate {
  final String grossAmount;
  final String installmentAmount;
  final int installments;
  final String iofAmount;
  final String monthlyCet;
  final String monthlyInterestRate;
  String? cadAmount;

  FromSimulate(
      {this.grossAmount = '',
      this.installmentAmount = '',
      this.installments = 0,
      this.iofAmount = '',
      this.monthlyCet = '',
      this.monthlyInterestRate = '',
      this.cadAmount = ''});

  FromSimulate copyWith(
      {String? grossAmount,
      String? installmentAmount,
      int? installments,
      String? iofAmount,
      String? monthlyCet,
      String? monthlyInterestRate,
      String? cadAmount}) {
    return FromSimulate(
        grossAmount: grossAmount ?? this.grossAmount,
        installmentAmount: installmentAmount ?? this.installmentAmount,
        installments: installments ?? this.installments,
        iofAmount: iofAmount ?? this.iofAmount,
        monthlyCet: monthlyCet ?? this.monthlyCet,
        monthlyInterestRate: monthlyInterestRate ?? this.monthlyInterestRate,
        cadAmount: cadAmount ?? this.cadAmount);
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'grossAmount': grossAmount,
      'installmentAmount': installmentAmount,
      'installments': installments,
      'iofAmount': iofAmount,
      'monthlyCet': monthlyCet,
      'monthlyInterestRate': monthlyInterestRate,
      'cadAmount': cadAmount
    };
  }

  factory FromSimulate.fromMap(Map<String, dynamic> map) {
    return FromSimulate(
        grossAmount: map['grossAmount'] as String,
        installmentAmount: map['installmentAmount'] as String,
        installments: map['installments'] as int,
        iofAmount: map['iofAmount'] as String,
        monthlyCet: map['monthlyCet'] as String,
        monthlyInterestRate: map['monthlyInterestRate'] as String,
        cadAmount: map['cadAmount'] ?? 'R\$ 300,00');
  }

  factory FromSimulate.mocked(
      {String? grossAmount,
      String? installmentAmount,
      int? installments,
      String? iofAmount,
      String? monthlyCet,
      String? monthlyInterestRate,
      String? cadAmount}) {
    return FromSimulate(
        grossAmount: grossAmount ?? '1000.00',
        installmentAmount: installmentAmount ?? '100.00',
        installments: installments ?? 10,
        iofAmount: iofAmount ?? '10.00',
        monthlyCet: monthlyCet ?? '1.5%',
        monthlyInterestRate: monthlyInterestRate ?? '0.5%',
        cadAmount: cadAmount ?? '300.00');
  }

  String toJson() => json.encode(toMap());

  factory FromSimulate.fromJson(String source) =>
      FromSimulate.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'FromSimulate(grossAmount: $grossAmount, installmentAmount: $installmentAmount, installments: $installments, iofAmount: $iofAmount, monthlyCet: $monthlyCet, monthlyInterestRate: $monthlyInterestRate, cadAmount: $cadAmount)';
  }

  @override
  bool operator ==(covariant FromSimulate other) {
    if (identical(this, other)) return true;

    return other.grossAmount == grossAmount &&
        other.installmentAmount == installmentAmount &&
        other.installments == installments &&
        other.iofAmount == iofAmount &&
        other.monthlyCet == monthlyCet &&
        other.monthlyInterestRate == monthlyInterestRate &&
        other.cadAmount == cadAmount;
  }

  @override
  int get hashCode {
    return grossAmount.hashCode ^
        installmentAmount.hashCode ^
        installments.hashCode ^
        iofAmount.hashCode ^
        monthlyCet.hashCode ^
        monthlyInterestRate.hashCode;
  }
}
