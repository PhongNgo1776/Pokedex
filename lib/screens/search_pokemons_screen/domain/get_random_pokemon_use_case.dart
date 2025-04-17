import 'package:phongngo.pokedex/core/pokemons/domain/entities/pokemon_entity.dart';
import 'package:phongngo.pokedex/screens/search_pokemons_screen/domain/i_search_pokemons_repository.dart';

class GetRandomPokemonsUseCase {
  final ISearchPokemonsRepository _pokemonsRepository;

  GetRandomPokemonsUseCase(
      {required ISearchPokemonsRepository pokemonsRepository})
      : _pokemonsRepository = pokemonsRepository;
  Future<List<PokemonEntity>> execute() async {
    return await _pokemonsRepository.getRandomPokemons();
  }
}
