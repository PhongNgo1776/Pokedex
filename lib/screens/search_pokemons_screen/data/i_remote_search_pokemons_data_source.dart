import 'package:phongngo.pokedex/screens/search_pokemons_screen/data/models/pokemon_model.dart';

abstract interface class IRemotePokemonsDataSource {
  Future<PokemonModel?> searchPokemon({required String idOrName});
}
