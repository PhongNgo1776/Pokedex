import 'package:fpdart/fpdart.dart';
import 'package:phongngo.pokedex/core/authentication/data/user_model.dart';
import 'package:phongngo.pokedex/core/authentication/domain/entities/login_entity.dart';

abstract interface class IRemoteAuthenticationDataSource {
  Future<Either<String, UserModel>> login(LoginEntity loginEntity);
  Future<bool> logOut();
}
