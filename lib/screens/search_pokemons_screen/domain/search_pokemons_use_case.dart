import 'package:phongngo.pokedex/screens/search_pokemons_screen/domain/entities/pokemon_entity.dart';
import 'package:phongngo.pokedex/screens/search_pokemons_screen/domain/i_pokemons_repository.dart';

class PokemonsUseCase {
  final IPokemonsRepository _pokemonsRepository;

  PokemonsUseCase({required IPokemonsRepository pokemonsRepository})
      : _pokemonsRepository = pokemonsRepository;
  Future<PokemonEntity?> execute({required String idOrName}) async {
    return await _pokemonsRepository.searchPokemon(idOrName: idOrName);
  }
}
