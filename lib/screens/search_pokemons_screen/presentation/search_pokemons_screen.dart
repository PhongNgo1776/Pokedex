import 'package:flutter/material.dart';

/// Stateful widget to fetch and then display pokedex content.
class SearchPokemonsScreen extends StatefulWidget {
  const SearchPokemonsScreen({super.key});

  @override
  State<SearchPokemonsScreen> createState() => _SearchPokemonsScreenState();
}

class _SearchPokemonsScreenState extends State<SearchPokemonsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.grey.shade200,
        title: const Text('Search Pokemons'),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Center(
            child: Text('Search Pokemons'),
          )
        ],
      ),
    );
  }
}
