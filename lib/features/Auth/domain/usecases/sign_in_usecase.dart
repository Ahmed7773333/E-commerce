import 'package:dartz/dartz.dart';

import '../../../../core/eror/failuers.dart';
import '../entities/user_entity.dart';
import '../repositories/auth_repo.dart';

class SignInUseCase {
  AuthRepo authRepo;

  SignInUseCase(this.authRepo);

  Future<Either<Failures, UserEntity>> call(String email, String password) =>
      authRepo.signIn(email, password);
}
