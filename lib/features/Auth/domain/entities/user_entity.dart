// ignore_for_file: must_be_immutable

import 'package:equatable/equatable.dart';

class UserEntity extends Equatable {
  UserEntity({
    this.user,
    this.token,
  });

  UserDataEntity? user;
  String? token;

  @override
  List<Object?> get props => [user, token];
}

class UserDataEntity extends Equatable {
  UserDataEntity({
    this.name,
    this.email,
  });

  String? name;
  String? email;

  @override
  List<Object?> get props => [name, email];
}
