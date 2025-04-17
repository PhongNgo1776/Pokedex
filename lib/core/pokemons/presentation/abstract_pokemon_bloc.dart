import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:phongngo.pokedex/core/pokemons/presentation/pokemon_event.dart';
import 'package:phongngo.pokedex/core/pokemons/presentation/pokemon_state.dart';

abstract class AbstractPokemonBloc<S extends PokemonState>
    extends Bloc<PokemonEvent, S> {
  AbstractPokemonBloc(S initialState) : super(initialState);
}
