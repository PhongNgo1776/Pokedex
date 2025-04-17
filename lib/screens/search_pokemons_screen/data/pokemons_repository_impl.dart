import 'package:phongngo.pokedex/screens/search_pokemons_screen/data/i_remote_search_pokemons_data_source.dart';
import 'package:phongngo.pokedex/screens/search_pokemons_screen/domain/entities/pokemon_entity.dart';
import 'package:phongngo.pokedex/screens/search_pokemons_screen/domain/i_pokemons_repository.dart';

class PokemonsRepositoryImpl implements IPokemonsRepository {
  final IRemotePokemonsDataSource _remotePokemonsDataSource;

  PokemonsRepositoryImpl(
      {required IRemotePokemonsDataSource remotePokemonsDataSource})
      : _remotePokemonsDataSource = remotePokemonsDataSource;

  @override
  Future<PokemonEntity?> searchPokemon({required String idOrName}) async {
    final model =
        await _remotePokemonsDataSource.searchPokemon(idOrName: idOrName);
    return model != null ? PokemonEntity.fromModel(model) : null;
  }

  @override
  Future<List<PokemonEntity>> getRandomPokemons() async {
    final models = await _remotePokemonsDataSource.getRandomPokemons();
    final entities =
        models.map((model) => PokemonEntity.fromModel(model)).toList();

    return entities;
  }
}
