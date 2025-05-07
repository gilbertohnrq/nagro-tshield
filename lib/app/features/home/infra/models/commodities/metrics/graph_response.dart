// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class Graph {
  String month;
  double value;
  String valueFormatted;

  Graph(
      {required this.month, required this.value, required this.valueFormatted});

  Graph copyWith({
    String? month,
    double? value,
    String? valueFormatted,
  }) {
    return Graph(
      month: month ?? this.month,
      value: value ?? this.value,
      valueFormatted: valueFormatted ?? this.valueFormatted,
    );
  }

  factory Graph.mocked({
    String? month,
    double? value,
    String? valueFormatted,
  }) {
    return Graph(
      month: month ?? 'Fevereiro',
      value: value ?? 200.0,
      valueFormatted: valueFormatted ?? '200,0',
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'month': month,
      'value': value,
      'valueFormatted': valueFormatted,
    };
  }

  factory Graph.fromMap(Map<String, dynamic> map) {
    return Graph(
      month: map['month'] as String,
      value: map['value'] as double,
      valueFormatted: map['valueFormatted'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory Graph.fromJson(String source) =>
      Graph.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() =>
      'Graph(month: $month, value: $value, valueFormatted: $valueFormatted)';

  @override
  bool operator ==(covariant Graph other) {
    if (identical(this, other)) return true;

    return other.month == month &&
        other.value == value &&
        other.valueFormatted == valueFormatted;
  }

  @override
  int get hashCode => month.hashCode ^ value.hashCode ^ valueFormatted.hashCode;
}
