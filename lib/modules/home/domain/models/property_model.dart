// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class Property {
  final String id;
  final String name;

  const Property({
    required this.id,
    required this.name,
  });

  factory Property.fromJson(Map<String, dynamic> responseData) {
    return Property(
      id: responseData['_id'],
      name: responseData['name'],
    );
  }

  Property copyWith({
    String? id,
    String? name,
  }) {
    return Property(
      id: id ?? this.id,
      name: name ?? this.name,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'name': name,
    };
  }

  factory Property.fromMap(Map<String, dynamic> map) {
    return Property(
      id: map['id'] as String,
      name: map['name'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  @override
  String toString() => 'Property(id: $id, name: $name)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is Property && other.id == id && other.name == name;
  }

  @override
  int get hashCode => id.hashCode ^ name.hashCode;
}
