import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:phongngo.pokedex/helpers/helpers_.dart';
import 'package:phongngo.pokedex/route_paths.dart';

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
          leading: IconButton(
            icon: Icon(
              Icons.close,
              color: Colors.black,
              size: 30,
            ),
            onPressed: () => Helpers.onWillPop(context),
          ),
          centerTitle: true,
          title: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[]),
          iconTheme: IconThemeData(color: Colors.yellowAccent),
        ),
        body: Center(
          child: TextButton(
            child: Text(
              'Search Pokemons',
              style: TextStyle(
                fontSize: 20,
                color: Colors.white,
              ),
            ),
            onPressed: () => context.go(
              RoutePaths.searchPokemons,
            ),
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.blue,
              elevation: 1,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
