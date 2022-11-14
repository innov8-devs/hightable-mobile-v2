// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:equatable/equatable.dart';

class Meta extends Equatable {
  final String? createdAt;
  final String? activatedAt;
  final bool? active;
  final String? deactivatedAt;
  final String? upddatedAt;
  const Meta({
    this.createdAt,
    this.activatedAt,
    this.active,
    this.deactivatedAt,
    this.upddatedAt,
  });

  Meta copyWith({
    String? createdAt,
    String? activatedAt,
    bool? active,
    String? deactivatedAt,
    String? upddatedAt,
  }) {
    return Meta(
      createdAt: createdAt ?? this.createdAt,
      activatedAt: activatedAt ?? this.activatedAt,
      active: active ?? this.active,
      deactivatedAt: deactivatedAt ?? this.deactivatedAt,
      upddatedAt: upddatedAt ?? this.upddatedAt,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'createdAt': createdAt,
      'activatedAt': activatedAt,
      'active': active,
      'deactivatedAt': deactivatedAt,
      'upddatedAt': upddatedAt,
    };
  }

  factory Meta.fromMap(Map<String, dynamic> map) {
    return Meta(
      createdAt: map['createdAt'] != null ? map['createdAt'] as String : null,
      activatedAt:
          map['activatedAt'] != null ? map['activatedAt'] as String : null,
      active: map['active'] != null ? map['active'] as bool : null,
      deactivatedAt:
          map['deactivatedAt'] != null ? map['deactivatedAt'] as String : null,
      upddatedAt:
          map['upddatedAt'] != null ? map['upddatedAt'] as String : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory Meta.fromJson(String source) =>
      Meta.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  bool get stringify => true;

  @override
  List<Object?> get props {
    return [
      createdAt,
      activatedAt,
      active,
      deactivatedAt,
      upddatedAt,
    ];
  }
}
