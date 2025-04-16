import 'package:phongngo.pokedex/core/authentication/data/models/user_model.dart';
import 'package:realm/realm.dart';

class RealmDB {
  RealmDB() {
    initialize();
  }
  late Realm realm;
  void initialize() {
    realm = Realm(Configuration.local([UserModel.schema]));
  }

  List<T> getAllModels<T extends RealmObject>() => realm.all<T>().toList();
  void deleteModel<T extends RealmObject>(T model) {
    realm.write(() => realm.delete(model));
  }

  void addModel<T extends RealmObject>(T model) {
    realm.write(() => realm.add(model));
  }

  void updateModel<T extends RealmObject>(T model) {
    realm.write(() => realm.add(model, update: true));
  }

  void deleteAllModels<T extends RealmObject>() {
    realm.write(() => realm.deleteAll<T>());
  }
}
