// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:collection/collection.dart' as collection;

class LocationResponse {
  String? message;
  List<Location> locations;

  LocationResponse({
    required this.message,
    required this.locations,
  });

  LocationResponse copyWith({
    String? message,
    List<Location>? locations,
  }) {
    return LocationResponse(
      message: message ?? this.message,
      locations: locations ?? this.locations,
    );
  }

  factory LocationResponse.mocked(
      {String? message, List<Location>? locations}) {
    return LocationResponse(locations: [], message: 'Sucesso');
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'message': message,
      'locations': locations.map((x) => x.toMap()).toList(),
    };
  }

  factory LocationResponse.fromMap(Map<String, dynamic> map) {
    return LocationResponse(
      message: map['message'] != null ? map['message'] as String : null,
      locations: List<Location>.from(
        (map['locations'] as List<dynamic>).map<Location>(
          (x) => Location.fromMap(x as Map<String, dynamic>),
        ),
      ),
    );
  }

  String toJson() => json.encode(toMap());

  factory LocationResponse.fromJson(String source) =>
      LocationResponse.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() =>
      'LocationResponse(message: $message, locations: $locations)';

  @override
  bool operator ==(covariant LocationResponse other) {
    if (identical(this, other)) return true;
    final listEquals = const collection.DeepCollectionEquality().equals;

    return other.message == message && listEquals(other.locations, locations);
  }

  @override
  int get hashCode => message.hashCode ^ locations.hashCode;
}

class Location {
  String region;
  String state;

  Location({required this.region, required this.state});

  Location copyWith({
    String? region,
    String? state,
  }) {
    return Location(
      region: region ?? this.region,
      state: state ?? this.state,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'region': region,
      'state': state,
    };
  }

  factory Location.fromMap(Map<String, dynamic> map) {
    return Location(
      region: map['region'] as String,
      state: map['state'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory Location.fromJson(String source) =>
      Location.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() => 'Location(region: $region, state: $state)';

  @override
  bool operator ==(covariant Location other) {
    if (identical(this, other)) return true;

    return other.region == region && other.state == state;
  }

  @override
  int get hashCode => region.hashCode ^ state.hashCode;
}
