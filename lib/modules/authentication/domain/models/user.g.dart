// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'usermodel.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class UserAdapter extends TypeAdapter<User> {
  @override
  final int typeId = 0;

  @override
  User read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return User(
      id: fields[0] as String?,
      email: fields[1] as String?,
      username: fields[2] as String?,
      firstName: fields[3] as String?,
      lastName: fields[4] as String?,
      middleName: fields[5] as String?,
      gender: fields[6] as String?,
      telephone: fields[7] as String?,
      about: fields[8] as String?,
      dob: fields[9] as String?,
      instagram: fields[10] as String?,
      twitter: fields[11] as String?,
      address: fields[12] as String?,
      verified: fields[13] as bool?,
      followerCount: fields[14] as int?,
      followingCount: fields[15] as int?,
      reviewCount: fields[16] as int?,
      profileImage: fields[17] as dynamic,
      interests: fields[18] as dynamic,
      preferences: fields[19] as dynamic,
      youFollow: fields[21] as bool?,
      allergies: fields[20] as dynamic,
      restaurantFollowers: (fields[22] as List?)?.cast<Restaurant>(),
      restaurantFollowings: (fields[24] as List?)?.cast<Restaurant>(),
      customerFollowers: (fields[23] as List?)?.cast<User>(),
      customerFollowings: (fields[25] as List?)?.cast<User>(),
      token: fields[26] as Token?,
    );
  }

  @override
  void write(BinaryWriter writer, User obj) {
    writer
      ..writeByte(27)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.email)
      ..writeByte(2)
      ..write(obj.username)
      ..writeByte(3)
      ..write(obj.firstName)
      ..writeByte(4)
      ..write(obj.lastName)
      ..writeByte(5)
      ..write(obj.middleName)
      ..writeByte(6)
      ..write(obj.gender)
      ..writeByte(7)
      ..write(obj.telephone)
      ..writeByte(8)
      ..write(obj.about)
      ..writeByte(9)
      ..write(obj.dob)
      ..writeByte(10)
      ..write(obj.instagram)
      ..writeByte(11)
      ..write(obj.twitter)
      ..writeByte(12)
      ..write(obj.address)
      ..writeByte(13)
      ..write(obj.verified)
      ..writeByte(14)
      ..write(obj.followerCount)
      ..writeByte(15)
      ..write(obj.followingCount)
      ..writeByte(16)
      ..write(obj.reviewCount)
      ..writeByte(17)
      ..write(obj.profileImage)
      ..writeByte(18)
      ..write(obj.interests)
      ..writeByte(19)
      ..write(obj.preferences)
      ..writeByte(20)
      ..write(obj.allergies)
      ..writeByte(21)
      ..write(obj.youFollow)
      ..writeByte(22)
      ..write(obj.restaurantFollowers)
      ..writeByte(23)
      ..write(obj.customerFollowers)
      ..writeByte(24)
      ..write(obj.restaurantFollowings)
      ..writeByte(25)
      ..write(obj.customerFollowings)
      ..writeByte(26)
      ..write(obj.token);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is UserAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
