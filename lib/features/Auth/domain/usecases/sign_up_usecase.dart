import 'package:dartz/dartz.dart';

import '../../../../core/eror/failuers.dart';
import '../entities/user_entity.dart';
import '../repositories/auth_repo.dart';

class SignUpUseCase {
  AuthRepo authRepo;

  SignUpUseCase(this.authRepo);

  Future<Either<Failures, UserEntity>> call(
          String email, String password, String name, String phone) =>
      authRepo.signUP(email, password, name, phone);
}
