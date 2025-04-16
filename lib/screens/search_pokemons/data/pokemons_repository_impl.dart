import 'package:phongngo.pokedex/screens/search_pokemons/data/i_remote_search_pokemons_data_source.dart';
import 'package:phongngo.pokedex/screens/search_pokemons/domain/entities/pokemon_entity.dart';
import 'package:phongngo.pokedex/screens/search_pokemons/domain/i_pokemons_repository.dart';

class PokemonsRepositoryImpl implements IPokemonsRepository {
  final IRemotePokemonsDataSource _remotePokemonsDataSource;

  PokemonsRepositoryImpl(
      {required IRemotePokemonsDataSource remotePokemonsDataSource})
      : _remotePokemonsDataSource = remotePokemonsDataSource;

  @override
  Future<List<PokemonEntity>> searchPokemons({String? id, String? name}) async {
    final response =
        await _remotePokemonsDataSource.searchPokemons(id: id, name: name);
    if (response.isNotEmpty) {
      // Parse the response and convert it to a list of PokemonEntity
      // For now, returning an empty list
      return [];
    } else {
      throw Exception('Failed to load pokemons');
    }
  }
}
