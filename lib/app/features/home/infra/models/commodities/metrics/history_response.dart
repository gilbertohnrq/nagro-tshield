// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class History {
  String period;
  String value;
  String unit;

  History({
    required this.period,
    required this.value,
    required this.unit,
  });

  History copyWith({
    String? period,
    String? value,
    String? unit,
  }) {
    return History(
      period: period ?? this.period,
      value: value ?? this.value,
      unit: unit ?? this.unit,
    );
  }

  factory History.mocked({
    String? period,
    String? value,
    String? unit,
  }) {
    return History(
      period: period ?? '2024',
      value: value ?? 'R\$ 600,00',
      unit: unit ?? 'R\$',
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'period': period,
      'value': value,
      'unit': unit,
    };
  }

  factory History.fromMap(Map<String, dynamic> map) {
    return History(
      period: map['period'] as String,
      value: map['value'] as String,
      unit: map['unit'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory History.fromJson(String source) =>
      History.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() => 'History(period: $period, value: $value, unit: $unit)';

  @override
  bool operator ==(covariant History other) {
    if (identical(this, other)) return true;

    return other.period == period && other.value == value && other.unit == unit;
  }

  @override
  int get hashCode => period.hashCode ^ value.hashCode ^ unit.hashCode;
}
