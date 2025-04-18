import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:phongngo.pokedex/constants/offsets.dart';
import 'package:phongngo.pokedex/constants/spacings.dart';
import 'package:phongngo.pokedex/screens/search_pokemons_screen/presentation/search_pokemons_bloc.dart';
import 'package:phongngo.pokedex/screens/search_pokemons_screen/presentation/search_pokemons_event.dart';
import 'package:phongngo.pokedex/screens/search_pokemons_screen/presentation/search_pokemons_state.dart';
import 'package:phongngo.pokedex/screens/search_pokemons_screen/presentation/widgets/search_box.dart';
import 'package:phongngo.pokedex/screens/search_pokemons_screen/presentation/widgets/surprise_button.dart';
import 'package:phongngo.pokedex/widgets/pokemon_card.dart';

/// Stateful widget to fetch and then display pokedex content.
class SearchPokemonsScreen extends StatefulWidget {
  const SearchPokemonsScreen({super.key});

  @override
  State<SearchPokemonsScreen> createState() => _SearchPokemonsScreenState();
}

class _SearchPokemonsScreenState extends State<SearchPokemonsScreen> {
  final textEditingController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.grey.shade200,
        title: const Text('Search Pokemons'),
        centerTitle: true,
      ),
      backgroundColor: Colors.grey.shade200,
      body: SafeArea(
        child: Padding(
          padding: verticalInsetsBase,
          child: Column(
            children: [
              Padding(
                padding: horizontalInsetsBase,
                child: SearchBox(
                  searchTextEditingController: textEditingController,
                  onSearch: (searchText) {
                    context.read<SearchPokemonsBloc>().add(
                          SearchPokemonsEvent(idOrName: searchText),
                        );
                  },
                ),
              ),
              verticalSpaceBase,
              Expanded(
                child: BlocBuilder<SearchPokemonsBloc, SearchPokemonState>(
                  builder: (context, state) {
                    if (state is SearchPokemonLoading) {
                      return const Center(child: CircularProgressIndicator());
                    } else if (state is SearchPokemonLoaded) {
                      return PokemonCard(
                        pokemon: state.pokemon,
                        actionButton: IconButton(
                          icon: Icon(state.pokemon.isFavorite
                              ? Icons.favorite
                              : Icons.favorite_border),
                          onPressed: () =>
                              context.read<SearchPokemonsBloc>().add(
                                    ToggleFavoriteEvent(
                                      pokemon: state.pokemon,
                                      isFavorite: !state.pokemon.isFavorite,
                                    ),
                                  ),
                        ),
                      );
                    } else if (state is RandomPokemonsLoaded) {
                      return Scrollbar(
                        child: ListView.builder(
                            padding: horizontalInsetsBase,
                            itemBuilder: (_, index) => PokemonCard(
                                  key: ValueKey(state.pokedex[index].id),
                                  pokemon: state.pokedex[index],
                                  actionButton: IconButton(
                                    icon: Icon(state.pokedex[index].isFavorite
                                        ? Icons.favorite
                                        : Icons.favorite_border),
                                    onPressed: () =>
                                        context.read<SearchPokemonsBloc>().add(
                                              ToggleFavoriteEvent(
                                                pokemon: state.pokedex[index],
                                                isFavorite: !state
                                                    .pokedex[index].isFavorite,
                                              ),
                                            ),
                                  ),
                                ),
                            shrinkWrap: true,
                            itemCount: state.pokedex.length),
                      );
                    } else if (state is SearchPokemonError) {
                      return Text(state.error,
                          style: const TextStyle(color: Colors.red));
                    }
                    return const SizedBox.shrink();
                  },
                ),
              ),
              verticalSpaceBase,
              SurpriseButton(
                onPressed: () {
                  textEditingController.clear();
                  context
                      .read<SearchPokemonsBloc>()
                      .add(GetRandomPokemonsEvent());
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    textEditingController.dispose();
    super.dispose();
  }
}
