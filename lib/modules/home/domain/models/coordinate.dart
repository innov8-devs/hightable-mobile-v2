// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:equatable/equatable.dart';

class Coordinate extends Equatable {
  final num? latitude;
  final num? longitude;
  const Coordinate({
    this.latitude,
    this.longitude,
  });

  Coordinate copyWith({
    num? latitude,
    num? longitude,
  }) {
    return Coordinate(
      latitude: latitude ?? this.latitude,
      longitude: longitude ?? this.longitude,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'latitude': latitude,
      'longitude': longitude,
    };
  }

  factory Coordinate.fromMap(Map<String, dynamic> map) {
    return Coordinate(
      latitude: map['latitude'] != null ? map['latitude'] as num : null,
      longitude: map['longitude'] != null ? map['longitude'] as num : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory Coordinate.fromJson(String source) =>
      Coordinate.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  bool get stringify => true;

  @override
  List<Object?> get props => [latitude, longitude];
}
