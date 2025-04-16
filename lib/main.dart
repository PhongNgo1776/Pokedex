import 'package:flutter/material.dart';
import 'package:phongngo.pokedex/locators.dart';
import 'package:phongngo.pokedex/go_router.dart';

void main() {
  Locators.initialize();
  runApp(
    MaterialApp.router(
      title: 'Pokedex',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(highlightColor: Colors.black),
      routerConfig: router,
    ),
  );
}
