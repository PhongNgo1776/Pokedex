import 'package:phongngo.pokedex/screens/search_pokemons_screen/domain/entities/pokemon_entity.dart';

abstract interface class IPokemonsRepository {
  Future<PokemonEntity?> searchPokemon({required String idOrName});
}
