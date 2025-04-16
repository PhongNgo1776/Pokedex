import 'package:phongngo.pokedex/core/authentication/domain/entities/user_entity.dart';
import 'package:phongngo.pokedex/core/authentication/domain/i_authentication_repository.dart';

class LoadUserUseCase {
  final IAuthenticationRepository _authenticationRepository;

  LoadUserUseCase(this._authenticationRepository);
  UserEntity? execute() => _authenticationRepository.getUser();
}
