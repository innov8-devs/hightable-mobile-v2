// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:equatable/equatable.dart';

import 'meta.dart';

class MenuCategory extends Equatable {
  final String? id;
  final String? name;
  final String? description;
  final Meta? meta;
  final String? image;
  const MenuCategory({
    this.id,
    this.name,
    this.description,
    this.meta,
    this.image,
  });

  MenuCategory copyWith({
    String? id,
    String? name,
    String? description,
    Meta? meta,
    String? image,
  }) {
    return MenuCategory(
      id: id ?? this.id,
      name: name ?? this.name,
      description: description ?? this.description,
      meta: meta ?? this.meta,
      image: image ?? this.image,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'name': name,
      'description': description,
      'meta': meta?.toMap(),
      'image': image,
    };
  }

  factory MenuCategory.fromMap(Map<String, dynamic> map) {
    return MenuCategory(
      id: map['id'] != null ? map['id'] as String : null,
      name: map['name'] != null ? map['name'] as String : null,
      description:
          map['description'] != null ? map['description'] as String : null,
      meta: map['meta'] != null
          ? Meta.fromMap(map['meta'] as Map<String, dynamic>)
          : null,
      image: map['image'] != null ? map['image'] as String : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory MenuCategory.fromJson(String source) =>
      MenuCategory.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  bool get stringify => true;

  @override
  List<Object?> get props {
    return [
      id,
      name,
      description,
      meta,
      image,
    ];
  }
}
