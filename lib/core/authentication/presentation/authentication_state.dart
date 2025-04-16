import 'package:equatable/equatable.dart';
import 'package:phongngo.pokedex/core/authentication/domain/entities/user_entity.dart';

class AuthenticationState extends Equatable {
  final UserEntity? user;

  const AuthenticationState({this.user});

  AuthenticationState copyWith({
    UserEntity? user,
  }) {
    return AuthenticationState(
      user: user ?? this.user,
    );
  }

  @override
  List<Object?> get props => [user];
}
