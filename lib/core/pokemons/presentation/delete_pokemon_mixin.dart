import 'package:get_it/get_it.dart';
import 'package:phongngo.pokedex/core/pokemons/domain/delete_pokemon_use_case.dart';
import 'package:phongngo.pokedex/core/pokemons/presentation/abstract_pokemon_bloc.dart';
import 'package:phongngo.pokedex/core/pokemons/presentation/pokemon_state.dart';

mixin DeletePokemonMixin<S extends PokemonState> on AbstractPokemonBloc<S> {
  final DeletePokemonUseCase deletePokemonUseCase =
      GetIt.I<DeletePokemonUseCase>();
}
