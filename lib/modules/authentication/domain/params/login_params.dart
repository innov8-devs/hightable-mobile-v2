// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class LoginParams {
  LoginParams({
    required this.email,
    required this.password,
  });
  final String email;
  final String password;

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'email': email,
      'password': password,
    };
  }

  factory LoginParams.fromMap(Map<String, dynamic> map) {
    return LoginParams(
      password: map['password'] as String,
      email: map['email'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory LoginParams.fromJson(String source) =>
      LoginParams.fromMap(json.decode(source) as Map<String, dynamic>);

  LoginParams copyWith({
    String? email,
    String? password,
  }) {
    return LoginParams(
      email: email ?? this.email,
      password: password ?? this.password,
    );
  }
}
