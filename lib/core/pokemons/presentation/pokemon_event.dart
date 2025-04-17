import 'package:equatable/equatable.dart';
import 'package:phongngo.pokedex/core/pokemons/domain/entities/pokemon_entity.dart';

abstract class PokemonEvent extends Equatable {
  const PokemonEvent();

  @override
  List<Object> get props => [];
}

class ToggleFavoriteEvent extends PokemonEvent {
  final PokemonEntity pokemon;
  final bool isFavorite;

  const ToggleFavoriteEvent({
    required this.pokemon,
    required this.isFavorite,
  });

  @override
  List<Object> get props => [pokemon, isFavorite];
}
