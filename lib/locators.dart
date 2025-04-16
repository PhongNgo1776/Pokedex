import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:phongngo.pokedex/constants/network_constants.dart';
import 'package:phongngo.pokedex/screens/search_pokemons/data/i_remote_search_pokemons_data_source.dart';
import 'package:phongngo.pokedex/screens/search_pokemons/data/pokemons_repository_impl.dart';
import 'package:phongngo.pokedex/screens/search_pokemons/data/remote_pokemons_data_source_impl.dart';
import 'package:phongngo.pokedex/screens/search_pokemons/domain/i_pokemons_repository.dart';
import 'package:phongngo.pokedex/screens/search_pokemons/domain/search_pokemons_use_case.dart';

class Locators {
  static void initialize() {
    final locator = GetIt.instance;
    locator.registerSingleton<Dio>(Dio(
      BaseOptions(
        baseUrl: baseUrl,
        sendTimeout: Duration(seconds: 5),
        connectTimeout: Duration(seconds: 5),
        receiveTimeout: Duration(seconds: 3),
      ),
    ));
    locator.registerLazySingleton<IRemotePokemonsDataSource>(
        () => RemotePokemonsDataSourceImpl(dio: locator<Dio>()));
    locator.registerLazySingleton<IPokemonsRepository>(
        () => PokemonsRepositoryImpl(remotePokemonsDataSource: locator()));
    locator.registerLazySingleton<PokemonsUseCase>(
        () => PokemonsUseCase(pokemonsRepository: locator()));
  }
}
