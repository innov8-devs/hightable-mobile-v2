import 'dart:convert';

import 'package:equatable/equatable.dart';
import 'package:hightable_mobile_v2/modules/authentication/domain/models/usermodel.dart';

class AuthOutput extends Equatable {
  const AuthOutput({
    required this.jwt,
    required this.expires,
    this.user,
  });

  final String? jwt;
  final String? expires;
  final User? user;

  AuthOutput copyWith({
    String? jwt,
    String? expires,
    User? user,
  }) {
    return AuthOutput(
      jwt: jwt ?? this.jwt,
      expires: expires ?? this.expires,
      user: user ?? this.user,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'jwt': jwt,
      'expires': expires,
      'user': user?.toMap(),
    };
  }

  factory AuthOutput.fromMap(Map<String, dynamic> map) {
    return AuthOutput(
      jwt: map['jwt'] as String,
      expires: map['expires'] as String,
      user: map['user'] != null
          ? User.fromMap(map['user'] as Map<String, dynamic>)
          : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory AuthOutput.fromJson(String source) =>
      AuthOutput.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  bool get stringify => true;

  @override
  List<Object?> get props => [jwt, expires, user];
}
