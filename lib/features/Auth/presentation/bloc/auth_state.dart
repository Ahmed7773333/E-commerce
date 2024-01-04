// ignore_for_file: must_be_immutable

part of 'auth_bloc.dart';

abstract class AuthState extends Equatable {
  const AuthState();

  @override
  List<Object> get props => [];
}

class AuthInitial extends AuthState {}

class AuthLoading extends AuthState {}

class AuthError extends AuthState {
  Failures l;
  AuthError(this.l);
}

class AuthSuccess extends AuthState {
  UserEntity userEntity;
  AuthSuccess(this.userEntity);
}
