import 'package:phongngo.pokedex/core/authentication/data/models/user_model.dart';

abstract interface class ILocalAuthenticationDatasource {
  void saveUser(UserModel userModel);
  UserModel? getUser();
  void deleteUser();
}
