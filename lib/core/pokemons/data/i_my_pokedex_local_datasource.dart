import 'package:phongngo.pokedex/core/pokemons/data/models/pokemon_model.dart';

abstract interface class IMyPokedexLocalDatasource {
  void savePokemon(PokemonModel userModel);
  List<PokemonModel> getPokedex();
  void deletePokemon(int id);
  void updatePokedex(List<PokemonModel> pokedex);
}
