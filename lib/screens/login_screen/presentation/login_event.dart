import 'package:equatable/equatable.dart';

abstract class AuthenticationEvent extends Equatable {}

class LoginUsernameChanged extends AuthenticationEvent {
  final String? username;

  LoginUsernameChanged({this.username});

  @override
  List<Object?> get props => [username];
}

class LoginPasswordChanged extends AuthenticationEvent {
  final String? password;

  LoginPasswordChanged({this.password});

  @override
  List<Object?> get props => [password];
}

class LoginSubmitted extends AuthenticationEvent {
  @override
  List<Object?> get props => [];
}

class LogoutEvent extends AuthenticationEvent {
  @override
  List<Object?> get props => [];
}
