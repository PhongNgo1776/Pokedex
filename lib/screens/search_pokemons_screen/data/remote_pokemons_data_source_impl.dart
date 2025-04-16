import 'package:dio/dio.dart';
import 'package:phongngo.pokedex/constants/network_constants.dart';
import 'package:phongngo.pokedex/screens/search_pokemons_screen/data/i_remote_search_pokemons_data_source.dart';
import 'package:phongngo.pokedex/screens/search_pokemons_screen/data/pokemon_model.dart';

class RemotePokemonsDataSourceImpl implements IRemotePokemonsDataSource {
  final Dio dio;

  RemotePokemonsDataSourceImpl({required this.dio});

  @override
  Future<List<PokemonModel>> searchPokemons({String? id, String? name}) async {
    final response = await dio.get(baseUrl);
    if (response.statusCode == 200) {
      // Parse the response body and return the pokemons
      // For now, returning an empty list
      return response.data;
    } else {
      throw Exception('Failed to load pokemons');
    }
  }
}
