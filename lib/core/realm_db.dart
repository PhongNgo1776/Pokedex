import 'package:phongngo.pokedex/core/authentication/data/models/user_model.dart';
import 'package:phongngo.pokedex/core/pokemons/data/models/pokemon_model.dart';
import 'package:realm/realm.dart';

class RealmDB {
  RealmDB() {
    initialize();
  }
  late Realm realm;
  void initialize() {
    realm = Realm(Configuration.local([
      UserModel.schema,
      PokemonModel.schema,
      PokemonGenerationModel.schema,
      PokemonEffectEntryModel.schema,
      PokemonEffectEntryLanguageModel.schema,
    ]));
  }

  List<T> getAllModels<T extends RealmObject>() => realm.all<T>().toList();
  void deleteModel<T extends RealmObject>(int id) {
    final managedObject = realm.find<T>(id);

    if (managedObject != null) {
      realm.write(() {
        realm.delete(managedObject);
      });
    }
  }

  void addOrUpdateModel<T extends RealmObject>(T model, Object id) {
    final managedObject = realm.find<T>(id);

    if (managedObject != null) {
      realm.write(() {
        realm.delete(managedObject);
      });
    }

    realm.write(() => realm.add(model));
  }

  void updateModel<T extends RealmObject>(T model) {
    realm.write(() => realm.add(model, update: true));
  }

  void updateAll<T extends RealmObject>(List<T> models) {
    realm.write(() => realm.deleteAll());
    realm.write(() => realm.addAll(models));
  }

  void deleteAllModels<T extends RealmObject>() {
    realm.write(() => realm.deleteAll<T>());
  }
}
