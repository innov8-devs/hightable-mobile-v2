// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:equatable/equatable.dart';

class SignupParams extends Equatable {
  final String? email;
  final String? password;
  final String? firstName;
  final String? lastName;
  final String? userName;
  const SignupParams({
    this.email,
    this.password,
    this.firstName,
    this.lastName,
    this.userName,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'email': email,
      'password': password,
      'firstName': firstName,
      'lastName': lastName,
      'username': userName,
    };
  }

  factory SignupParams.fromMap(Map<String, dynamic> map) {
    return SignupParams(
      email: map['email'] != null ? map['email'] as String : null,
      password: map['password'] != null ? map['password'] as String : null,
      firstName: map['firstName'] != null ? map['firstName'] as String : null,
      lastName: map['lastName'] != null ? map['lastName'] as String : null,
      userName: map['username'] != null ? map['username'] as String : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory SignupParams.fromJson(String source) =>
      SignupParams.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  List<Object?> get props {
    return [
      email,
      password,
      firstName,
      lastName,
      userName,
    ];
  }
}
