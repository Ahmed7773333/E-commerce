import '../../domain/entities/user_entity.dart';

// ignore: must_be_immutable
class UserModel extends UserEntity {
  UserModel({
    this.message,
    super.user,
    super.token,
  });

  UserModel.fromJson(dynamic json) {
    message = json['message'];
    user = json['user'] != null ? User.fromJson(json['user']) : null;
    token = json['token'];
  }

  String? message;

  @override
  List<Object?> get props => [super.props, message];
}

// ignore: must_be_immutable
class User extends UserDataEntity {
  User({
    super.name,
    super.email,
    this.role,
  });

  User.fromJson(dynamic json) {
    name = json['name'];
    email = json['email'];
    role = json['role'];
  }

  String? role;

  @override
  List<Object?> get props => [super.props, role];
}
