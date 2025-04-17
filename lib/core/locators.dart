import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:phongngo.pokedex/constants/network_constants.dart';
import 'package:phongngo.pokedex/core/authentication/data/datasources/i_local_authentication_data_source.dart';
import 'package:phongngo.pokedex/core/authentication/data/datasources/i_remote_authentication_datasource.dart';
import 'package:phongngo.pokedex/core/authentication/data/datasources/local_authentication_data_source_impl.dart';
import 'package:phongngo.pokedex/core/authentication/data/datasources/remote_authentication_data_source_impl.dart';
import 'package:phongngo.pokedex/core/authentication/data/repositories/authentication_repository_impl.dart';
import 'package:phongngo.pokedex/core/authentication/domain/i_authentication_repository.dart';
import 'package:phongngo.pokedex/core/authentication/domain/load_user_use_case.dart';
import 'package:phongngo.pokedex/core/authentication/domain/logout_use_case.dart';
import 'package:phongngo.pokedex/core/realm_db.dart';
import 'package:phongngo.pokedex/screens/login_screen/domain/login_use_case.dart';
import 'package:phongngo.pokedex/screens/search_pokemons_screen/data/i_remote_search_pokemons_data_source.dart';
import 'package:phongngo.pokedex/screens/search_pokemons_screen/data/pokemons_repository_impl.dart';
import 'package:phongngo.pokedex/screens/search_pokemons_screen/data/remote_pokemons_data_source_impl.dart';
import 'package:phongngo.pokedex/screens/search_pokemons_screen/domain/get_random_pokemon_use_case.dart';
import 'package:phongngo.pokedex/screens/search_pokemons_screen/domain/i_pokemons_repository.dart';
import 'package:phongngo.pokedex/screens/search_pokemons_screen/domain/search_pokemons_use_case.dart';

class Locators {
  static void initialize() {
    final locator = GetIt.instance;
    // Registering RealmDB
    locator.registerSingleton<RealmDB>(RealmDB());
    // Registering Dio
    locator.registerSingleton<Dio>(Dio(
      BaseOptions(
        baseUrl: baseUrl,
        sendTimeout: Duration(seconds: 30),
        connectTimeout: Duration(seconds: 30),
        receiveTimeout: Duration(seconds: 30),
      ),
    ));

    // Registering authentication dependencies
    locator.registerSingleton<IRemoteAuthenticationDatasource>(
        RemoteAuthenticationDataSourceImpl(dio: locator<Dio>()));
    locator.registerSingleton<ILocalAuthenticationDatasource>(
        LocalAuthenticationLocalDatasourceImpl(realmDB: locator<RealmDB>()));
    locator.registerSingleton<IAuthenticationRepository>(
      AuthenticationRepositoryImpl(
          localAuthenticationDataSource:
              locator<ILocalAuthenticationDatasource>(),
          remoteAuthenticationDataSource:
              locator<IRemoteAuthenticationDatasource>()),
    );
    locator.registerLazySingleton<LoginUseCase>(
        () => LoginUseCase(locator<IAuthenticationRepository>()));
    locator.registerLazySingleton<LoadUserUseCase>(
        () => LoadUserUseCase(locator<IAuthenticationRepository>()));
    locator.registerLazySingleton<LogOutUseCase>(
        () => LogOutUseCase(locator<IAuthenticationRepository>()));

    // Registering searh_pokemons_screen dependencies
    locator.registerLazySingleton<IRemotePokemonsDataSource>(
        () => RemotePokemonsDataSourceImpl(dio: locator<Dio>()));
    locator.registerLazySingleton<IPokemonsRepository>(
        () => PokemonsRepositoryImpl(remotePokemonsDataSource: locator()));
    locator.registerLazySingleton<SearchPokemonUseCase>(
        () => SearchPokemonUseCase(pokemonsRepository: locator()));
    locator.registerLazySingleton<GetRandomPokemonsUseCase>(
        () => GetRandomPokemonsUseCase(pokemonsRepository: locator()));
  }
}
