import 'package:phongngo.pokedex/core/authentication/data/datasources/i_local_authentication_data_source.dart';
import 'package:phongngo.pokedex/core/authentication/data/models/user_model.dart';
import 'package:phongngo.pokedex/core/realm_db.dart';

class LocalAuthenticationLocalDatasourceImpl
    implements ILocalAuthenticationDatasource {
  final RealmDB _realmDB;

  LocalAuthenticationLocalDatasourceImpl({
    required RealmDB realmDB,
  }) : _realmDB = realmDB;

  @override
  void deleteUser() {
    _realmDB.deleteAllModels<UserModel>();
  }

  @override
  UserModel? getUser() {
    return _realmDB.getAllModels<UserModel>().firstOrNull;
  }

  @override
  void saveUser(UserModel userModel) {
    _realmDB.addModel(userModel);
  }
}
