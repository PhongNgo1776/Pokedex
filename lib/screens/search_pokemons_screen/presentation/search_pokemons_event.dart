import 'package:phongngo.pokedex/core/pokemons/domain/entities/pokemon_entity.dart';
import 'package:phongngo.pokedex/core/pokemons/presentation/pokemon_event.dart';

abstract class SearchPokemonsScreenEvent extends PokemonEvent {
  const SearchPokemonsScreenEvent();
}

class GetRandomPokemonsEvent extends SearchPokemonsScreenEvent {}

class SearchPokemonsEvent extends SearchPokemonsScreenEvent {
  final String idOrName;

  const SearchPokemonsEvent({
    required this.idOrName,
  });

  @override
  List<Object> get props => [idOrName];
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
