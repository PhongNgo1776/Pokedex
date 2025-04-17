import 'package:phongngo.pokedex/core/pokemons/domain/entities/pokemon_entity.dart';
import 'package:phongngo.pokedex/core/pokemons/presentation/pokemon_state.dart';

abstract class SearchPokemonState extends PokemonState {}

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
  final List<PokemonEntity> pokedex;

  RandomPokemonsLoaded({required this.pokedex});

  RandomPokemonsLoaded copyWith({
    List<PokemonEntity>? pokedex,
  }) {
    return RandomPokemonsLoaded(
      pokedex: pokedex ?? this.pokedex,
    );
  }

  @override
  List<Object?> get props => [pokedex];

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

class SavePokemonsLoaded extends SearchPokemonState {
  final PokemonEntity pokemon;

  SavePokemonsLoaded({required this.pokemon});

  SavePokemonsLoaded copyWith({
    PokemonEntity? pokemon,
  }) {
    return SavePokemonsLoaded(
      pokemon: pokemon ?? this.pokemon,
    );
  }

  @override
  List<Object?> get props => [pokemon];

  @override
  bool? get stringify => true;
}
