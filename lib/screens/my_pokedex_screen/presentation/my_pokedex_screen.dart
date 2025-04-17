import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:phongngo.pokedex/constants/offsets.dart';
import 'package:phongngo.pokedex/constants/spacings.dart';
import 'package:phongngo.pokedex/core/pokemons/presentation/pokemon_event.dart';
import 'package:phongngo.pokedex/screens/my_pokedex_screen/presentation/my_pokedex_bloc.dart';
import 'package:phongngo.pokedex/screens/my_pokedex_screen/presentation/my_pokedex_event.dart';
import 'package:phongngo.pokedex/screens/my_pokedex_screen/presentation/my_pokedex_state.dart';
import 'package:phongngo.pokedex/widgets/pokemon_card.dart';

/// Stateful widget to fetch and then display pokedex content.
class MyPokedexScreen extends StatelessWidget {
  const MyPokedexScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.grey.shade200,
        title: const Text('My Pokedex'),
        centerTitle: true,
      ),
      backgroundColor: Colors.grey.shade200,
      body: SafeArea(
        child: Padding(
          padding: verticalInsetsBase,
          child: Column(
            children: [
              verticalSpaceBase,
              Expanded(
                child: BlocBuilder<MyPokedexBloc, MyPokedexState>(
                  builder: (context, state) {
                    return state.pokedex.isNotEmpty
                        ? Scrollbar(
                            child: ReorderableListView.builder(
                              padding: horizontalInsetsBase,
                              itemBuilder: (_, index) => PokemonCard(
                                key: Key('$index'),
                                pokemon: state.pokedex[index],
                                onFavoriteToggle: (isFavorite) =>
                                    context.read<MyPokedexBloc>().add(
                                          ToggleFavoriteEvent(
                                            pokemon: state.pokedex[index],
                                            isFavorite: false,
                                          ),
                                        ),
                              ),
                              shrinkWrap: true,
                              itemCount: state.pokedex.length,
                              onReorder: (oldIndex, newIndex) {
                                if (oldIndex < newIndex) {
                                  newIndex -= 1;
                                }

                                context
                                    .read<MyPokedexBloc>()
                                    .add(ReOrderPokedexEvent(
                                      oldIndex: oldIndex,
                                      newIndex: newIndex,
                                    ));
                              },
                            ),
                          )
                        : Center(
                            child: Text('No pokemons found',
                                style: const TextStyle(color: Colors.red)),
                          );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
