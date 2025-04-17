import 'package:phongngo.pokedex/screens/search_pokemons_screen/domain/entities/pokemon_entity.dart';
import 'package:phongngo.pokedex/screens/search_pokemons_screen/domain/i_pokemons_repository.dart';

class GetRandomPokemonsUseCase {
  final IPokemonsRepository _pokemonsRepository;

  GetRandomPokemonsUseCase({required IPokemonsRepository pokemonsRepository})
      : _pokemonsRepository = pokemonsRepository;
  Future<List<PokemonEntity>> execute() async {
    return await _pokemonsRepository.getRandomPokemons();
  }
}
