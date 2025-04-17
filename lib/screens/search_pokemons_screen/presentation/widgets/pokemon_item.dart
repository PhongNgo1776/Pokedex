import 'package:flutter/material.dart';
import 'package:phongngo.pokedex/screens/search_pokemons_screen/domain/entities/pokemon_entity.dart';
import 'package:phongngo.pokedex/themes/border_radiuses.dart';
import 'package:phongngo.pokedex/themes/image_sizes.dart';
import 'package:phongngo.pokedex/themes/offsets.dart';
import 'package:phongngo.pokedex/themes/spacings.dart';

class PokemonItem extends StatelessWidget {
  final PokemonEntity pokemon;
  const PokemonItem({
    super.key,
    required this.pokemon,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.white,
      shape: RoundedRectangleBorder(
        borderRadius: roundedL,
      ),
      child: Padding(
        padding: allInsetsBase,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Expanded(
                  child: Row(
                    children: [
                      Image.network(
                        pokemon.imageUrl,
                        width: imageSize,
                        height: imageSize,
                      ),
                      horizontalSpaceXs,
                      Flexible(
                        child: Text(
                          pokemon.name,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 18),
                        ),
                      ),
                      horizontalSpaceXxs,
                      Text(
                        pokemon.generation?.name ?? '',
                        overflow: TextOverflow.ellipsis,
                      ),
                    ],
                  ),
                ),
                IconButton(
                  icon: const Icon(Icons.favorite),
                  onPressed: () {
                    // Handle favorite action
                  },
                ),
              ],
            ),
            Text(
              pokemon.effectEntries
                  .firstWhere((entry) => entry.language?.name == 'en')
                  .shortEffect,
            ),
          ],
        ),
      ),
    );
  }
}
