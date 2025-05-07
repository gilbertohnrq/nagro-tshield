// coverage:ignore-file
// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class GeoLocalization {
  String latitude;

  String longitude;

  GeoLocalization({
    required this.latitude,
    required this.longitude,
  });

  GeoLocalization copyWith({
    String? latitude,
    String? longitude,
  }) {
    return GeoLocalization(
      latitude: latitude ?? this.latitude,
      longitude: longitude ?? this.longitude,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'lat': latitude,
      'lng': longitude,
    };
  }

  factory GeoLocalization.fromMap(Map<String, dynamic> map) {
    return GeoLocalization(
      latitude: map['lat'] as String,
      longitude: map['lng'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory GeoLocalization.fromJson(String source) =>
      GeoLocalization.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() => 'GeoLocalization(lat: $latitude, lng: $longitude)';

  @override
  bool operator ==(covariant GeoLocalization other) {
    if (identical(this, other)) return true;

    return other.latitude == latitude && other.longitude == longitude;
  }

  @override
  int get hashCode => latitude.hashCode ^ longitude.hashCode;
}
