import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:phongngo.pokedex/constants/spacings.dart';
import 'package:phongngo.pokedex/helpers/helpers_.dart';
import 'package:phongngo.pokedex/route_paths.dart';
import 'package:phongngo.pokedex/screens/home_screen/widgets/avatar_button.dart';
import 'package:phongngo.pokedex/screens/home_screen/widgets/home_button.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return PopScope(
      onPopInvokedWithResult: (didPop, _) {
        if (didPop) Helpers.onWillPop(context);
      },
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Colors.grey.shade200,
          leading: IconButton(
            icon: Icon(
              Icons.close,
              color: Colors.black,
              size: 30,
            ),
            onPressed: () => Helpers.onWillPop(context),
          ),
          centerTitle: true,
          title: Text('Home screen'),
          iconTheme: IconThemeData(color: Colors.yellowAccent),
          actions: [AvatarButton(), horizontalSpaceBase],
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              verticalSpaceL,
              HomeButton(
                title: 'Search Pokemons',
                onPressed: () => context.go(RoutePaths.searchPokemons),
              ),
              verticalSpaceBase,
              HomeButton(
                title: 'My Pokemons',
                onPressed: () => context.go(RoutePaths.myPokedex),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
