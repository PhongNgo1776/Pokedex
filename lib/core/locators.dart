import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:phongngo.pokedex/constants/network_constants.dart';
import 'package:phongngo.pokedex/core/authentication/data/authentication_repository_impl.dart';
import 'package:phongngo.pokedex/core/authentication/data/i_remote_authentication_data_source.dart';
import 'package:phongngo.pokedex/core/authentication/data/remote_authentication_data_source_impl.dart';
import 'package:phongngo.pokedex/core/authentication/domain/i_authentication_repository.dart';
import 'package:phongngo.pokedex/screens/login_screen/domain/login_use_case.dart';
import 'package:phongngo.pokedex/screens/search_pokemons_screen/data/i_remote_search_pokemons_data_source.dart';
import 'package:phongngo.pokedex/screens/search_pokemons_screen/data/pokemons_repository_impl.dart';
import 'package:phongngo.pokedex/screens/search_pokemons_screen/data/remote_pokemons_data_source_impl.dart';
import 'package:phongngo.pokedex/screens/search_pokemons_screen/domain/i_pokemons_repository.dart';
import 'package:phongngo.pokedex/screens/search_pokemons_screen/domain/search_pokemons_use_case.dart';

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

    // Registering authentication dependencies
    locator.registerSingleton<IRemoteAuthenticationDataSource>(
        RemoteAuthenticationDataSourceImpl(dio: locator<Dio>()));
    locator.registerSingleton<IAuthenticationRepository>(
        AuthenticationRepositoryImpl(
            remoteAuthenticationDataSource:
                locator<IRemoteAuthenticationDataSource>()));
    locator.registerLazySingleton<LoginUseCase>(
        () => LoginUseCase(locator<IAuthenticationRepository>()));

    // Registering searh_pokemons_screen dependencies
    locator.registerLazySingleton<IRemotePokemonsDataSource>(
        () => RemotePokemonsDataSourceImpl(dio: locator<Dio>()));
    locator.registerLazySingleton<IPokemonsRepository>(
        () => PokemonsRepositoryImpl(remotePokemonsDataSource: locator()));
    locator.registerLazySingleton<PokemonsUseCase>(
        () => PokemonsUseCase(pokemonsRepository: locator()));
  }
}
