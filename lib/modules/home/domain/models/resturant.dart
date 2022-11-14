// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';
import 'dart:developer';

import 'package:flutter/foundation.dart';

import '../../../authentication/domain/entities/user.dart';
import '../../../authentication/domain/models/usermodel.dart';
import 'coordinates.dart';
import 'menu_category.dart';
import 'meta.dart';
import 'property_model.dart';

class Restaurant {
  final String? id;
  final String? shortIdl;
  final String? name;
  final String? email;
  final String? telephone;
  final String? address;
  final String? logo;
  final String? description;
  final Coordinate? coordinate;
  final String? url;
  final num? rating;
  final bool? verified;
  final String? verifiedAt;
  final String? pdfMenu;
  final List<MenuCategory>? menuCategories;
  final List<Property>? tags;
  final num? reviewCount;
  final bool? youFollow;
  final num? followerCount;
  final Meta? meta;
  final num? followingCount;
  final List<Restaurant>? restaurantFollowers;
  final List<User>? customerFollowers;
  final List<Restaurant>? restaurantFollowings;
  final List<User>? customerFollowings;
  Restaurant({
    this.id,
    this.shortIdl,
    this.name,
    this.email,
    this.telephone,
    this.address,
    this.logo,
    this.description,
    this.coordinate,
    this.url,
    this.rating,
    this.verified,
    this.verifiedAt,
    this.pdfMenu,
    this.menuCategories,
    this.tags,
    this.reviewCount,
    this.youFollow,
    this.followerCount,
    this.meta,
    this.followingCount,
    this.customerFollowers,
    this.restaurantFollowers,
    this.restaurantFollowings,
    this.customerFollowings,
  });

  Restaurant copyWith({
    String? id,
    String? shortIdl,
    String? name,
    String? email,
    String? telephone,
    String? address,
    String? logo,
    String? description,
    Coordinate? coordinate,
    String? url,
    num? rating,
    bool? verified,
    String? verifiedAt,
    String? pdfMenu,
    List<MenuCategory>? menuCategories,
    List<Property>? tags,
    num? reviewCount,
    bool? youFollow,
    num? followerCount,
    Meta? meta,
    num? followingCount,
    List<Restaurant>? restaurantFollowers,
    List<User>? customerFollowers,
    List<Restaurant>? restaurantFollowings,
    List<User>? customerFollowings,
  }) {
    return Restaurant(
      id: id ?? this.id,
      shortIdl: shortIdl ?? this.shortIdl,
      name: name ?? this.name,
      email: email ?? this.email,
      telephone: telephone ?? this.telephone,
      address: address ?? this.address,
      logo: logo ?? this.logo,
      description: description ?? this.description,
      coordinate: coordinate ?? this.coordinate,
      url: url ?? this.url,
      rating: rating ?? this.rating,
      verified: verified ?? this.verified,
      verifiedAt: verifiedAt ?? this.verifiedAt,
      pdfMenu: pdfMenu ?? this.pdfMenu,
      menuCategories: menuCategories ?? this.menuCategories,
      tags: tags ?? this.tags,
      reviewCount: reviewCount ?? this.reviewCount,
      youFollow: youFollow ?? this.youFollow,
      followerCount: followerCount ?? this.followerCount,
      meta: meta ?? this.meta,
      followingCount: followingCount ?? this.followingCount,
      restaurantFollowers: restaurantFollowers ?? this.restaurantFollowers,
      customerFollowers: customerFollowers ?? this.customerFollowers,
      restaurantFollowings: restaurantFollowings ?? this.restaurantFollowings,
      customerFollowings: customerFollowings ?? this.customerFollowings,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      '_id': id,
      'shortIdl': shortIdl,
      'name': name,
      'email': email,
      'telephone': telephone,
      'address': address,
      'logo': logo,
      'description': description,
      'coordinate': coordinate?.toMap(),
      'url': url,
      'rating': rating,
      'verified': verified,
      'verifiedAt': verifiedAt,
      'pdfMenu': pdfMenu,
      'menuCategories': menuCategories?.map((x) => x.toMap()).toList(),
      'tags': tags?.map((x) => x.toMap()).toList(),
      'reviewCount': reviewCount,
      'youFollow': youFollow,
      'followerCount': followerCount,
      'meta': meta?.toMap(),
      'followingCount': followingCount,
    };
  }

  factory Restaurant.fromMap(Map<String, dynamic> map) {
    log('Restaurant.fromMap $map');
    return Restaurant(
      id: map['_id'] != null ? map['_id'] as String : null,
      shortIdl: map['shortIdl'] != null ? map['shortIdl'] as String : null,
      name: map['name'] != null ? map['name'] as String : null,
      email: map['email'] != null ? map['email'] as String : null,
      telephone: map['telephone'] != null ? map['telephone'] as String : null,
      address: map['address'] != null ? map['address'] as String : null,
      logo: map['logo'] != null ? map['logo'] as String : null,
      description:
          map['description'] != null ? map['description'] as String : null,
      coordinate: map['coordinate'] != null
          ? Coordinate.fromMap(map['coordinate'] as Map<String, dynamic>)
          : null,
      url: map['url'] != null ? map['url'] as String : null,
      rating: map['rating'] != null ? map['rating'] as num : null,
      verified: map['verified'] != null ? map['verified'] as bool : null,
      verifiedAt:
          map['verifiedAt'] != null ? map['verifiedAt'] as String : null,
      pdfMenu: map['pdfMenu'] != null ? map['pdfMenu'] as String : null,
      menuCategories: map['menuCategories'] == null
          ? null
          : List<MenuCategory>.from(
              (map['menuCategories'] as List<int>).map<MenuCategory>(
                (x) => MenuCategory.fromMap(x as Map<String, dynamic>),
              ),
            ),
      tags: map['tags'] == null
          ? null
          : List<Property>.from(
              (map['tags'] as List<int>).map<Property>(
                (x) => Property.fromMap(x as Map<String, dynamic>),
              ),
            ),
      reviewCount:
          map['reviewCount'] != null ? map['reviewCount'] as num : null,
      youFollow: map['youFollow'] != null ? map['youFollow'] as bool : null,
      followerCount:
          map['followerCount'] != null ? map['followerCount'] as num : null,
      meta: map['meta'] != null
          ? Meta.fromMap(map['meta'] as Map<String, dynamic>)
          : null,
      followingCount:
          map['followingCount'] != null ? map['followingCount'] as num : null,
      // customerFollowers: map['followers'] != null
      //     ? (map['followers']['data'] as List)
      //         .where((data) => data['__typename'] == 'Customer')
      //         .map((e) => User.fromMap(e))
      //         .toList()
      //     : null,
      restaurantFollowers: map['followers'] != null
          ? (map['followers']['data'] as List)
              .where((data) => data['__typename'] == 'Restaurant')
              .map((e) => Restaurant.fromMap(e))
              .toList()
          : null,
      // customerFollowings: map['followings'] != null
      //     ? (map['followings']['data'] as List)
      //         .where((data) {
      //           log(data['__typename'] + ':::types');
      //           return data['__typename'] == 'Customer';
      //         })
      //         .map((e) => User.fromMap(e))
      //         .toList()
      //     : null,
      restaurantFollowings: map['followings'] != null
          ? (map['followings']['data'] as List)
              .where((data) => data['__typename'] == 'Restaurant')
              .map((e) => Restaurant.fromMap(e))
              .toList()
          : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory Restaurant.fromJson(String source) =>
      Restaurant.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'Resturant(id: $id, shortIdl: $shortIdl, name: $name, email: $email, telephone: $telephone, address: $address, logo: $logo, description: $description, coordinate: $coordinate, url: $url, rating: $rating, verified: $verified, verifiedAt: $verifiedAt, pdfMenu: $pdfMenu, menuCategories: $menuCategories, tags: $tags, reviewCount: $reviewCount, youFollow: $youFollow, followerCount: $followerCount, meta: $meta, followingCount: $followingCount $restaurantFollowers $customerFollowers $restaurantFollowings $customerFollowings $customerFollowers $restaurantFollowers)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is Restaurant &&
        other.id == id &&
        other.shortIdl == shortIdl &&
        other.name == name &&
        other.email == email &&
        other.telephone == telephone &&
        other.address == address &&
        other.logo == logo &&
        other.description == description &&
        other.coordinate == coordinate &&
        other.url == url &&
        other.rating == rating &&
        other.verified == verified &&
        other.verifiedAt == verifiedAt &&
        other.pdfMenu == pdfMenu &&
        listEquals(other.menuCategories, menuCategories) &&
        listEquals(other.tags, tags) &&
        other.reviewCount == reviewCount &&
        other.youFollow == youFollow &&
        other.followerCount == followerCount &&
        other.meta == meta &&
        other.followingCount == followingCount;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        shortIdl.hashCode ^
        name.hashCode ^
        email.hashCode ^
        telephone.hashCode ^
        address.hashCode ^
        logo.hashCode ^
        description.hashCode ^
        coordinate.hashCode ^
        url.hashCode ^
        rating.hashCode ^
        verified.hashCode ^
        verifiedAt.hashCode ^
        pdfMenu.hashCode ^
        menuCategories.hashCode ^
        tags.hashCode ^
        reviewCount.hashCode ^
        youFollow.hashCode ^
        followerCount.hashCode ^
        meta.hashCode ^
        followingCount.hashCode;
  }
}
