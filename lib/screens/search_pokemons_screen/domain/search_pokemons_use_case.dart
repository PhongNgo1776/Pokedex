import 'package:phongngo.pokedex/core/pokemons/domain/entities/pokemon_entity.dart';
import 'package:phongngo.pokedex/screens/search_pokemons_screen/domain/i_search_pokemons_repository.dart';

class SearchPokemonUseCase {
  final ISearchPokemonsRepository _pokemonsRepository;

  SearchPokemonUseCase({required ISearchPokemonsRepository pokemonsRepository})
      : _pokemonsRepository = pokemonsRepository;
  Future<PokemonEntity?> execute({required String idOrName}) async {
    return await _pokemonsRepository.searchPokemon(idOrName: idOrName);
  }
}
