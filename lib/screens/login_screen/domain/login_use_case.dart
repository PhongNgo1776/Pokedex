import 'package:fpdart/fpdart.dart';
import 'package:phongngo.pokedex/core/authentication/domain/entities/login_entity.dart';
import 'package:phongngo.pokedex/core/authentication/domain/entities/user_entity.dart';
import 'package:phongngo.pokedex/core/authentication/domain/i_authentication_repository.dart';

class LoginUseCase {
  final IAuthenticationRepository _authenticationRepository;

  LoginUseCase(this._authenticationRepository);

  Future<Either<String, UserEntity>> execute(
      {required String userName, required String password}) async {
    return await _authenticationRepository
        .login(LoginEntity(userName: userName, password: password));
  }
}
