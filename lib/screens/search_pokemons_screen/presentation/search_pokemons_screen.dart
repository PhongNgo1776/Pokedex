import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:phongngo.pokedex/screens/search_pokemons_screen/presentation/search_pokemons_bloc.dart';
import 'package:phongngo.pokedex/screens/search_pokemons_screen/presentation/search_pokemons_event.dart';
import 'package:phongngo.pokedex/screens/search_pokemons_screen/presentation/search_pokemons_state.dart';
import 'package:phongngo.pokedex/screens/search_pokemons_screen/presentation/widgets/pokemon_item.dart';
import 'package:phongngo.pokedex/screens/search_pokemons_screen/presentation/widgets/search_box.dart';
import 'package:phongngo.pokedex/themes/offsets.dart';
import 'package:phongngo.pokedex/themes/spacings.dart';

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
      backgroundColor: Colors.grey.shade200,
      body: Padding(
        padding: allInsetsBase,
        child: Column(
          children: [
            SearchBox(
              onSearch: (searchText) {
                context.read<SearchPokemonsBloc>().add(
                      SearchPokemonsEvent(idOrName: searchText),
                    );
              },
            ),
            verticalSpaceBase,
            Expanded(
              child: SingleChildScrollView(
                child: BlocBuilder<SearchPokemonsBloc, SearchPokemonState>(
                  builder: (context, state) {
                    if (state is SearchPokemonLoading) {
                      return const Center(child: CircularProgressIndicator());
                    } else if (state is SearchPokemonLoaded) {
                      return PokemonItem(pokemon: state.pokemon);
                    } else if (state is SearchPokemonError) {
                      return Text(state.error,
                          style: const TextStyle(color: Colors.red));
                    }
                    return const SizedBox.shrink();
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
