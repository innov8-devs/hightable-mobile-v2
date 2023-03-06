// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:equatable/equatable.dart';

class Ticket extends Equatable {
  final String? id;
  final String? title;
  final num? price;
  final List<String>? packages;
  final num? totalCount;
  final num? soldCount;
  const Ticket({
    this.id,
    this.title,
    this.price,
    this.packages,
    this.totalCount,
    this.soldCount,
  });

  Ticket copyWith({
    String? id,
    String? title,
    num? price,
    List<String>? packages,
    num? totalCount,
    num? soldCount,
  }) {
    return Ticket(
      id: id ?? this.id,
      title: title ?? this.title,
      price: price ?? this.price,
      packages: packages ?? this.packages,
      totalCount: totalCount ?? this.totalCount,
      soldCount: soldCount ?? this.soldCount,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'title': title,
      'price': price,
      'packages': packages,
      'totalCount': totalCount,
      'soldCount': soldCount,
    };
  }

  factory Ticket.fromMap(Map<String, dynamic> map) {
    return Ticket(
      id: map['id'] != null ? map['id'] as String : null,
      title: map['title'] != null ? map['title'] as String : null,
      price: map['price'] != null ? map['price'] as num : null,
      packages: map['packages'] != null
          ? List<String>.from((map['packages'] as List<String>))
          : null,
      totalCount: map['totalCount'] != null ? map['totalCount'] as num : null,
      soldCount: map['soldCount'] != null ? map['soldCount'] as num : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory Ticket.fromJson(String source) =>
      Ticket.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  bool get stringify => true;

  @override
  List<Object?> get props {
    return [
      id,
      title,
      price,
      packages,
      totalCount,
      soldCount,
    ];
  }
}
