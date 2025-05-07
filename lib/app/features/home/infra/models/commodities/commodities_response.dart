// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:collection/collection.dart';

class Commodity {
  String commodity;
  String icon;

  Commodity({
    required this.commodity,
    required this.icon,
  });

  Commodity copyWith({
    String? commodity,
    String? icon,
  }) {
    return Commodity(
      commodity: commodity ?? this.commodity,
      icon: icon ?? this.icon,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'commodity': commodity,
      'icon': icon,
    };
  }

  factory Commodity.fromMap(Map<String, dynamic> map) {
    return Commodity(
      commodity: map['commodity'] as String,
      icon: map['icon'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory Commodity.fromJson(String source) =>
      Commodity.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() => 'Commodity(commodity: $commodity, icon: $icon)';

  @override
  bool operator ==(covariant Commodity other) {
    if (identical(this, other)) return true;

    return other.commodity == commodity && other.icon == icon;
  }

  @override
  int get hashCode => commodity.hashCode ^ icon.hashCode;
}

class CommoditiesResponse {
  List<Commodity> livestock;
  List<Commodity> agriculture;

  CommoditiesResponse({
    required this.livestock,
    required this.agriculture,
  });

  CommoditiesResponse copyWith({
    List<Commodity>? livestock,
    List<Commodity>? agriculture,
  }) {
    return CommoditiesResponse(
      livestock: livestock ?? this.livestock,
      agriculture: agriculture ?? this.agriculture,
    );
  }

  factory CommoditiesResponse.mocked({
    List<Commodity>? agriculture,
    List<Commodity>? livestock,
  }) {
    return CommoditiesResponse(agriculture: [
      Commodity(commodity: 'Café', icon: 'cafe'),
      Commodity(commodity: 'Milho', icon: 'milho'),
      Commodity(commodity: 'Soja', icon: 'soja'),
      Commodity(commodity: 'Trigo', icon: 'trigo'),
    ], livestock: [
      Commodity(commodity: 'Bovinos', icon: 'bovinos'),
      Commodity(commodity: 'Equinos', icon: 'equinos'),
      Commodity(commodity: 'Ovinos', icon: 'ovinos'),
      Commodity(commodity: 'Suínos', icon: 'suinos'),
    ]);
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'livestock': livestock.map((x) => x.toMap()).toList(),
      'agriculture': agriculture.map((x) => x.toMap()).toList(),
    };
  }

  factory CommoditiesResponse.fromMap(Map<String, dynamic> map) {
    return CommoditiesResponse(
      livestock: (map['livestock'] as List<dynamic>)
          .map<Commodity>((x) => Commodity.fromMap(x as Map<String, dynamic>))
          .toList(),
      agriculture: (map['agriculture'] as List<dynamic>)
          .map<Commodity>((x) => Commodity.fromMap(x as Map<String, dynamic>))
          .toList(),
    );
  }

  String toJson() => json.encode(toMap());

  factory CommoditiesResponse.fromJson(String source) =>
      CommoditiesResponse.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() =>
      'CommoditiesResponse(livestock: $livestock, agriculture: $agriculture)';

  @override
  bool operator ==(covariant CommoditiesResponse other) {
    if (identical(this, other)) return true;
    final listEquals = const DeepCollectionEquality().equals;

    return listEquals(other.livestock, livestock) &&
        listEquals(other.agriculture, agriculture);
  }

  @override
  int get hashCode => livestock.hashCode ^ agriculture.hashCode;
}
