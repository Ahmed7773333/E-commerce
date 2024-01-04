// ignore_for_file: must_be_immutable

part of 'auth_bloc.dart';

abstract class AuthEvent extends Equatable {
  const AuthEvent();

  @override
  List<Object> get props => [];
}

class SignInEvent extends AuthEvent {
  String email;
  String password;
  SignInEvent(this.email, this.password);
}

class SignUpEvent extends AuthEvent {
  String email;
  String password;
  String phone;
  String name;

  SignUpEvent(this.email, this.password, this.name, this.phone);
}
