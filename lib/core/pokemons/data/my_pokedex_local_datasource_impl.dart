import 'package:phongngo.pokedex/core/pokemons/data/i_my_pokedex_local_datasource.dart';
import 'package:phongngo.pokedex/core/pokemons/data/models/pokemon_model.dart';
import 'package:phongngo.pokedex/core/realm_db.dart';

class MyPokedexLocalDatasourceImpl implements IMyPokedexLocalDatasource {
  final RealmDB _realmDB;

  MyPokedexLocalDatasourceImpl({
    required RealmDB realmDB,
  }) : _realmDB = realmDB;

  @override
  void savePokemon(PokemonModel model) {
    _realmDB.addOrUpdateModel<PokemonModel>(model, model.id);
  }

  @override
  void deletePokemon(int id) {
    _realmDB.deleteModel<PokemonModel>(id);
  }

  @override
  List<PokemonModel> getPokedex() {
    final saveModels = _realmDB.getAllModels<PokemonModel>();
    return saveModels;
  }

  @override
  void updatePokedex(List<PokemonModel> pokedex) {
    _realmDB.updateAll<PokemonModel>(pokedex);
  }
}
