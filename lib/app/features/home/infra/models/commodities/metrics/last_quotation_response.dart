// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class LastQuotation {
  String? title;
  String? date;
  String? value;
  String? unit;

  LastQuotation({
    required this.title,
    required this.date,
    required this.value,
    required this.unit,
  });

  LastQuotation copyWith({
    String? title,
    String? date,
    String? value,
    String? unit,
  }) {
    return LastQuotation(
      title: title ?? this.title,
      date: date ?? this.date,
      value: value ?? this.value,
      unit: unit ?? this.unit,
    );
  }

  factory LastQuotation.mocked({
    String? title,
    String? date,
    String? value,
    String? unit,
  }) {
    return LastQuotation(
      title: 'Última Cotação',
      unit: 'R\$',
      value: 'R\$ 150,00',
      date: '2023-06-28',
    );
  }

  factory LastQuotation.empty() {
    return LastQuotation(
      title: '',
      date: '',
      value: '',
      unit: '',
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'title': title,
      'date': date,
      'value': value,
      'unit': unit,
    };
  }

  factory LastQuotation.fromMap(Map<String, dynamic> map) {
    return LastQuotation(
      title: map['title'] != null ? map['title'] as String : null,
      date: map['date'] != null ? map['date'] as String : null,
      value: map['value'] != null ? map['value'] as String : null,
      unit: map['unit'] != null ? map['unit'] as String : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory LastQuotation.fromJson(String source) =>
      LastQuotation.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'LastQuotation(title: $title, date: $date, value: $value, unit: $unit)';
  }

  @override
  bool operator ==(covariant LastQuotation other) {
    if (identical(this, other)) return true;

    return other.title == title &&
        other.date == date &&
        other.value == value &&
        other.unit == unit;
  }

  @override
  int get hashCode {
    return title.hashCode ^ date.hashCode ^ value.hashCode ^ unit.hashCode;
  }
}
