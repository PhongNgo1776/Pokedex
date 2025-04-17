import 'package:phongngo.pokedex/core/pokemons/data/i_my_pokedex_local_datasource.dart';
import 'package:phongngo.pokedex/core/pokemons/domain/entities/pokemon_entity.dart';
import 'package:phongngo.pokedex/core/pokemons/domain/i_my_pokedex_repository.dart';

class MyPokedexRepositoryImpl implements IMyPokedexRepository {
  final IMyPokedexLocalDatasource _myPokedexLocalDatasource;

  MyPokedexRepositoryImpl(
      {required IMyPokedexLocalDatasource myPokedexLocalDatasource})
      : _myPokedexLocalDatasource = myPokedexLocalDatasource;

  @override
  void savePokemon(PokemonEntity pokemon) {
    _myPokedexLocalDatasource.savePokemon(PokemonEntity.toModel(pokemon));
  }

  @override
  void deletePokemon(int id) {
    _myPokedexLocalDatasource.deletePokemon(id);
  }

  @override
  List<PokemonEntity> getMyPokedex() {
    final models = _myPokedexLocalDatasource.getPokedex();
    return models
        .map((model) => PokemonEntity.fromModel(model, isFavorite: true))
        .toList();
  }
}
