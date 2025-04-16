import 'package:fpdart/fpdart.dart';
import 'package:phongngo.pokedex/core/authentication/domain/entities/login_entity.dart';
import 'package:phongngo.pokedex/core/authentication/domain/entities/user_entity.dart';

abstract interface class IAuthenticationRepository {
  Future<Either<String, UserEntity>> login(LoginEntity loginEntity);
  UserEntity? getUser();
  Future<bool> logOut();
}
