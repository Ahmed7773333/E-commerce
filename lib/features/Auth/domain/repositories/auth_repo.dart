import 'package:dartz/dartz.dart';
import 'package:shop_app/core/eror/failuers.dart';
import 'package:shop_app/features/Auth/domain/entities/user_entity.dart';

abstract class AuthRepo {
  Future<Either<Failures, UserEntity>> signIn(String email, String password);
  Future<Either<Failures, UserEntity>> signUP(
      String email, String password, String name, String phone);
}
