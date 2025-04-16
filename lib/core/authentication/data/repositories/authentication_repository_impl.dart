import 'package:fpdart/fpdart.dart';
import 'package:phongngo.pokedex/core/authentication/data/datasources/i_local_authentication_data_source.dart';
import 'package:phongngo.pokedex/core/authentication/data/datasources/i_remote_authentication_datasource.dart';
import 'package:phongngo.pokedex/core/authentication/domain/entities/login_entity.dart';
import 'package:phongngo.pokedex/core/authentication/domain/entities/user_entity.dart';
import 'package:phongngo.pokedex/core/authentication/domain/i_authentication_repository.dart';

class AuthenticationRepositoryImpl implements IAuthenticationRepository {
  final IRemoteAuthenticationDatasource _remoteAuthenticationDataSource;
  final ILocalAuthenticationDatasource _localAuthenticationDataSource;

  AuthenticationRepositoryImpl(
      {required IRemoteAuthenticationDatasource remoteAuthenticationDataSource,
      required ILocalAuthenticationDatasource localAuthenticationDataSource})
      : _remoteAuthenticationDataSource = remoteAuthenticationDataSource,
        _localAuthenticationDataSource = localAuthenticationDataSource;

  @override
  Future<Either<String, UserEntity>> login(LoginEntity loginEntity) async {
    final result = await _remoteAuthenticationDataSource.login(loginEntity);

    return result.fold(
      (error) => Left(error),
      (userModel) {
        _localAuthenticationDataSource.saveUser(userModel);
        return Right(UserEntity.fromModel(userModel));
      },
    );
  }

  @override
  Future<bool> logOut() async {
    final result = await _remoteAuthenticationDataSource.logOut();
    if (result) {
      _localAuthenticationDataSource.deleteUser();
    }
    return result;
  }

  @override
  UserEntity? getUser() {
    final userModel = _localAuthenticationDataSource.getUser();
    if (userModel == null) {
      return null;
    }
    return UserEntity.fromModel(userModel);
  }
}
