import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:phongngo.pokedex/constants/border_radiuses.dart';
import 'package:phongngo.pokedex/constants/image_sizes.dart';
import 'package:phongngo.pokedex/constants/offsets.dart';
import 'package:phongngo.pokedex/constants/spacings.dart';
import 'package:phongngo.pokedex/core/pokemons/domain/entities/pokemon_entity.dart';

class PokemonCard extends StatelessWidget {
  final PokemonEntity pokemon;
  final Widget actionButton;
  const PokemonCard({
    super.key,
    required this.pokemon,
    required this.actionButton,
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
                      CachedNetworkImage(
                        cacheKey: pokemon.imageUrl,
                        imageUrl: pokemon.imageUrl,
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
                actionButton
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
