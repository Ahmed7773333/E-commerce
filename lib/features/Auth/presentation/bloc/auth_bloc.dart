import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_app/core/eror/failuers.dart';
import 'package:shop_app/features/Auth/domain/entities/user_entity.dart';
import 'package:shop_app/features/Auth/domain/usecases/sign_in_usecase.dart';
import 'package:shop_app/features/Auth/domain/usecases/sign_up_usecase.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  static AuthBloc get(context) => BlocProvider.of(context);
  SignInUseCase signInUseCase;
  SignUpUseCase signUpUseCase;
  AuthBloc(this.signInUseCase, this.signUpUseCase) : super(AuthInitial()) {
    on<AuthEvent>((event, emit) async {
      if (event is SignInEvent) {
        emit(AuthLoading());
        var result = await signInUseCase(event.email, event.password);
        result.fold((l) {
          emit(AuthError(l));
        }, (r) {
          emit(AuthSuccess(r));
        });
      } else if (event is SignUpEvent) {
        emit(AuthLoading());
        var result = await signUpUseCase(
            event.email, event.password, event.name, event.phone);
        result.fold((l) {
          emit(AuthError(l));
        }, (r) {
          emit(AuthSuccess(r));
        });
      }
    });
  }
}
