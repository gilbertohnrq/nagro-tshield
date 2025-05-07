// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class CreditRequest {
  String? name;
  String? phone;
  String? email;
  String? clientIp;
  GeoLocalization? geolocation;
  String? deviceCode;
  double value;
  bool isRuralProducer;
  bool hasCreditRestriction;

  CreditRequest({
    this.name,
    this.phone,
    this.email,
    this.clientIp,
    this.geolocation,
    this.deviceCode,
    this.value = 5,
    this.isRuralProducer = false,
    this.hasCreditRestriction = false,
  });

  CreditRequest copyWith({
    String? name,
    String? phone,
    String? email,
    String? clientIp,
    GeoLocalization? geolocation,
    String? deviceCode,
    double? value,
    bool? isRuralProducer,
    bool? hasCreditRestriction,
  }) {
    return CreditRequest(
      name: name ?? this.name,
      phone: phone ?? this.phone,
      email: email ?? this.email,
      clientIp: clientIp ?? this.clientIp,
      geolocation: geolocation ?? this.geolocation,
      deviceCode: deviceCode ?? this.deviceCode,
      value: value ?? this.value,
      isRuralProducer: isRuralProducer ?? this.isRuralProducer,
      hasCreditRestriction: hasCreditRestriction ?? this.hasCreditRestriction,
    );
  }

  factory CreditRequest.mocked({
    String? name,
    String? phone,
    String? email,
    String? clientIp,
    GeoLocalization? geolocation,
    String? deviceCode,
    double? value,
    bool? isRuralProducer,
    bool? hasCreditRestriction,
  }) {
    return CreditRequest(
      name: name ?? 'name',
      phone: phone ?? 'phone',
      email: email ?? 'email',
      clientIp: clientIp ?? 'clientIp',
      geolocation: geolocation ?? GeoLocalization.mocked(),
      deviceCode: deviceCode ?? 'deviceCode',
      value: value ?? 50000.0,
      isRuralProducer: isRuralProducer ?? true,
      hasCreditRestriction: hasCreditRestriction ?? false,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'name': name,
      'phone': phone,
      'email': email,
      'clientIp': clientIp,
      'geolocation': geolocation?.toMap(),
      'deviceCode': deviceCode,
      'value': value,
      'isRuralProducer': isRuralProducer,
      'hasCreditRestriction': hasCreditRestriction,
    };
  }

  factory CreditRequest.fromMap(Map<String, dynamic> map) {
    return CreditRequest(
      name: map['name'] != null ? map['name'] as String : null,
      phone: map['phone'] as String,
      email: map['email'] as String,
      clientIp: map['clientIp'] != null ? map['clientIp'] as String : null,
      geolocation: map['geolocation'] != null
          ? GeoLocalization.fromMap(map['geolocation'] as Map<String, dynamic>)
          : null,
      deviceCode:
          map['deviceCode'] != null ? map['deviceCode'] as String : null,
      value: map['value'] ?? 5.0,
      isRuralProducer: map['isRuralProducer'] ?? false,
      hasCreditRestriction: map['hasCreditRestriction'] ?? false,
    );
  }

  String toJson() => json.encode(toMap());

  factory CreditRequest.fromJson(String source) =>
      CreditRequest.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'CreditRequest(name: $name, phone: $phone, email: $email, clientIp: $clientIp, geolocation: $geolocation, deviceCode: $deviceCode, value: $value), isRuralProducer: $isRuralProducer, hasCreditRestriction: $hasCreditRestriction';
  }

  @override
  bool operator ==(covariant CreditRequest other) {
    if (identical(this, other)) return true;

    return other.name == name &&
        other.phone == phone &&
        other.email == email &&
        other.clientIp == clientIp &&
        other.geolocation == geolocation &&
        other.deviceCode == deviceCode &&
        other.value == value &&
        other.isRuralProducer == isRuralProducer &&
        other.hasCreditRestriction == hasCreditRestriction;
  }

  @override
  int get hashCode {
    return name.hashCode ^
        phone.hashCode ^
        email.hashCode ^
        clientIp.hashCode ^
        geolocation.hashCode ^
        deviceCode.hashCode ^
        value.hashCode ^
        isRuralProducer.hashCode ^
        hasCreditRestriction.hashCode;
  }
}

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

  factory GeoLocalization.mocked() {
    return GeoLocalization(
      latitude: '40.7128',
      longitude: '-74.0060',
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'latitude': latitude,
      'longitude': longitude,
    };
  }

  factory GeoLocalization.fromMap(Map<String, dynamic> map) {
    return GeoLocalization(
      latitude: map['latitude'] as String,
      longitude: map['longitude'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory GeoLocalization.fromJson(String source) =>
      GeoLocalization.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() =>
      'GeoLocalization(latitude: $latitude, longitude: $longitude)';

  @override
  bool operator ==(covariant GeoLocalization other) {
    if (identical(this, other)) return true;

    return other.latitude == latitude && other.longitude == longitude;
  }

  @override
  int get hashCode => latitude.hashCode ^ longitude.hashCode;
}

enum RuralProducerStatus {
  yes(true),
  no(false);

  final bool value;
  const RuralProducerStatus(this.value);

  bool get isRuralProducer => this == RuralProducerStatus.yes;
}

enum CreditRestrictionStatus {
  yes(true),
  no(false);

  final bool value;
  const CreditRestrictionStatus(this.value);

  bool get hasCreditRestriction => this == CreditRestrictionStatus.yes;
}
