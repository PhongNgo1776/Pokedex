import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:go_router/go_router.dart';
import 'package:phongngo.pokedex/helpers/helpers_.dart';
import 'package:phongngo.pokedex/routes.dart';
import 'package:shimmer/shimmer.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
    ]);
    super.initState();
  }

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
              children: <Widget>[
                Shimmer.fromColors(
                  baseColor: Colors.orange,
                  highlightColor: Colors.pinkAccent,
                  child: Text(
                    'Pokedex',
                  ),
                ),
              ]),
          iconTheme: IconThemeData(color: Colors.yellowAccent),
        ),
        body: Center(
          child: TextButton(
            child: Text(
              'Search Pokemons',
              style: TextStyle(
                fontSize: 20,
                color: Colors.black,
              ),
            ),
            onPressed: () => context.go(
              Routes.searchPokemons,
            ),
            style: TextButton.styleFrom(
              backgroundColor: Colors.grey,
              padding: EdgeInsets.all(20),
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
