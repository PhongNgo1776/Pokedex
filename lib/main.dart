import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:phongngo.pokedex/core/authentication/domain/load_user_use_case.dart';
import 'package:phongngo.pokedex/core/authentication/domain/logout_use_case.dart';
import 'package:phongngo.pokedex/core/authentication/presentation/authentication_bloc.dart';
import 'package:phongngo.pokedex/core/locators.dart';
import 'package:phongngo.pokedex/go_router.dart';

void main() {
  Locators.initialize();
  runApp(
    MultiBlocProvider(
      providers: [
        BlocProvider(
            create: (context) => AuthenticationBloc(
                loadUserUseCase: GetIt.instance<
                    LoadUserUseCase>(), // Use the instance name to get the correct use case
                logOutUseCase: GetIt.instance<LogOutUseCase>())),
      ],
      child: MaterialApp.router(
        title: 'Pokedex',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(highlightColor: Colors.black),
        routerConfig: router,
      ),
    ),
  );
}
