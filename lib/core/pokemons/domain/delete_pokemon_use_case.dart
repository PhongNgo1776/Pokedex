import 'package:phongngo.pokedex/core/pokemons/domain/i_my_pokedex_repository.dart';

class DeletePokemonUseCase {
  final IMyPokedexRepository _pokedexRepository;

  DeletePokemonUseCase({required IMyPokedexRepository pokemonsRepository})
      : _pokedexRepository = pokemonsRepository;
  void execute(int id) {
    return _pokedexRepository.deletePokemon(id);
  }
}
