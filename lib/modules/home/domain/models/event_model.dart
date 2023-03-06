// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';
import 'dart:developer';

import 'package:equatable/equatable.dart';
import 'package:hightable_mobile_v2/modules/authentication/domain/models/usermodel.dart';

import 'address.dart';
import 'coordinate.dart';
import 'meta.dart';
import 'property_model.dart';
import 'ticket.dart';

class Event extends Equatable {
  final String? id;
  final String? ownerId;
  final String? ownerType;
  final String? title;
  final String? description;
  final String? host;
  final Address? address;
  final String? start;
  final String? end;
  final Coordinate? location;
  final List<Ticket>? tickets;
  final num? tickerLimit;
  final List<String>? images;
  final num? likes;
  final List<Property>? tags;
  final bool? likedByUser;
  final num? repeats;
  final Meta? meta;
  final User? user;
  const Event({
    this.id,
    this.ownerId,
    this.ownerType,
    this.start,
    this.title,
    this.description,
    this.host,
    this.address,
    this.location,
    required this.tickets,
    this.tickerLimit,
    this.images,
    this.likes,
    this.end,
    this.tags,
    this.likedByUser,
    this.repeats,
    this.meta,
    this.user,
  });

  Event copyWith({
    String? id,
    String? ownerId,
    String? ownerType,
    String? title,
    String? description,
    String? end,
    String? host,
    Address? address,
    Coordinate? location,
    String? start,
    List<Ticket>? tickets,
    num? tickerLimit,
    List<String>? images,
    num? likes,
    List<Property>? tags,
    bool? likedByUser,
    num? repeats,
    Meta? meta,
    User? user,
  }) {
    return Event(
      id: id ?? this.id,
      ownerId: ownerId ?? this.ownerId,
      ownerType: ownerType ?? this.ownerType,
      title: title ?? this.title,
      description: description ?? this.description,
      host: host ?? this.host,
      start: start ?? this.start,
      address: address ?? this.address,
      location: location ?? this.location,
      tickets: tickets ?? this.tickets,
      tickerLimit: tickerLimit ?? this.tickerLimit,
      images: images ?? this.images,
      likes: likes ?? this.likes,
      end: end ?? this.end,
      tags: tags ?? this.tags,
      likedByUser: likedByUser ?? this.likedByUser,
      repeats: repeats ?? this.repeats,
      meta: meta ?? this.meta,
      user: user ?? this.user,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      '_id': id,
      'ownerId': ownerId,
      'ownerType': ownerType,
      'title': title,
      'description': description,
      'host': host,
      'end': end,
      'address': address?.toMap(),
      'location': location?.toMap(),
      'tickets': tickets?.map((x) => x.toMap()).toList(),
      'tickerLimit': tickerLimit,
      'images': images,
      'likes': likes,
      'start': start,
      'tags': tags?.map((x) => x.toMap()).toList(),
      'likedByUser': likedByUser,
      'repeats': repeats,
      'meta': meta?.toMap(),
      'user': user?.toMap(),
    };
  }

  factory Event.fromMap(Map<String, dynamic> map) {
    log('Event.fromMap $map');
    return Event(
      id: map['_id'] != null ? map['_id'] as String : null,
      ownerId: map['ownerId'] != null ? map['ownerId'] as String : null,
      ownerType: map['ownerType'] != null ? map['ownerType'] as String : null,
      title: map['title'] != null ? map['title'] as String : null,
      description:
          map['description'] != null ? map['description'] as String : null,
      end: map['end'],
      start: map['start'],
      host: map['host'] != null ? map['host'] as String : null,
      address: map['address'] != null
          ? Address.fromMap(map['address'] as Map<String, dynamic>)
          : null,
      location: map['location'] != null
          ? Coordinate.fromMap(map['location'] as Map<String, dynamic>)
          : null,
      tickets: map['tickets'] != null
          ? List<Ticket>.from(
              (map['tickets'] as List).map<Ticket>(
                (x) => Ticket.fromMap(x as Map<String, dynamic>),
              ),
            )
          : null,
      tickerLimit:
          map['tickerLimit'] != null ? map['tickerLimit'] as num : null,
      images: map['images'] != null ? List<String>.from((map['images'])) : null,
      likes: map['likes'] != null ? map['likes'] as num : null,
      tags: map['tags'] != null
          ? List<Property>.from(
              (map['tags'] as List<int>).map<Property?>(
                (x) => Property.fromMap(x as Map<String, dynamic>),
              ),
            )
          : null,
      likedByUser:
          map['likedByUser'] != null ? map['likedByUser'] as bool : null,
      repeats: map['repeats'] != null ? map['repeats'] as num : null,
      meta: map['meta'] != null
          ? Meta.fromMap(map['meta'] as Map<String, dynamic>)
          : null,
      user: map['user'] != null
          ? User.fromMap(map['user'] as Map<String, dynamic>)
          : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory Event.fromJson(String source) =>
      Event.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  bool get stringify => true;

  @override
  List<Object?> get props {
    return [
      id,
      ownerId,
      ownerType,
      title,
      description,
      host,
      address,
      location,
      tickets,
      tickerLimit,
      images,
      start,
      likes,
      tags,
      likedByUser,
      repeats,
      meta,
      end,
      user,
    ];
  }
}
