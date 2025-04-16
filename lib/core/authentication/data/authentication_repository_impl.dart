import 'package:fpdart/fpdart.dart';
import 'package:phongngo.pokedex/core/authentication/data/i_remote_authentication_data_source.dart';
import 'package:phongngo.pokedex/core/authentication/domain/entities/login_entity.dart';
import 'package:phongngo.pokedex/core/authentication/domain/entities/user_entity.dart';
import 'package:phongngo.pokedex/core/authentication/domain/i_authentication_repository.dart';

class AuthenticationRepositoryImpl implements IAuthenticationRepository {
  final IRemoteAuthenticationDataSource _remoteAuthenticationDataSource;

  AuthenticationRepositoryImpl(
      {required IRemoteAuthenticationDataSource remoteAuthenticationDataSource})
      : _remoteAuthenticationDataSource = remoteAuthenticationDataSource;

  @override
  Future<Either<String, UserEntity>> login(LoginEntity loginEntity) async {
    final result = await _remoteAuthenticationDataSource.login(loginEntity);
    return result.fold(
      (error) => Left(error),
      (userModel) {
        return Right(UserEntity.fromModel(userModel));
      },
    );
  }

  @override
  Future<bool> logOut() async {
    return await _remoteAuthenticationDataSource.logOut();
  }
}
