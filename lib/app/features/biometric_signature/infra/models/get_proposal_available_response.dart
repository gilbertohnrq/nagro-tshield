// coverage:ignore-file
// ignore_for_file: non_constant_identifier_names

import 'dart:convert';

import 'package:flutter/foundation.dart';

class GetProposalAvailableResponse {
  int? number_of_installments;
  double? installment_amount;
  int? principal_grace_period;
  int? term_duration;
  double? finance_amount;
  double? gross_amount;
  double? approved_amount;
  double? installments_amount_total;
  double? iof_amount;
  double? monthly_interest_rate;
  double? annual_interest_rate;
  double? monthly_cet;
  double? annual_cet;
  double? cad_amount;
  String? first_due_date;
  String? conditions;
  String? disbursement_date;
  String? pdf_reference;
  String? expiration_date;
  List<InstallmentForecast>? installments_forecast;

  GetProposalAvailableResponse(
      this.number_of_installments,
      this.installment_amount,
      this.principal_grace_period,
      this.term_duration,
      this.finance_amount,
      this.gross_amount,
      this.installments_amount_total,
      this.iof_amount,
      this.monthly_interest_rate,
      this.annual_interest_rate,
      this.monthly_cet,
      this.annual_cet,
      this.first_due_date,
      this.conditions,
      this.disbursement_date,
      this.pdf_reference,
      this.installments_forecast,
      this.cad_amount,
      this.expiration_date,
      this.approved_amount);

  factory GetProposalAvailableResponse.mocked(
      {int? number_of_installments,
      double? installment_amount,
      int? principal_grace_period,
      int? term_duration,
      double? finance_amount,
      double? gross_amount,
      double? installments_amount_total,
      double? iof_amount,
      double? monthly_interest_rate,
      double? annual_interest_rate,
      double? monthly_cet,
      double? annual_cet,
      String? first_due_date,
      String? conditions,
      String? disbursement_date,
      String? pdf_reference,
      double? cad_amount,
      List<InstallmentForecast>? installments_forecast,
      String? expiration_date,
      double? approved_amount}) {
    return GetProposalAvailableResponse(
        number_of_installments ?? 12,
        installment_amount ?? 500.0,
        principal_grace_period ?? 1,
        term_duration ?? 12,
        finance_amount ?? 6000.0,
        gross_amount ?? 6200.0,
        installments_amount_total ?? 6000.0,
        iof_amount ?? 200.0,
        monthly_interest_rate ?? 1.5,
        annual_interest_rate ?? 18.0,
        monthly_cet ?? 1.6,
        annual_cet ?? 19.2,
        first_due_date ?? '2024-07-01',
        conditions ?? 'Standard terms and conditions',
        disbursement_date ?? '2024-06-01',
        pdf_reference ?? 'abc123',
        installments_forecast ??
            [
              InstallmentForecast.mocked(),
              InstallmentForecast.mocked(),
            ],
        cad_amount ?? 00.0,
        expiration_date ?? '2024-12-01',
        approved_amount ?? 6200.0);
  }

  GetProposalAvailableResponse copyWith(
      {int? number_of_installments,
      double? installment_amount,
      int? principal_grace_period,
      int? term_duration,
      double? finance_amount,
      double? gross_amount,
      double? installments_amount_total,
      double? iof_amount,
      double? monthly_interest_rate,
      double? annual_interest_rate,
      double? monthly_cet,
      double? annual_cet,
      String? first_due_date,
      String? conditions,
      String? disbursement_date,
      String? pdf_reference,
      double? cad_amount,
      List<InstallmentForecast>? installments_forecast,
      String? expiration_date,
      double? approved_amount}) {
    return GetProposalAvailableResponse(
        number_of_installments ?? this.number_of_installments,
        installment_amount ?? this.installment_amount,
        principal_grace_period ?? this.principal_grace_period,
        term_duration ?? this.term_duration,
        finance_amount ?? this.finance_amount,
        gross_amount ?? this.gross_amount,
        installments_amount_total ?? this.installments_amount_total,
        iof_amount ?? this.iof_amount,
        monthly_interest_rate ?? this.monthly_interest_rate,
        annual_interest_rate ?? this.annual_interest_rate,
        monthly_cet ?? this.monthly_cet,
        annual_cet ?? this.annual_cet,
        first_due_date ?? this.first_due_date,
        conditions ?? this.conditions,
        disbursement_date ?? this.disbursement_date,
        pdf_reference ?? this.pdf_reference,
        installments_forecast ?? this.installments_forecast,
        cad_amount ?? this.cad_amount,
        expiration_date ?? this.expiration_date,
        approved_amount ?? this.approved_amount);
  }

  Map<String, dynamic> toMap() {
    final result = <String, dynamic>{};

    if (number_of_installments != null) {
      result.addAll({'number_of_installments': number_of_installments});
    }
    if (installment_amount != null) {
      result.addAll({'installment_amount': installment_amount});
    }
    if (principal_grace_period != null) {
      result.addAll({'principal_grace_period': principal_grace_period});
    }
    if (term_duration != null) {
      result.addAll({'term_duration': term_duration});
    }
    if (finance_amount != null) {
      result.addAll({'finance_amount': finance_amount});
    }
    if (gross_amount != null) {
      result.addAll({'gross_amount': gross_amount});
    }
    if (installments_amount_total != null) {
      result.addAll({'installments_amount_total': installments_amount_total});
    }
    if (iof_amount != null) {
      result.addAll({'iof_amount': iof_amount});
    }
    if (monthly_interest_rate != null) {
      result.addAll({'monthly_interest_rate': monthly_interest_rate});
    }
    if (annual_interest_rate != null) {
      result.addAll({'annual_interest_rate': annual_interest_rate});
    }
    if (monthly_cet != null) {
      result.addAll({'monthly_cet': monthly_cet});
    }
    if (annual_cet != null) {
      result.addAll({'annual_cet': annual_cet});
    }
    if (first_due_date != null) {
      result.addAll({'first_due_date': first_due_date});
    }
    if (conditions != null) {
      result.addAll({'conditions': conditions});
    }
    if (disbursement_date != null) {
      result.addAll({'disbursement_date': disbursement_date});
    }
    if (pdf_reference != null) {
      result.addAll({'pdf_reference': pdf_reference});
    }
    if (installments_forecast != null) {
      result.addAll({
        'installments_forecast':
            installments_forecast!.map((x) => x.toMap()).toList()
      });
    }

    return result;
  }

  factory GetProposalAvailableResponse.fromMap(Map<String, dynamic> map) {
    return GetProposalAvailableResponse(
        map['number_of_installments']?.toInt(),
        map['installment_amount']?.toDouble(),
        map['principal_grace_period']?.toInt(),
        map['term_duration']?.toInt(),
        map['finance_amount']?.toDouble(),
        map['gross_amount']?.toDouble(),
        map['installments_amount_total']?.toDouble(),
        map['iof_amount']?.toDouble(),
        map['monthly_interest_rate']?.toDouble(),
        map['annual_interest_rate']?.toDouble(),
        map['monthly_cet']?.toDouble(),
        map['annual_cet']?.toDouble(),
        map['first_due_date'],
        map['conditions'],
        map['disbursement_date'],
        map['pdf_reference'],
        map['installments_forecast'] != null
            ? List<InstallmentForecast>.from(map['installments_forecast']
                ?.map((x) => InstallmentForecast.fromMap(x)))
            : null,
        map['cad_amount'] != null ? (map['cad_amount'] as num).toDouble() : 0.0,
        map['expiration_date'],
        map['approved_amount'] != null
            ? (map['approved_amount'] as num).toDouble()
            : 0.0);
  }

  String toJson() => json.encode(toMap());

  factory GetProposalAvailableResponse.fromJson(String source) =>
      GetProposalAvailableResponse.fromMap(json.decode(source));

  @override
  String toString() {
    return 'GetProposalAvailableResponse(number_of_installments: $number_of_installments, installment_amount: $installment_amount, principal_grace_period: $principal_grace_period, term_duration: $term_duration, finance_amount: $finance_amount, gross_amount: $gross_amount, installments_amount_total: $installments_amount_total, iof_amount: $iof_amount, monthly_interest_rate: $monthly_interest_rate, annual_interest_rate: $annual_interest_rate, monthly_cet: $monthly_cet, annual_cet: $annual_cet, first_due_date: $first_due_date, conditions: $conditions, disbursement_date: $disbursement_date, pdf_reference: $pdf_reference, installments_forecast: $installments_forecast, expiration_date: $expiration_date)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is GetProposalAvailableResponse &&
        other.number_of_installments == number_of_installments &&
        other.installment_amount == installment_amount &&
        other.principal_grace_period == principal_grace_period &&
        other.term_duration == term_duration &&
        other.finance_amount == finance_amount &&
        other.gross_amount == gross_amount &&
        other.installments_amount_total == installments_amount_total &&
        other.iof_amount == iof_amount &&
        other.monthly_interest_rate == monthly_interest_rate &&
        other.annual_interest_rate == annual_interest_rate &&
        other.monthly_cet == monthly_cet &&
        other.annual_cet == annual_cet &&
        other.first_due_date == first_due_date &&
        other.conditions == conditions &&
        other.disbursement_date == disbursement_date &&
        other.pdf_reference == pdf_reference &&
        listEquals(other.installments_forecast, installments_forecast) &&
        other.expiration_date == expiration_date;
  }

  @override
  int get hashCode {
    return number_of_installments.hashCode ^
        installment_amount.hashCode ^
        principal_grace_period.hashCode ^
        term_duration.hashCode ^
        finance_amount.hashCode ^
        gross_amount.hashCode ^
        installments_amount_total.hashCode ^
        iof_amount.hashCode ^
        monthly_interest_rate.hashCode ^
        annual_interest_rate.hashCode ^
        monthly_cet.hashCode ^
        annual_cet.hashCode ^
        first_due_date.hashCode ^
        conditions.hashCode ^
        disbursement_date.hashCode ^
        pdf_reference.hashCode ^
        installments_forecast.hashCode ^
        expiration_date.hashCode;
  }
}

class InstallmentForecast {
  final int installment_number;
  final String due_date;
  final double amortization_amount;
  final double installment_amount;
  final double interest_amount;
  final double current_balance_amount;

  InstallmentForecast({
    required this.installment_number,
    required this.due_date,
    required this.amortization_amount,
    required this.installment_amount,
    required this.interest_amount,
    required this.current_balance_amount,
  });

  InstallmentForecast copyWith({
    int? installment_number,
    String? due_date,
    double? amortization_amount,
    double? installment_amount,
    double? interest_amount,
    double? current_balance_amount,
  }) {
    return InstallmentForecast(
      installment_number: installment_number ?? this.installment_number,
      due_date: due_date ?? this.due_date,
      amortization_amount: amortization_amount ?? this.amortization_amount,
      installment_amount: installment_amount ?? this.installment_amount,
      interest_amount: interest_amount ?? this.interest_amount,
      current_balance_amount:
          current_balance_amount ?? this.current_balance_amount,
    );
  }

  factory InstallmentForecast.mocked({
    int? installment_number,
    String? due_date,
    double? amortization_amount,
    double? installment_amount,
    double? interest_amount,
    double? current_balance_amount,
  }) {
    return InstallmentForecast(
      installment_number: installment_number ?? 1,
      due_date: due_date ?? '2024-07-01',
      amortization_amount: amortization_amount ?? 500.0,
      installment_amount: installment_amount ?? 510.0,
      interest_amount: interest_amount ?? 10.0,
      current_balance_amount: current_balance_amount ?? 5500.0,
    );
  }

  Map<String, dynamic> toMap() {
    final result = <String, dynamic>{};

    result.addAll({'installment_number': installment_number});
    result.addAll({'due_date': due_date});
    result.addAll({'amortization_amount': amortization_amount});
    result.addAll({'installment_amount': installment_amount});
    result.addAll({'interest_amount': interest_amount});
    result.addAll({'current_balance_amount': current_balance_amount});

    return result;
  }

  factory InstallmentForecast.fromMap(Map<String, dynamic> map) {
    return InstallmentForecast(
      installment_number: map['installment_number']?.toInt() ?? 0,
      due_date: map['due_date'] ?? '',
      amortization_amount: map['amortization_amount']?.toDouble() ?? 0.0,
      installment_amount: map['installment_amount']?.toDouble() ?? 0.0,
      interest_amount: map['interest_amount']?.toDouble() ?? 0.0,
      current_balance_amount: map['current_balance_amount']?.toDouble() ?? 0.0,
    );
  }

  String toJson() => json.encode(toMap());

  factory InstallmentForecast.fromJson(String source) =>
      InstallmentForecast.fromMap(json.decode(source));

  @override
  String toString() {
    return 'InstallmentForecast(installment_number: $installment_number, due_date: $due_date, amortization_amount: $amortization_amount, installment_amount: $installment_amount, interest_amount: $interest_amount, current_balance_amount: $current_balance_amount)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is InstallmentForecast &&
        other.installment_number == installment_number &&
        other.due_date == due_date &&
        other.amortization_amount == amortization_amount &&
        other.installment_amount == installment_amount &&
        other.interest_amount == interest_amount &&
        other.current_balance_amount == current_balance_amount;
  }

  @override
  int get hashCode {
    return installment_number.hashCode ^
        due_date.hashCode ^
        amortization_amount.hashCode ^
        installment_amount.hashCode ^
        interest_amount.hashCode ^
        current_balance_amount.hashCode;
  }
}
