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
import 'package:phongngo.pokedex/core/pokemons/data/i_my_pokedex_local_datasource.dart';
import 'package:phongngo.pokedex/core/pokemons/data/my_pokedex_local_datasource_impl.dart';
import 'package:phongngo.pokedex/core/pokemons/data/my_pokedex_repository_impl.dart';
import 'package:phongngo.pokedex/core/pokemons/domain/delete_pokemon_use_case.dart';
import 'package:phongngo.pokedex/core/pokemons/domain/i_my_pokedex_repository.dart';
import 'package:phongngo.pokedex/core/pokemons/domain/save_pokemon_use_case.dart';
import 'package:phongngo.pokedex/core/realm_db.dart';
import 'package:phongngo.pokedex/screens/login_screen/domain/login_use_case.dart';
import 'package:phongngo.pokedex/screens/my_pokedex_screen/domain/get_my_pokedex_use_case.dart';
import 'package:phongngo.pokedex/screens/my_pokedex_screen/domain/update_my_pokedex_use_case.dart';
import 'package:phongngo.pokedex/screens/search_pokemons_screen/data/i_remote_search_pokemons_data_source.dart';
import 'package:phongngo.pokedex/screens/search_pokemons_screen/data/remote_search_pokemons_data_source_impl.dart';
import 'package:phongngo.pokedex/screens/search_pokemons_screen/data/search_pokemons_repository_impl.dart';
import 'package:phongngo.pokedex/screens/search_pokemons_screen/domain/get_random_pokemon_use_case.dart';
import 'package:phongngo.pokedex/screens/search_pokemons_screen/domain/i_search_pokemons_repository.dart';
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
        RemoteAuthenticationDataSourceImpl());
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

    // Registering pokemon dependencies
    locator.registerLazySingleton<IMyPokedexLocalDatasource>(
        () => MyPokedexLocalDatasourceImpl(realmDB: locator<RealmDB>()));
    locator.registerLazySingleton<IRemoteSearchPokemonsDataSource>(
        () => RemoteSearchPokemonsDataSourceImpl(dio: locator<Dio>()));
    locator.registerLazySingleton<IMyPokedexRepository>(() =>
        MyPokedexRepositoryImpl(
            myPokedexLocalDatasource: locator<IMyPokedexLocalDatasource>()));
    locator.registerLazySingleton<ISearchPokemonsRepository>(() =>
        SearchPokemonsRepositoryImpl(remotePokemonsDataSource: locator()));
    locator.registerLazySingleton<SearchPokemonUseCase>(
        () => SearchPokemonUseCase(pokemonsRepository: locator()));
    locator.registerLazySingleton<GetRandomPokemonsUseCase>(
        () => GetRandomPokemonsUseCase(pokemonsRepository: locator()));
    locator.registerLazySingleton<SavePokemonUseCase>(
        () => SavePokemonUseCase(pokemonsRepository: locator()));
    locator.registerLazySingleton<DeletePokemonUseCase>(
        () => DeletePokemonUseCase(pokemonsRepository: locator()));
    locator.registerLazySingleton<GetMyPokedexUseCase>(
        () => GetMyPokedexUseCase(myPokedexRepository: locator()));
    locator.registerLazySingleton<UpdateMyPokedexUseCase>(
        () => UpdateMyPokedexUseCase(myPokedexRepository: locator()));
  }
}
