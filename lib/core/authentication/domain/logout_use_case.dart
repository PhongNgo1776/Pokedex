import 'package:phongngo.pokedex/core/authentication/domain/i_authentication_repository.dart';

class LogOutUseCase {
  final IAuthenticationRepository _authenticationRepository;

  LogOutUseCase(this._authenticationRepository);
  Future<void> execute() async => await _authenticationRepository.logOut();
}
