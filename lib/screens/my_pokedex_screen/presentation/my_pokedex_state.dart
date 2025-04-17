import 'package:phongngo.pokedex/core/pokemons/domain/entities/pokemon_entity.dart';
import 'package:phongngo.pokedex/core/pokemons/presentation/pokemon_state.dart';

class MyPokedexState extends PokemonState {
  final List<PokemonEntity> pokemons;

  MyPokedexState({required this.pokemons});

  MyPokedexState copyWith({
    List<PokemonEntity>? pokemons,
  }) {
    return MyPokedexState(
      pokemons: pokemons ?? this.pokemons,
    );
  }

  @override
  List<Object?> get props => [pokemons];

  @override
  bool? get stringify => true;
}
