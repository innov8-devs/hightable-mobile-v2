import 'dart:convert';

import 'package:equatable/equatable.dart';

class Token extends Equatable {
  final String? jwt;
  final String? expires;
  const Token({
    this.jwt,
    this.expires,
  });

  Token copyWith({
    String? jwt,
    String? expires,
  }) {
    return Token(
      jwt: jwt ?? this.jwt,
      expires: expires ?? this.expires,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'jwt': jwt,
      'expires': expires,
    };
  }

  factory Token.fromMap(Map<String, dynamic> map) {
    return Token(
      jwt: map['jwt'] != null ? map['jwt'] as String : null,
      expires: map['expires'] != null ? map['expires'] as String : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory Token.fromJson(String source) =>
      Token.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  bool get stringify => true;

  @override
  List<Object?> get props => [jwt, expires];
}
