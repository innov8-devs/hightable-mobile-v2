// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class Business {
  String? id;
  String? name;

  Business({
    required this.id,
    required this.name,
  });

  Business copyWith({
    String? id,
    String? name,
  }) {
    return Business(
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

  factory Business.fromMap(Map<String, dynamic> map) {
    return Business(
      id: map['_id'],
      name: map['name'],
    );
  }

  String toJson() => json.encode(toMap());

  factory Business.fromJson(String source) =>
      Business.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'Business(id: $id, name: $name ) ';
  }

  @override
  bool operator ==(covariant Business other) {
    if (identical(this, other)) return true;

    return other.id == id && other.name == name;
  }

  @override
  int get hashCode {
    return id.hashCode ^ name.hashCode;
  }
}
