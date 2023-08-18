part of 'postapi_bloc.dart';

abstract class LoginEvent {}

class LoginUserNameChanged extends LoginEvent {
  final String usename;

  LoginUserNameChanged(this.usename);
}

class LoginPasswordChanged extends LoginEvent {
  final String password;

  LoginPasswordChanged(this.password);
}

class LoginSubmitted extends LoginEvent {}
