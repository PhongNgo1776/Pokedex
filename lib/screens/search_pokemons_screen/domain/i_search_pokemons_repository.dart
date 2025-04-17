import 'package:phongngo.pokedex/core/pokemons/domain/entities/pokemon_entity.dart';

abstract interface class ISearchPokemonsRepository {
  Future<PokemonEntity?> searchPokemon({required String idOrName});
  Future<List<PokemonEntity>> getRandomPokemons();
}
