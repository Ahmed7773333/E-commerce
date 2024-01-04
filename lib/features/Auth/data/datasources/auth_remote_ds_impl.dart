import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:shop_app/features/Auth/data/datasources/auth_remote_ds.dart';
import 'package:shop_app/features/Auth/domain/entities/user_entity.dart';

import '../../../../core/api/api_manager.dart';
import '../../../../core/api/end_points.dart';
import '../../../../core/eror/failuers.dart';
import '../models/user_model.dart';

class AuthRemoteDSImpl implements AuthRmoteDs {
  ApiManager apiManager;

  AuthRemoteDSImpl(this.apiManager);

  @override
  Future<Either<Failures, UserModel>> signIn(
      String email, String password) async {
    try {
      Response response = await apiManager.postData(EndPoints.login,
          body: {"email": email, "password": password});

      UserModel userModel = UserModel.fromJson(response.data);
      return Right(userModel);
    } catch (e) {
      return Left(RemoteFailure(message: e.toString()));
    }
  }

  @override
  Future<Either<Failures, UserEntity>> signUP(
      String email, String password, String name, String phone) async {
    try {
      Response response = await apiManager.postData(EndPoints.signup, body: {
        "email": email,
        "password": password,
        "rePassword": password,
        "name": name,
        "phone": phone
      });

      UserModel userModel = UserModel.fromJson(response.data);
      return Right(userModel);
    } catch (e) {
      return Left(RemoteFailure(message: e.toString()));
    }
  }
}
