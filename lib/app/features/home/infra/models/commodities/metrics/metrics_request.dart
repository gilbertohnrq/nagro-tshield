import 'dart:convert';

// ignore_for_file: public_member_api_docs, sort_constructors_first

class MetricsRequest {
  String commodity;
  String state;
  String city;

  MetricsRequest({
    required this.commodity,
    required this.state,
    required this.city,
  });

  @override
  String toString() =>
      'MetricsRequest(commodity: $commodity, state: $state, city: $city)';

  @override
  bool operator ==(covariant MetricsRequest other) {
    if (identical(this, other)) return true;

    return other.commodity == commodity &&
        other.state == state &&
        other.city == city;
  }

  @override
  int get hashCode => commodity.hashCode ^ state.hashCode ^ city.hashCode;

  MetricsRequest copyWith({
    String? commodity,
    String? state,
    String? city,
  }) {
    return MetricsRequest(
      commodity: commodity ?? this.commodity,
      state: state ?? this.state,
      city: city ?? this.city,
    );
  }

  factory MetricsRequest.mocked({
    String? commodity,
    String? state,
    String? city,
  }) {
    return MetricsRequest(
      city: city ?? 'Uberlandia',
      state: state ?? 'MG',
      commodity: commodity ?? 'vaca gorda',
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'commodity': commodity,
      'state': state,
      'city': city,
    };
  }

  factory MetricsRequest.fromMap(Map<String, dynamic> map) {
    return MetricsRequest(
      commodity: (map['commodity'] as String).toLowerCase(),
      state: map['state'] as String,
      city: map['city'] as String,
    );
  }

  factory MetricsRequest.fromJson(String source) =>
      MetricsRequest.fromMap(json.decode(source) as Map<String, dynamic>);

  String toJson() => json.encode(toMap());
}
