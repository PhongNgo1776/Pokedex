import 'package:phongngo.pokedex/core/pokemons/data/models/pokemon_model.dart';

abstract interface class IRemoteSearchPokemonsDataSource {
  Future<PokemonModel?> searchPokemon({required String idOrName});
  Future<List<PokemonModel>> getRandomPokemons();
}
