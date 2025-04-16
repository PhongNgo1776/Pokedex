import 'package:equatable/equatable.dart';
import 'package:phongngo.pokedex/core/authentication/domain/entities/user_entity.dart';

class AuthenticationEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

class LogoutEvent extends AuthenticationEvent {
  @override
  List<Object?> get props => [];
}

class AuthenticationLoggedIn extends AuthenticationEvent {
  final UserEntity? userEntity;

  AuthenticationLoggedIn({this.userEntity});

  @override
  List<Object?> get props => [userEntity];
}
