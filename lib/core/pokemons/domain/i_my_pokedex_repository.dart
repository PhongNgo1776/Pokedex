import 'package:phongngo.pokedex/core/pokemons/domain/entities/pokemon_entity.dart';

abstract interface class IMyPokedexRepository {
  void savePokemon(PokemonEntity pokemon);
  void deletePokemon(int id);
  List<PokemonEntity> getMyPokedex();
  void updatePokedex(List<PokemonEntity> pokedex);
}
