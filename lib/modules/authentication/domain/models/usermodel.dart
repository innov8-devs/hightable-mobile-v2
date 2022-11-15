import 'dart:convert';
import 'dart:developer';

import 'package:equatable/equatable.dart';
import 'package:hightable_mobile_v2/modules/authentication/domain/models/token.dart';

import '../../../home/domain/models/resturant.dart';
import 'package:hive/hive.dart';

part 'user.g.dart';

class User extends Equatable {
  const User({
    this.id,
    this.email,
    this.username,
    this.firstName,
    this.lastName,
    this.middleName,
    this.gender,
    this.telephone,
    this.about,
    this.dob,
    this.instagram,
    this.twitter,
    this.address,
    this.verified,
    this.followerCount,
    this.followingCount,
    this.reviewCount,
    this.profileImage,
    this.interests,
    this.preferences,
    this.youFollow,
    this.allergies,
    this.restaurantFollowers,
    this.restaurantFollowings,
    this.customerFollowers,
    this.customerFollowings,
    this.token,
  });
  @HiveField(0)
  final String? id;
  @HiveField(1)
  final String? email;
  @HiveField(2)
  final String? username;
  @HiveField(3)
  final String? firstName;
  @HiveField(4)
  final String? lastName;
  @HiveField(5)
  final String? middleName;
  @HiveField(6)
  final String? gender;
  @HiveField(7)
  final String? telephone;
  @HiveField(8)
  final String? about;
  @HiveField(9)
  final String? dob;
  @HiveField(10)
  final String? instagram;
  @HiveField(11)
  final String? twitter;
  @HiveField(12)
  final String? address;
  @HiveField(13)
  final bool? verified;
  @HiveField(14)
  final int? followerCount;
  @HiveField(15)
  final int? followingCount;
  @HiveField(16)
  final int? reviewCount;
  @HiveField(17)
  final dynamic profileImage;
  @HiveField(18)
  final dynamic interests;
  @HiveField(19)
  final dynamic preferences;
  @HiveField(20)
  final dynamic allergies;
  @HiveField(21)
  final bool? youFollow;
  @HiveField(22)
  final List<Restaurant>? restaurantFollowers;
  @HiveField(23)
  final List<User>? customerFollowers;
  @HiveField(24)
  final List<Restaurant>? restaurantFollowings;
  @HiveField(25)
  final List<User>? customerFollowings;
  @HiveField(26)
  final Token? token;

  User copyWith({
    String? id,
    String? email,
    String? username,
    String? firstName,
    String? lastName,
    String? middleName,
    String? gender,
    String? telephone,
    String? about,
    String? dob,
    String? instagram,
    String? twitter,
    String? address,
    bool? verified,
    int? followerCount,
    int? followingCount,
    int? reviewCount,
    dynamic profileImage,
    dynamic interests,
    dynamic preferences,
    dynamic allergies,
    bool? youFollow,
    List<Restaurant>? restaurantFollowers,
    List<User>? customerFollowers,
    List<Restaurant>? restaurantFollowings,
    List<User>? customerFollowings,
    Token? token,
  }) {
    return User(
      id: id ?? this.id,
      email: email ?? this.email,
      username: username ?? this.username,
      firstName: firstName ?? this.firstName,
      lastName: lastName ?? this.lastName,
      middleName: middleName ?? this.middleName,
      gender: gender ?? this.gender,
      telephone: telephone ?? this.telephone,
      about: about ?? this.about,
      dob: dob ?? this.dob,
      instagram: instagram ?? this.instagram,
      twitter: twitter ?? this.twitter,
      address: address ?? this.address,
      verified: verified ?? this.verified,
      followerCount: followerCount ?? this.followerCount,
      followingCount: followingCount ?? this.followingCount,
      reviewCount: reviewCount ?? this.reviewCount,
      profileImage: profileImage ?? this.profileImage,
      interests: interests ?? this.interests,
      preferences: preferences ?? this.preferences,
      youFollow: youFollow ?? this.youFollow,
      allergies: allergies ?? this.allergies,
      restaurantFollowers: restaurantFollowers ?? this.restaurantFollowers,
      customerFollowers: customerFollowers ?? this.customerFollowers,
      restaurantFollowings: restaurantFollowings ?? this.restaurantFollowings,
      customerFollowings: customerFollowings ?? this.customerFollowings,
      token: token ?? this.token,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      if (id != null) '_id': id,
      if (email != null) 'email': email,
      if (username != null) 'username': username,
      if (firstName != null) 'firstName': firstName,
      if (lastName != null) 'lastName': lastName,
      if (middleName != null) 'middleName': middleName,
      if (gender != null) 'gender': gender,
      if (telephone != null) 'telephone': telephone,
      if (about != null) 'about': about,
      if (dob != null) 'dob': dob,
      if (instagram != null) 'instagram': instagram,
      if (twitter != null) 'twitter': twitter,
      if (address != null) 'address': address,
      if (verified != null) 'verified': verified,
      if (followerCount != null) 'followerCount': followerCount,
      if (followingCount != null) 'followingCount': followingCount,
      if (reviewCount != null) 'reviewCount': reviewCount,
      if (profileImage != null) 'profileImage': profileImage,
      if (interests != null) 'interests': interests,
      if (preferences != null) 'preferences': preferences,
      if (allergies != null) 'youFollow': youFollow,
      if (restaurantFollowers != null) 'allergies': allergies,
      if (restaurantFollowers != null)
        'restaurantFollowers': restaurantFollowers,
      if (customerFollowers != null) 'customerFollowers': customerFollowers,
      if (restaurantFollowings != null)
        'restaurantFollowings': restaurantFollowings,
      if (customerFollowings != null) 'customerFollowings': customerFollowings,
      if (token != null) 'token': token,
    };
  }

  factory User.fromMap(Map<String, dynamic> map) {
    log(map['followings'].toString());
    return User(
      id: map['_id'] != null ? map['_id'] as String : null,
      email: map['email'] != null ? map['email'] as String : null,
      username: map['username'] != null ? map['username'] as String : null,
      firstName: map['firstName'] != null ? map['firstName'] as String : null,
      lastName: map['lastName'] != null ? map['lastName'] as String : null,
      middleName:
          map['middleName'] != null ? map['middleName'] as String : null,
      gender: map['gender'] != null ? map['gender'] as String : null,
      telephone: map['telephone'] != null ? map['telephone'] as String : null,
      about: map['about'] != null ? map['about'] as String : null,
      dob: map['dob'] != null ? map['dob'] as String : null,
      instagram: map['instagram'] != null ? map['instagram'] as String : null,
      twitter: map['twitter'] != null ? map['twitter'] as String : null,
      address: map['address'] != null ? map['address'] as String : null,
      verified: map['verified'] != null ? map['verified'] as bool : null,
      followerCount:
          map['followerCount'] != null ? map['followerCount'] as int : null,
      followingCount:
          map['followingCount'] != null ? map['followingCount'] as int : null,
      reviewCount:
          map['reviewCount'] != null ? map['reviewCount'] as int : null,
      profileImage: map['profileImage'] as dynamic,
      interests: map['interests'] as dynamic,
      preferences: map['preferences'] as dynamic,
      youFollow: map['youFollow'] != null ? map['youFollow'] as bool : null,
      allergies: map['allergies'],
      customerFollowers: map['followers'] != null
          ? (map['followers']['data'] as List)
              .where((data) => data['__typename'] == 'Customer')
              .map((e) => User.fromMap(e))
              .toList()
          : null,
      restaurantFollowers: map['followers'] != null
          ? (map['followers']['data'] as List)
              .where((data) => data['__typename'] == 'Restaurant')
              .map((e) => Restaurant.fromMap(e))
              .toList()
          : null,
      customerFollowings: map['followings'] != null
          ? (map['followings']['data'] as List)
              .where((data) {
                log(data['__typename'] + ':::type');
                return data['__typename'] == 'Customer';
              })
              .map((e) => User.fromMap(e))
              .toList()
          : null,
      restaurantFollowings: map['followings'] != null
          ? (map['followings']['data'] as List)
              .where((data) => data['__typename'] == 'Restaurant')
              .map((e) => Restaurant.fromMap(e))
              .toList()
          : null,
      // token: map['token'],
    );
  }

  String toJson() => json.encode(toMap());

  factory User.fromJson(String source) =>
      User.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  bool get stringify => true;

  @override
  List<Object?> get props {
    return [
      id,
      email,
      username,
      firstName,
      lastName,
      middleName,
      gender,
      telephone,
      about,
      dob,
      instagram,
      twitter,
      address,
      verified,
      followerCount,
      followingCount,
      reviewCount,
      profileImage,
      interests,
      preferences,
      youFollow,
      restaurantFollowers,
      customerFollowers,
      restaurantFollowings,
      customerFollowings,
      token,
    ];
  }
}
