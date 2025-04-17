import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:phongngo.pokedex/constants/network_constants.dart';
import 'package:phongngo.pokedex/screens/search_pokemons_screen/data/i_remote_search_pokemons_data_source.dart';
import 'package:phongngo.pokedex/screens/search_pokemons_screen/data/models/pokemon_model.dart';

class RemotePokemonsDataSourceImpl implements IRemotePokemonsDataSource {
  final Dio dio;

  RemotePokemonsDataSourceImpl({required this.dio});

  @override
  Future<PokemonModel?> searchPokemon({required String idOrName}) async {
    try {
      final response = await dio.get('$baseUrl/ability/$idOrName');
      if (response.statusCode == 200) {
        // Parse the response body and return the pokemons
        // For now, returning an empty list
        final model = response.data != null
            ? PokemonModelUtils.fromJson(response.data as Map<String, dynamic>)
            : null;

        return model;
      } else {
        throw Exception('Failed to load pokemons');
      }
    } catch (e) {
      debugPrint('$e');
      return null;
    }
  }
}
