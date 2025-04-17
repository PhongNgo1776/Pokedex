import 'package:phongngo.pokedex/core/pokemons/domain/entities/pokemon_entity.dart';
import 'package:phongngo.pokedex/core/pokemons/domain/i_my_pokedex_repository.dart';

class SavePokemonUseCase {
  final IMyPokedexRepository _pokemonsRepository;

  SavePokemonUseCase({required IMyPokedexRepository pokemonsRepository})
      : _pokemonsRepository = pokemonsRepository;
  void execute(PokemonEntity pokemon) {
    return _pokemonsRepository.savePokemon(pokemon);
  }
}
