import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:phongngo.pokedex/constants/offsets.dart';
import 'package:phongngo.pokedex/constants/spacings.dart';
import 'package:phongngo.pokedex/core/pokemons/presentation/pokemon_event.dart';
import 'package:phongngo.pokedex/screens/my_pokedex_screen/presentation/my_pokedex_bloc.dart';
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
                    return state.pokemons.isNotEmpty
                        ? Scrollbar(
                            child: ListView.builder(
                                padding: horizontalInsetsBase,
                                itemBuilder: (_, index) => PokemonCard(
                                      key: ValueKey(state.pokemons[index].id),
                                      pokemon: state.pokemons[index],
                                      onFavoriteToggle: (isFavorite) => context
                                          .read<MyPokedexBloc>()
                                          .add(
                                            ToggleFavoriteEvent(
                                              pokemon: state.pokemons[index],
                                              isFavorite: false,
                                            ),
                                          ),
                                    ),
                                shrinkWrap: true,
                                itemCount: state.pokemons.length),
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
