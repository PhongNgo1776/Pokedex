import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:go_router/go_router.dart';
import 'package:phongngo.pokedex/route_paths.dart';
import 'package:phongngo.pokedex/screens/home_screen/home_screen.dart';
import 'package:phongngo.pokedex/screens/login_screen/form_submission_status.dart';
import 'package:phongngo.pokedex/screens/login_screen/login_bloc.dart';
import 'package:phongngo.pokedex/screens/login_screen/login_screen.dart';
import 'package:phongngo.pokedex/screens/search_pokemons_screen/domain/search_pokemons_use_case.dart';
import 'package:phongngo.pokedex/screens/search_pokemons_screen/presentation/search_pokemons_provider.dart';
import 'package:phongngo.pokedex/screens/search_pokemons_screen/presentation/search_pokemons_screen.dart';

final GoRouter router = GoRouter(
    routes: <RouteBase>[
      GoRoute(
        path: RoutePaths.login,
        builder: (BuildContext context, GoRouterState state) =>
            const LoginScreen(),
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
                      searchPokemonsUseCase: GetIt.instance<PokemonsUseCase>()),
                  child: const SearchPokemonsScreen());
            },
          ),
        ],
      ),
    ],
    redirect: (context, state) async {
      final isLoginPath = state.fullPath == RoutePaths.login;
      final isAuthenticated =
          context.read<LoginBloc>().state.formStatus is SubmissionSuccess;
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
