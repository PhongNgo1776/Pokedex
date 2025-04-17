import 'package:phongngo.pokedex/core/pokemons/domain/entities/pokemon_entity.dart';
import 'package:phongngo.pokedex/core/pokemons/domain/i_my_pokedex_repository.dart';

class GetMyPokedexUseCase {
  final IMyPokedexRepository _iMyPokedexRepository;

  GetMyPokedexUseCase({required IMyPokedexRepository myPokedexRepository})
      : _iMyPokedexRepository = myPokedexRepository;
  List<PokemonEntity> execute() {
    return _iMyPokedexRepository.getMyPokedex();
  }
}
