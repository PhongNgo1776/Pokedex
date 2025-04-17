import 'package:phongngo.pokedex/core/pokemons/domain/entities/pokemon_entity.dart';
import 'package:phongngo.pokedex/core/pokemons/presentation/pokemon_state.dart';

class MyPokedexState extends PokemonState {
  final List<PokemonEntity> pokedex;

  MyPokedexState({required this.pokedex});

  MyPokedexState copyWith({
    List<PokemonEntity>? pokedex,
  }) {
    return MyPokedexState(
      pokedex: pokedex ?? this.pokedex,
    );
  }

  @override
  List<Object?> get props => [pokedex];

  @override
  bool? get stringify => true;
}
