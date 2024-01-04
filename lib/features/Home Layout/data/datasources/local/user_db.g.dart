// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_db.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class UserDbAdapter extends TypeAdapter<UserDb> {
  @override
  final int typeId = HiveTypes.userDb;

  @override
  UserDb read(BinaryReader reader) {
    var numOfFields = reader.readByte();
    var fields = <int, dynamic>{
      for (var i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return UserDb(
      fields[0] as String,
      fields[1] as String,
      fields[2] as String,
      fields[3] as String,
      (fields[4] as List).cast<String>(),
      (fields[5] as List).cast<String>(),
      fields[6] as String,
    );
  }

  @override
  void write(BinaryWriter writer, UserDb obj) {
    writer
      ..writeByte(7)
      ..writeByte(0)
      ..write(obj.name)
      ..writeByte(1)
      ..write(obj.password)
      ..writeByte(2)
      ..write(obj.email)
      ..writeByte(3)
      ..write(obj.phone)
      ..writeByte(4)
      ..write(obj.favs)
      ..writeByte(5)
      ..write(obj.carts)
      ..writeByte(6)
      ..write(obj.token);
  }
}
