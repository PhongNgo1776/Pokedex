import 'dart:math';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:phongngo.pokedex/constants/network_constants.dart';
import 'package:phongngo.pokedex/core/pokemons/data/models/pokemon_model.dart';
import 'package:phongngo.pokedex/screens/search_pokemons_screen/data/i_remote_search_pokemons_data_source.dart';

const maxPokemonCount = 300;

class RemoteSearchPokemonsDataSourceImpl
    implements IRemoteSearchPokemonsDataSource {
  final Dio dio;

  RemoteSearchPokemonsDataSourceImpl({required this.dio});

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

  @override
  Future<List<PokemonModel>> getRandomPokemons() {
    final randomIds = getRandomIds();
    final futures = randomIds.map((id) async {
      try {
        final response = await dio.get('$baseUrl/ability/$id');
        if (response.statusCode == 200) {
          // Parse the response body and return the pokemons
          final model =
              PokemonModelUtils.fromJson(response.data as Map<String, dynamic>);
          return model;
        } else {
          throw Exception('Failed to load pokemons');
        }
      } catch (e) {
        debugPrint('$e');
        return null;
      }
    });
    return Future.wait(futures).then((models) {
      // Filter out null values
      return models.whereType<PokemonModel>().toList();
    });
  }

  List<int> getRandomIds() {
    final random = Random();
    final ids = <int>[];
    while (ids.length < 10) {
      final id = random.nextInt(maxPokemonCount);
      if (!ids.contains(id)) {
        ids.add(id);
      }
    }
    return ids;
  }
}
