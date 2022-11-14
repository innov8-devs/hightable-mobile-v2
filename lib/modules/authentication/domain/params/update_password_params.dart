// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:equatable/equatable.dart';

class UpdatePasswordParams extends Equatable {
  final num? code;
  final String? password;
  const UpdatePasswordParams({
    this.code,
    this.password,
  });

  @override
  List<Object?> get props => [code, password];

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'code': code,
      'password': password,
    };
  }

  factory UpdatePasswordParams.fromMap(Map<String, dynamic> map) {
    return UpdatePasswordParams(
      code: map['code'] != null ? map['code'] as num : null,
      password: map['password'] != null ? map['password'] as String : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory UpdatePasswordParams.fromJson(String source) =>
      UpdatePasswordParams.fromMap(json.decode(source) as Map<String, dynamic>);

  UpdatePasswordParams copyWith({
    num? code,
    String? password,
  }) {
    return UpdatePasswordParams(
      code: code ?? this.code,
      password: password ?? this.password,
    );
  }
}
