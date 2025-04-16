import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:phongngo.pokedex/core/authentication/presentation/authentication_bloc.dart';
import 'package:phongngo.pokedex/core/locators.dart';
import 'package:phongngo.pokedex/go_router.dart';
import 'package:phongngo.pokedex/screens/login_screen/domain/login_use_case.dart';

void main() {
  Locators.initialize();
  runApp(
    MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => AuthenticationBloc(
              loginUseCase: GetIt.instance<
                  LoginUseCase>()), // Use the instance name to get the correct use case
        ),
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
