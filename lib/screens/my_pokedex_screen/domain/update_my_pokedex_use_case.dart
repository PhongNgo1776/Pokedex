import 'package:phongngo.pokedex/core/pokemons/domain/entities/pokemon_entity.dart';
import 'package:phongngo.pokedex/core/pokemons/domain/i_my_pokedex_repository.dart';

class UpdateMyPokedexUseCase {
  final IMyPokedexRepository _myPokedexRepository;

  UpdateMyPokedexUseCase({required IMyPokedexRepository myPokedexRepository})
      : _myPokedexRepository = myPokedexRepository;
  void execute(List<PokemonEntity> pokedex) {
    return _myPokedexRepository.updatePokedex(pokedex);
  }
}
