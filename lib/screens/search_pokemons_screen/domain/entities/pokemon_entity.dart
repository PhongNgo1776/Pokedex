import 'package:equatable/equatable.dart';
import 'package:phongngo.pokedex/screens/search_pokemons_screen/data/pokemon_model.dart';

class PokemonEntity implements Equatable {
  final String id;
  final String name;
  final String imageUrl;
  final String generation;
  final String effectEntries;

  const PokemonEntity({
    required this.id,
    required this.name,
    required this.imageUrl,
    required this.generation,
    required this.effectEntries,
  });

  factory PokemonEntity.fromModel(PokemonModel model) {
    return PokemonEntity(
      id: model.id,
      name: model.name,
      imageUrl: model.imageUrl,
      generation: model.generation,
      effectEntries: model.effectEntries,
    );
  }

  @override
  List<Object?> get props => [
        id,
        name,
        imageUrl,
        generation,
        effectEntries,
      ];

  @override
  bool? get stringify => true;
}
