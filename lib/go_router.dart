import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:go_router/go_router.dart';
import 'package:phongngo.pokedex/routes.dart';
import 'package:phongngo.pokedex/screens/home_screen/home_screen.dart';
import 'package:phongngo.pokedex/screens/search_pokemons/domain/search_pokemons_use_case.dart';
import 'package:phongngo.pokedex/screens/search_pokemons/presentation/search_pokemons_provider.dart';
import 'package:phongngo.pokedex/screens/search_pokemons/presentation/search_pokemons_screen.dart';

final GoRouter router = GoRouter(
  routes: <RouteBase>[
    GoRoute(
      path: Routes.home,
      builder: (BuildContext context, GoRouterState state) => HomeScreen(),
      routes: <RouteBase>[
        GoRoute(
          path: Routes.searchPokemons,
          builder: (BuildContext context, GoRouterState state) {
            return BlocProvider(
                create: (context) => SearchPokemonsBloc(
                    searchPokemonsUseCase: GetIt.instance<PokemonsUseCase>()),
                child: const SearchPokemonsScreen());
          },
        ),
      ],
    ),
  ],
);
