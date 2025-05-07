// coverage:ignore-file
// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class User {
  String? taxId;
  String? email;
  String? password;
  String? phone;
  String? otpEncrypted;
  String? iv;
  bool isClient;
  bool? isPreApproved;

  User({
    this.taxId,
    this.email,
    this.password,
    this.phone,
    this.otpEncrypted,
    this.iv,
    required this.isClient,
    this.isPreApproved,
  });

  User copyWith({
    String? taxId,
    String? email,
    String? password,
    String? phone,
    String? otpEncrypted,
    String? iv,
    bool? isClient,
    bool? isPreApproved,
  }) {
    return User(
      taxId: taxId ?? this.taxId,
      email: email ?? this.email,
      password: password ?? this.password,
      phone: phone ?? this.phone,
      otpEncrypted: otpEncrypted ?? this.otpEncrypted,
      iv: iv ?? this.iv,
      isClient: isClient ?? this.isClient,
      isPreApproved: isPreApproved ?? this.isPreApproved,
    );
  }

  factory User.mocked(
      {String? taxId, String? phone, String? email, bool? isClient}) {
    return User(
        taxId: taxId ?? '01234567890',
        isClient: isClient ?? true,
        phone: phone ?? '34999999999',
        email: email ?? 'mock@email.com');
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'taxId': taxId,
      'email': email,
      'password': password,
      'phone': phone,
      'otpEncrypted': otpEncrypted,
      'iv': iv,
      'isClient': isClient,
    };
  }

  factory User.fromMap(Map<String, dynamic> map) {
    return User(
      taxId: map['taxId'] != null ? map['taxId'] as String : null,
      email: map['email'] != null ? map['email'] as String : null,
      password: map['password'] != null ? map['password'] as String : null,
      phone: map['phone'] != null ? map['phone'] as String : null,
      otpEncrypted:
          map['otpEncrypted'] != null ? map['otpEncrypted'] as String : null,
      iv: map['iv'] != null ? map['iv'] as String : null,
      isClient: map['isClient'] as bool,
    );
  }

  String toJson() => json.encode(toMap());

  factory User.fromJson(String source) =>
      User.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  bool operator ==(covariant User other) {
    if (identical(this, other)) return true;

    return other.taxId == taxId &&
        other.email == email &&
        other.password == password &&
        other.phone == phone &&
        other.otpEncrypted == otpEncrypted &&
        other.iv == iv &&
        other.isClient == isClient;
  }

  @override
  int get hashCode {
    return taxId.hashCode ^
        email.hashCode ^
        password.hashCode ^
        phone.hashCode ^
        otpEncrypted.hashCode ^
        iv.hashCode ^
        isClient.hashCode;
  }
}
