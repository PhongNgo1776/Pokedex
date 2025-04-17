import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:phongngo.pokedex/screens/search_pokemons_screen/presentation/search_pokemons_event.dart';
import 'package:phongngo.pokedex/screens/search_pokemons_screen/presentation/search_pokemons_bloc.dart';
import 'package:phongngo.pokedex/screens/search_pokemons_screen/presentation/widgets/search_box.dart';

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
          SearchBox(
            onSearch: (searchText) {
              context.read<SearchPokemonsBloc>().add(
                    SearchPokemonsEvent(idOrName: searchText),
                  );
            },
          ),
          Expanded(
            child: ListView.builder(
              itemCount: 100, // Replace with your data length
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text('Pokemon #$index'), // Replace with your data
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
