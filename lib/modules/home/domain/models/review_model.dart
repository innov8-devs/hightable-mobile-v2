// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:hightable_mobile_v2/modules/authentication/domain/models/usermodel.dart';
import 'package:hightable_mobile_v2/modules/home/domain/models/business_model.dart';
import 'package:hightable_mobile_v2/utils/assets.dart';
import 'meta.dart';

class Review {
  String? id;
  String? restaurantId;
  dynamic body;
  dynamic images;
  final bool? likedByUser;
  int? rating;
  int? likes;
  User? user;
  Meta? meta;
  Business? business;
  String? reviewType;
  String? businessType;

  Review({
    required this.id,
    required this.restaurantId,
    required this.body,
    required this.images,
    required this.rating,
    required this.likes,
    required this.user,
    required this.meta,
    this.likedByUser,
    this.business,
    this.reviewType,
    this.businessType,
  });

  Review copyWith({
    String? id,
    String? restaurantId,
    String? businessType,
    dynamic? body,
    dynamic? images,
    int? rating,
    int? likes,
    User? user,
    Meta? meta,
    bool? likedByUser,
    Business? business,
  }) {
    return Review(
      id: id ?? this.id,
      restaurantId: restaurantId ?? this.restaurantId,
      body: body ?? this.body,
      images: images ?? this.images,
      rating: rating ?? this.rating,
      likes: likes ?? this.likes,
      user: user ?? this.user,
      meta: meta ?? this.meta,
      likedByUser: likedByUser ?? this.likedByUser,
      business: business ?? this.business,
      reviewType: reviewType ?? reviewType,
      businessType: businessType ?? businessType,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'restaurantId': restaurantId,
      'body': body,
      'images': images,
      'rating': rating,
      'likes': likes,
      'user': user?.toMap(),
      'meta': meta?.toMap(),
      'likedByUser': likedByUser,
      'business': business,
      'reviewType': reviewType,
      'businessType': businessType,
    };
  }

  factory Review.fromMap(Map<String, dynamic> map) {
    return Review(
      id: map['_id'],
      restaurantId: map['restaurantId'],
      businessType: map['businessType'],
      body: map['body'] as dynamic,
      images: map['images'] as dynamic,
      rating: map['rating'] as int?,
      likes: map['likes'] as int?,
      reviewType: map['reviewType'] as String?,
      user: map['user'] == null
          ? null
          : User.fromMap(map['user'] as Map<String, dynamic>),
      meta: map['meta'] == null
          ? null
          : Meta.fromMap(map['meta'] as Map<String, dynamic>),
      likedByUser: map['likedByUser'] as bool?,
      business: map['business'] == null
          ? null
          : Business.fromMap(map['business'] as Map<String, dynamic>),
    );
  }

  String toJson() => json.encode(toMap());

  factory Review.fromJson(String source) =>
      Review.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'Review(id: $id, restaurantId: $restaurantId, body: $body, images: $images, rating: $rating, likes: $likes, user: $user, meta: $meta, likedByUser: $likedByUser ) ';
  }

  @override
  bool operator ==(covariant Review other) {
    if (identical(this, other)) return true;

    return other.id == id &&
        other.restaurantId == restaurantId &&
        other.body == body &&
        other.images == images &&
        other.rating == rating &&
        other.likes == likes &&
        other.businessType == businessType &&
        other.user == user &&
        other.business == business &&
        other.reviewType == reviewType &&
        other.meta == meta &&
        other.likedByUser == likedByUser;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        restaurantId.hashCode ^
        body.hashCode ^
        images.hashCode ^
        rating.hashCode ^
        likes.hashCode ^
        user.hashCode ^
        business.hashCode ^
        reviewType.hashCode ^
        businessType.hashCode ^
        meta.hashCode ^
        likedByUser.hashCode;
  }
}

class ReviewEmoji {
  int id;
  String image;

  ReviewEmoji({
    required this.id,
    required this.image,
  });
}

class ReviewEmojis {
  static List<ReviewEmoji> emojis = [
    ReviewEmoji(
      id: 1,
      image: ImageAssets.disappointed,
    ),
    ReviewEmoji(
      id: 2,
      image: ImageAssets.unamused,
    ),
    ReviewEmoji(
      id: 3,
      image: ImageAssets.neutral,
    ),
    ReviewEmoji(
      id: 4,
      image: ImageAssets.smiling,
    ),
    ReviewEmoji(
      id: 5,
      image: ImageAssets.smilingHeart,
    ),
  ];
}
