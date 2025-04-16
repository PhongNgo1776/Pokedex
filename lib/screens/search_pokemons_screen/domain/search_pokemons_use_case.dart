import 'package:phongngo.pokedex/screens/search_pokemons_screen/domain/entities/pokemon_entity.dart';
import 'package:phongngo.pokedex/screens/search_pokemons_screen/domain/i_pokemons_repository.dart';

class PokemonsUseCase {
  final IPokemonsRepository _pokemonsRepository;

  PokemonsUseCase({required IPokemonsRepository pokemonsRepository})
      : _pokemonsRepository = pokemonsRepository;
  Future<List<PokemonEntity>> execute({String? id, String? name}) async {
    return await _pokemonsRepository.searchPokemons(id: id, name: name);
  }
}
