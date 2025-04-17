import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:go_router/go_router.dart';
import 'package:phongngo.pokedex/core/authentication/presentation/authentication_bloc.dart';
import 'package:phongngo.pokedex/core/pokemons/domain/delete_pokemon_use_case.dart';
import 'package:phongngo.pokedex/core/pokemons/domain/save_pokemon_use_case.dart';
import 'package:phongngo.pokedex/route_paths.dart';
import 'package:phongngo.pokedex/screens/home_screen/home_screen.dart';
import 'package:phongngo.pokedex/screens/login_screen/domain/login_use_case.dart';
import 'package:phongngo.pokedex/screens/login_screen/presentation/login_bloc.dart';
import 'package:phongngo.pokedex/screens/login_screen/presentation/login_screen.dart';
import 'package:phongngo.pokedex/screens/my_pokedex_screen/domain/get_my_pokedex_use_case.dart';
import 'package:phongngo.pokedex/screens/my_pokedex_screen/domain/update_my_pokedex_use_case.dart';
import 'package:phongngo.pokedex/screens/my_pokedex_screen/presentation/my_pokedex_bloc.dart';
import 'package:phongngo.pokedex/screens/my_pokedex_screen/presentation/my_pokedex_screen.dart';
import 'package:phongngo.pokedex/screens/search_pokemons_screen/domain/get_random_pokemon_use_case.dart';
import 'package:phongngo.pokedex/screens/search_pokemons_screen/domain/search_pokemons_use_case.dart';
import 'package:phongngo.pokedex/screens/search_pokemons_screen/presentation/search_pokemons_bloc.dart';
import 'package:phongngo.pokedex/screens/search_pokemons_screen/presentation/search_pokemons_screen.dart';

final GoRouter router = GoRouter(
    routes: <RouteBase>[
      GoRoute(
        path: RoutePaths.login,
        builder: (BuildContext context, GoRouterState state) => BlocProvider(
            create: (context) => LoginBloc(
                loginUseCase: GetIt.instance<LoginUseCase>(),
                authenticationBloc: context.read<AuthenticationBloc>()),
            child: const LoginScreen()),
      ),
      GoRoute(
        path: RoutePaths.home,
        builder: (BuildContext context, GoRouterState state) => HomeScreen(),
        routes: <RouteBase>[
          GoRoute(
            path: RoutePaths.searchPokemons,
            builder: (BuildContext context, GoRouterState state) {
              return BlocProvider(
                  create: (context) => SearchPokemonsBloc(
                      deletePokemonUseCase:
                          GetIt.instance<DeletePokemonUseCase>(),
                      savePokemonsUseCase: GetIt.instance<SavePokemonUseCase>(),
                      searchPokemonsUseCase:
                          GetIt.instance<SearchPokemonUseCase>(),
                      getRandomPokemonsUseCase:
                          GetIt.instance<GetRandomPokemonsUseCase>()),
                  child: const SearchPokemonsScreen());
            },
          ),
          GoRoute(
            path: RoutePaths.myPokedex,
            builder: (BuildContext context, GoRouterState state) {
              return BlocProvider(
                  create: (context) => MyPokedexBloc(
                      updateMyPokedexUseCase:
                          GetIt.instance<UpdateMyPokedexUseCase>(),
                      getMyPokedexUseCase:
                          GetIt.instance<GetMyPokedexUseCase>()),
                  child: const MyPokedexScreen());
            },
          ),
        ],
      ),
    ],
    redirect: (context, state) async {
      final isLoginPath = state.fullPath == RoutePaths.login;
      final isAuthenticated =
          context.read<AuthenticationBloc>().state.user != null;
      if (isLoginPath || isAuthenticated) {
        return null;
      } else {
        return RoutePaths.login;
      }
    },
    errorBuilder: (BuildContext context, GoRouterState state) {
      return const Scaffold(
        body: Center(
          child: Text('Error'),
        ),
      );
    });
