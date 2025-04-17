import 'package:phongngo.pokedex/core/pokemons/domain/entities/pokemon_entity.dart';
import 'package:phongngo.pokedex/core/pokemons/presentation/pokemon_event.dart';

abstract class MyPokedexScreenEvent extends PokemonEvent {
  const MyPokedexScreenEvent();

  @override
  List<Object> get props => [];
}

class ReOrderPokedexEvent extends MyPokedexScreenEvent {
  final int oldIndex;
  final int newIndex;

  const ReOrderPokedexEvent({
    required this.oldIndex,
    required this.newIndex,
  });

  @override
  List<Object> get props => [oldIndex, newIndex];
}

class DeletePokemonEvent extends MyPokedexScreenEvent {
  final PokemonEntity pokemon;

  const DeletePokemonEvent({
    required this.pokemon,
  });

  @override
  List<Object> get props => [pokemon];
}
