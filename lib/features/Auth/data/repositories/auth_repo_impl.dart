import 'package:dartz/dartz.dart';
import 'package:shop_app/core/eror/failuers.dart';
import 'package:shop_app/features/Auth/data/datasources/auth_remote_ds.dart';
import 'package:shop_app/features/Auth/domain/entities/user_entity.dart';
import 'package:shop_app/features/Auth/domain/repositories/auth_repo.dart';

class AuthRepoImpl implements AuthRepo {
  AuthRmoteDs authRmoteDs;

  AuthRepoImpl(this.authRmoteDs);

  @override
  Future<Either<Failures, UserEntity>> signIn(String email, String password) {
    return authRmoteDs.signIn(email, password);
  }

  @override
  Future<Either<Failures, UserEntity>> signUP(
      String email, String password, String name, String phone) {
    return authRmoteDs.signUP(email, password, name, phone);
  }
}
