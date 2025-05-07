// coverage:ignore-file
// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class RefreshToken {
  String id;

  String expiresIn;
  String userId;

  RefreshToken({
    required this.id,
    required this.expiresIn,
    required this.userId,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      '_id': id,
      'expiresIn': expiresIn,
      'userId': userId,
    };
  }

  factory RefreshToken.fromMap(Map<String, dynamic> map) {
    return RefreshToken(
      id: map['_id'] as String,
      expiresIn: map['expiresIn'] as String,
      userId: map['userId'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory RefreshToken.fromJson(String source) =>
      RefreshToken.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() =>
      'RefreshToken(id: $id, expiresIn: $expiresIn, userId: $userId)';

  @override
  bool operator ==(covariant RefreshToken other) {
    if (identical(this, other)) return true;

    return other.id == id &&
        other.expiresIn == expiresIn &&
        other.userId == userId;
  }

  @override
  int get hashCode => id.hashCode ^ expiresIn.hashCode ^ userId.hashCode;
}

class TokenJWT {
  String token;
  String expiresIn;

  TokenJWT({
    required this.token,
    required this.expiresIn,
  });

  factory TokenJWT.mocked({
    String? token,
    String? expiresIn,
  }) {
    return TokenJWT(
      token: token ?? 'some_token',
      expiresIn: expiresIn ?? '3600',
    );
  }

  TokenJWT copyWith({
    String? token,
    String? expiresIn,
  }) {
    return TokenJWT(
      token: token ?? this.token,
      expiresIn: expiresIn ?? this.expiresIn,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'token': token,
      'expiresIn': expiresIn,
    };
  }

  factory TokenJWT.fromMap(Map<String, dynamic> map) {
    return TokenJWT(
      token: map['token'] as String,
      expiresIn: map['expiresIn'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory TokenJWT.fromJson(String source) =>
      TokenJWT.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() => 'TokenJWT(token: $token, expiresIn: $expiresIn)';

  @override
  bool operator ==(covariant TokenJWT other) {
    if (identical(this, other)) return true;

    return other.token == token && other.expiresIn == expiresIn;
  }

  @override
  int get hashCode => token.hashCode ^ expiresIn.hashCode;
}

class Token {
  TokenJWT jwt;
  RefreshToken refreshToken;

  Token({required this.refreshToken, required this.jwt});

  Token copyWith({RefreshToken? refreshToken, TokenJWT? jwt}) {
    return Token(
      jwt: jwt ?? this.jwt,
      refreshToken: refreshToken ?? this.refreshToken,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'refreshToken': refreshToken.toMap(),
    };
  }

  factory Token.fromMap(Map<String, dynamic> map) {
    return Token(
      jwt: TokenJWT.fromMap(map['jwt'] as Map<String, dynamic>),
      refreshToken:
          RefreshToken.fromMap(map['refreshToken'] as Map<String, dynamic>),
    );
  }

  String toJson() => json.encode(toMap());

  factory Token.fromJson(String source) =>
      Token.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() => 'Token(refreshToken: $refreshToken)';

  @override
  bool operator ==(covariant Token other) {
    if (identical(this, other)) return true;

    return other.refreshToken == refreshToken;
  }

  @override
  int get hashCode => refreshToken.hashCode;
}
