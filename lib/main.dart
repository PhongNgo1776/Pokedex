import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:phongngo.pokedex/go_router.dart';
import 'package:phongngo.pokedex/locators.dart';
import 'package:phongngo.pokedex/screens/login_screen/login_bloc.dart';

void main() {
  Locators.initialize();
  runApp(
    MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => LoginBloc()),
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
