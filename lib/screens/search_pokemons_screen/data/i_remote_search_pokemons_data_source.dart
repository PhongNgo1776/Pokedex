import 'package:phongngo.pokedex/screens/search_pokemons_screen/data/pokemon_model.dart';

abstract interface class IRemotePokemonsDataSource {
  Future<List<PokemonModel>> searchPokemons({String? id, String? name});
}
