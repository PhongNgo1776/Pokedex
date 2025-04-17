import 'package:equatable/equatable.dart';
import 'package:phongngo.pokedex/screens/search_pokemons_screen/domain/entities/pokemon_entity.dart';

abstract class SearchPokemonState implements Equatable {}

class SearchPokemonLoaded extends SearchPokemonState {
  final PokemonEntity pokemon;

  SearchPokemonLoaded({required this.pokemon});

  SearchPokemonLoaded copyWith({
    PokemonEntity? pokemon,
  }) {
    return SearchPokemonLoaded(
      pokemon: pokemon ?? this.pokemon,
    );
  }

  @override
  List<Object?> get props => [pokemon];

  @override
  bool? get stringify => true;
}

class RandomPokemonsLoaded extends SearchPokemonState {
  final List<PokemonEntity> pokemons;

  RandomPokemonsLoaded({required this.pokemons});

  RandomPokemonsLoaded copyWith({
    List<PokemonEntity>? pokemons,
  }) {
    return RandomPokemonsLoaded(
      pokemons: pokemons ?? this.pokemons,
    );
  }

  @override
  List<Object?> get props => [pokemons];

  @override
  bool? get stringify => true;
}

class SearchPokemonInit extends SearchPokemonState {
  @override
  bool? get stringify => true;

  @override
  List<Object?> get props => [];
}

class SearchPokemonLoading extends SearchPokemonState {
  @override
  bool? get stringify => true;

  @override
  List<Object?> get props => [];
}

class SearchPokemonError extends SearchPokemonState {
  final String error;

  SearchPokemonError({
    required this.error,
  });

  SearchPokemonError copyWith({
    String? error,
  }) {
    return SearchPokemonError(
      error: error ?? this.error,
    );
  }

  @override
  List<Object?> get props => [error];

  @override
  bool? get stringify => true;
}
