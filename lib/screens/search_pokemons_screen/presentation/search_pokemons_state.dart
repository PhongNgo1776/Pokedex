import 'package:equatable/equatable.dart';
import 'package:phongngo.pokedex/screens/search_pokemons_screen/domain/entities/pokemon_entity.dart';

class SearchPokemonsState implements Equatable {
  final bool isLoading;
  final List<PokemonEntity> pokemons;
  final String? error;

  const SearchPokemonsState({
    this.isLoading = true,
    this.pokemons = const [],
    this.error,
  });

  factory SearchPokemonsState.initial() {
    return const SearchPokemonsState();
  }

  SearchPokemonsState copyWith({
    bool? isLoading,
    List<PokemonEntity>? pokemons,
    String? error,
  }) {
    return SearchPokemonsState(
      isLoading: isLoading ?? this.isLoading,
      pokemons: pokemons ?? this.pokemons,
      error: error ?? this.error,
    );
  }

  @override
  List<Object?> get props => [isLoading, pokemons, error];

  @override
  bool? get stringify => true;
}
